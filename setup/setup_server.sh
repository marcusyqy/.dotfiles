#!/bin/sh
#
# Bootstrap a Linux dev server with the tools I use.
#
# Usage:
#   ./setup/setup_server.sh            # install everything
#   ./setup/setup_server.sh nvim cargo # install only the named steps
#
# Steps: pi claude nvim cargo cargo_tools
#
# Re-running is safe: already-installed tools are skipped, except nvim
# nightly, which is always re-downloaded to pick up the latest build.

set -eu

LOCAL_BIN="$HOME/.local/bin"
CARGO_BIN="$HOME/.cargo/bin"

log() { printf '\033[1;34m==>\033[0m %s\n' "$*"; }
warn() { printf '\033[1;33mwarn:\033[0m %s\n' "$*" >&2; }
die() { printf '\033[1;31merror:\033[0m %s\n' "$*" >&2; exit 1; }

has() { command -v "$1" >/dev/null 2>&1; }

check_prereqs() {
    [ "$(uname -s)" = "Linux" ] || die "this script only supports Linux"
    has curl || die "curl is required"
    has wget || die "wget is required"

    mkdir -p "$LOCAL_BIN"

    # Make tools installed earlier in this run visible to later steps.
    PATH="$LOCAL_BIN:$CARGO_BIN:$PATH"
    export PATH
}

install_pi() {
    if has pi; then
        log "pi already installed, skipping"
        return
    fi
    log "installing pi"
    curl -fsSL https://pi.dev/install.sh | sh
}

install_claude() {
    if has claude; then
        log "claude code already installed, skipping"
        return
    fi
    log "installing claude code"
    curl -fsSL https://claude.ai/install.sh | bash
}

install_nvim() {
    case "$(uname -m)" in
        x86_64 | amd64) arch="x86_64" ;;
        aarch64 | arm64) arch="arm64" ;;
        *) die "unsupported architecture for nvim appimage: $(uname -m)" ;;
    esac

    url="https://github.com/neovim/neovim/releases/download/nightly/nvim-linux-${arch}.appimage"
    appimage="$LOCAL_BIN/nvim.appimage"

    log "downloading nvim nightly ($arch)"
    wget -q --show-progress -O "$appimage.tmp" "$url"
    chmod u+x "$appimage.tmp"
    mv "$appimage.tmp" "$appimage"

    # Try to run the AppImage directly. That needs FUSE (libfuse2), which
    # many servers and containers don't have, so fall back to extracting it.
    if "$appimage" --version >/dev/null 2>&1; then
        ln -sf "$appimage" "$LOCAL_BIN/nvim"
    else
        warn "FUSE unavailable, extracting appimage instead"
        extract_dir="$HOME/.local/share/nvim-appimage"
        rm -rf "$extract_dir"
        mkdir -p "$extract_dir"
        (cd "$extract_dir" && "$appimage" --appimage-extract >/dev/null)
        ln -sf "$extract_dir/squashfs-root/AppRun" "$LOCAL_BIN/nvim"
    fi

    "$LOCAL_BIN/nvim" --version | head -n 1
}

install_cargo() {
    if has cargo; then
        log "cargo already installed, skipping"
        return
    fi
    log "installing rust toolchain (rustup)"
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --no-modify-path
}

install_cargo_tools() {
    has cargo || die "cargo not found; run the 'cargo' step first"
    has cc || warn "no C compiler/linker (cc) found; cargo builds will likely fail (install build-essential / base-devel)"

    # crate name : binary name
    for pair in ripgrep:rg fd-find:fd tree-sitter-cli:tree-sitter; do
        crate="${pair%%:*}"
        bin="${pair##*:}"
        if has "$bin"; then
            log "$crate already installed, skipping"
            continue
        fi
        log "installing $crate"
        cargo install --locked "$crate"
    done
}

run_step() {
    case "$1" in
        pi) install_pi ;;
        claude) install_claude ;;
        nvim) install_nvim ;;
        cargo) install_cargo ;;
        cargo_tools) install_cargo_tools ;;
        *) die "unknown step: $1 (expected: pi claude nvim cargo cargo_tools)" ;;
    esac
}

main() {
    check_prereqs

    if [ "$#" -eq 0 ]; then
        set -- pi claude nvim cargo cargo_tools
    fi

    for step in "$@"; do
        run_step "$step"
    done

    log "done"
    cat <<EOF

Make sure these are on your PATH (e.g. in ~/.bashrc / ~/.zshrc):
    export PATH="\$HOME/.local/bin:\$HOME/.cargo/bin:\$PATH"
EOF
}

main "$@"
