-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/marcus.yong/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/marcus.yong/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/marcus.yong/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/marcus.yong/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/marcus.yong/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Jenkinsfile-vim-syntax"] = {
    loaded = true,
    path = "/home/marcus.yong/.local/share/nvim/site/pack/packer/start/Jenkinsfile-vim-syntax",
    url = "https://github.com/martinda/Jenkinsfile-vim-syntax"
  },
  LuaSnip = {
    loaded = true,
    path = "/home/marcus.yong/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["asyncrun.vim"] = {
    loaded = true,
    path = "/home/marcus.yong/.local/share/nvim/site/pack/packer/start/asyncrun.vim",
    url = "https://github.com/skywind3000/asyncrun.vim"
  },
  ["asynctasks.vim"] = {
    loaded = true,
    path = "/home/marcus.yong/.local/share/nvim/site/pack/packer/start/asynctasks.vim",
    url = "https://github.com/skywind3000/asynctasks.vim"
  },
  ["auto-session"] = {
    loaded = true,
    path = "/home/marcus.yong/.local/share/nvim/site/pack/packer/start/auto-session",
    url = "https://github.com/rmagatti/auto-session"
  },
  ["ayu-vim"] = {
    loaded = true,
    path = "/home/marcus.yong/.local/share/nvim/site/pack/packer/start/ayu-vim",
    url = "https://github.com/ayu-theme/ayu-vim"
  },
  catppuccin = {
    loaded = true,
    path = "/home/marcus.yong/.local/share/nvim/site/pack/packer/start/catppuccin",
    url = "https://github.com/catppuccin/nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/marcus.yong/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/marcus.yong/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/home/marcus.yong/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/marcus.yong/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/marcus.yong/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["dressing.nvim"] = {
    loaded = true,
    path = "/home/marcus.yong/.local/share/nvim/site/pack/packer/start/dressing.nvim",
    url = "https://github.com/stevearc/dressing.nvim"
  },
  ["git-worktree.nvim"] = {
    loaded = true,
    path = "/home/marcus.yong/.local/share/nvim/site/pack/packer/start/git-worktree.nvim",
    url = "https://github.com/theprimeagen/git-worktree.nvim"
  },
  ["gruvbox-baby"] = {
    loaded = true,
    path = "/home/marcus.yong/.local/share/nvim/site/pack/packer/start/gruvbox-baby",
    url = "https://github.com/luisiacc/gruvbox-baby"
  },
  harpoon = {
    loaded = true,
    path = "/home/marcus.yong/.local/share/nvim/site/pack/packer/start/harpoon",
    url = "https://github.com/theprimeagen/harpoon"
  },
  ["hydra.nvim"] = {
    loaded = true,
    path = "/home/marcus.yong/.local/share/nvim/site/pack/packer/start/hydra.nvim",
    url = "https://github.com/anuvyklack/hydra.nvim"
  },
  ["keymap-layer.nvim"] = {
    loaded = true,
    path = "/home/marcus.yong/.local/share/nvim/site/pack/packer/start/keymap-layer.nvim",
    url = "https://github.com/anuvyklack/keymap-layer.nvim"
  },
  ["lsp-colors.nvim"] = {
    loaded = true,
    path = "/home/marcus.yong/.local/share/nvim/site/pack/packer/start/lsp-colors.nvim",
    url = "https://github.com/folke/lsp-colors.nvim"
  },
  ["lsp_extensions.nvim"] = {
    loaded = true,
    path = "/home/marcus.yong/.local/share/nvim/site/pack/packer/start/lsp_extensions.nvim",
    url = "https://github.com/nvim-lua/lsp_extensions.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/home/marcus.yong/.local/share/nvim/site/pack/packer/start/lspkind-nvim",
    url = "https://github.com/onsails/lspkind-nvim"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "/home/marcus.yong/.local/share/nvim/site/pack/packer/start/lspsaga.nvim",
    url = "https://github.com/glepnir/lspsaga.nvim"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "/home/marcus.yong/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["neo-tree.nvim"] = {
    config = { "\27LJ\2\n�\20\0\0\a\0?\0_6\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\0\0009\0\3\0009\0\4\0'\2\5\0005\3\6\0B\0\3\0016\0\0\0009\0\3\0009\0\4\0'\2\a\0005\3\b\0B\0\3\0016\0\0\0009\0\3\0009\0\4\0'\2\t\0005\3\n\0B\0\3\0016\0\0\0009\0\3\0009\0\4\0'\2\v\0005\3\f\0B\0\3\0016\0\r\0'\2\14\0B\0\2\0029\0\15\0005\2\16\0005\3\18\0005\4\17\0=\4\19\0035\4\20\0=\4\21\0035\4\22\0=\4\23\0035\4\24\0=\4\25\0035\4\26\0=\4\27\0035\4\29\0005\5\28\0=\5\30\4=\4\31\3=\3 \0025\3!\0005\4\"\0=\4#\0035\4%\0005\5$\0=\5&\0045\5'\0005\6(\0=\6)\5=\5*\4=\4+\3=\3,\0024\3\0\0=\3-\0025\0032\0005\4.\0004\5\0\0=\5/\0044\5\0\0=\0050\0044\5\0\0=\0051\4=\0043\0035\0045\0005\0054\0=\5+\4=\4,\3=\0036\0025\0037\0005\0049\0005\0058\0=\5+\4=\4,\3=\3:\0025\3=\0005\4;\0005\5<\0=\5+\4=\4,\3=\3\31\2B\0\2\0016\0\0\0009\0\1\0'\2>\0B\0\2\1K\0\1\0'nnoremap <C-n> :Neotree reveal<cr>\1\0\0\1\0\a\agc\15git_commit\6A\16git_add_all\agr\20git_revert_file\agp\rgit_push\aga\17git_add_file\agg\24git_commit_and_push\agu\21git_unstage_file\1\0\1\rposition\nfloat\fbuffers\1\0\0\1\0\3\abd\18buffer_delete\t<bs>\16navigate_up\6.\rset_root\1\0\3\18show_unloaded\2\21group_empty_dirs\2\24follow_current_file\2\15filesystem\1\0\0\1\0\t\a[g\22prev_git_modified\t<bs>\16navigate_up\6f\21filter_on_submit\a]g\22next_git_modified\6.\rset_root\6/\17fuzzy_finder\n<c-x>\17clear_filter\6D\27fuzzy_finder_directory\6H\18toggle_hidden\19filtered_items\1\0\4\24follow_current_file\1\27use_libuv_file_watcher\1\26hijack_netrw_behavior\17open_default\21group_empty_dirs\1\15never_show\20hide_by_pattern\17hide_by_name\1\0\4\16hide_hidden\1\20hide_gitignored\1\18hide_dotfiles\1\fvisible\2\18nesting_rules\vwindow\rmappings\6a\vconfig\1\0\1\14show_path\tnone\1\2\0\0\badd\f<space>\1\0\19\6d\vdelete\6s\16open_vsplit\6A\18add_directory\6z\20close_all_nodes\6c\tcopy\6q\17close_window\6?\14show_help\6w\28open_with_window_picker\6C\15close_node\6S\15open_split\t<cr>\topen\18<2-LeftMouse>\topen\6R\frefresh\6t\16open_tabnew\6m\tmove\6p\25paste_from_clipboard\6x\21cut_to_clipboard\6y\22copy_to_clipboard\6r\vrename\1\2\1\0\16toggle_node\vnowait\1\20mapping_options\1\0\2\fnoremap\2\vnowait\2\1\0\2\nwidth\3(\rposition\fcurrent\30default_component_configs\15git_status\fsymbols\1\0\0\1\0\t\runstaged\b\rmodified\b\fignored\b\14untracked\b\frenamed\b\fdeleted\b✖\nadded\b✚\rconflict\b\vstaged\b\tname\1\0\3\19trailing_slash\1\14highlight\20NeoTreeFileName\26use_git_status_colors\2\rmodified\1\0\2\vsymbol\b[+]\14highlight\20NeoTreeModified\ticon\1\0\5\18folder_closed\b\14highlight\20NeoTreeFileIcon\fdefault\6*\17folder_empty\b\16folder_open\b\vindent\1\0\t\23expander_highlight\20NeoTreeExpander\23last_indent_marker\b└\18indent_marker\b│\17with_markers\2\fpadding\3\1\16indent_size\3\2\14highlight\24NeoTreeIndentMarker\22expander_expanded\b\23expander_collapsed\b\14container\1\0\0\1\0\1\26enable_character_fade\2\1\0\5\22enable_git_status\2\23popup_border_style\frounded\25close_if_last_window\1\26sort_case_insensitive\1\23enable_diagnostics\2\nsetup\rneo-tree\frequire\1\0\2\ttext\b\vtexthl\23DiagnosticSignHint\23DiagnosticSignHint\1\0\2\ttext\t \vtexthl\23DiagnosticSignInfo\23DiagnosticSignInfo\1\0\2\ttext\t \vtexthl\23DiagnosticSignWarn\23DiagnosticSignWarn\1\0\2\ttext\t \vtexthl\24DiagnosticSignError\24DiagnosticSignError\16sign_define\afn0 let g:neo_tree_remove_legacy_commands = 1 \bcmd\bvim\0" },
    loaded = true,
    path = "/home/marcus.yong/.local/share/nvim/site/pack/packer/start/neo-tree.nvim",
    url = "https://github.com/nvim-neo-tree/neo-tree.nvim"
  },
  neoformat = {
    loaded = true,
    path = "/home/marcus.yong/.local/share/nvim/site/pack/packer/start/neoformat",
    url = "https://github.com/sbdchd/neoformat"
  },
  nerdcommenter = {
    loaded = true,
    path = "/home/marcus.yong/.local/share/nvim/site/pack/packer/start/nerdcommenter",
    url = "https://github.com/preservim/nerdcommenter"
  },
  ["nui.nvim"] = {
    loaded = true,
    path = "/home/marcus.yong/.local/share/nvim/site/pack/packer/start/nui.nvim",
    url = "https://github.com/MunifTanjim/nui.nvim"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/home/marcus.yong/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-dap"] = {
    loaded = true,
    path = "/home/marcus.yong/.local/share/nvim/site/pack/packer/start/nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap"
  },
  ["nvim-dap-ui"] = {
    loaded = true,
    path = "/home/marcus.yong/.local/share/nvim/site/pack/packer/start/nvim-dap-ui",
    url = "https://github.com/rcarriga/nvim-dap-ui"
  },
  ["nvim-dap-virtual-text"] = {
    loaded = true,
    path = "/home/marcus.yong/.local/share/nvim/site/pack/packer/start/nvim-dap-virtual-text",
    url = "https://github.com/theHamsta/nvim-dap-virtual-text"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/marcus.yong/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "/home/marcus.yong/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/marcus.yong/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/marcus.yong/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["nvim-window-picker"] = {
    config = { "\27LJ\2\n�\1\0\0\6\0\f\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\t\0005\4\5\0005\5\4\0=\5\6\0045\5\a\0=\5\b\4=\4\n\3=\3\v\2B\0\2\1K\0\1\0\17filter_rules\abo\1\0\0\fbuftype\1\2\0\0\rterminal\rfiletype\1\0\0\1\5\0\0\rneo-tree\19neo-tree-popup\vnotify\rquickfix\1\0\3\20include_current\1\19autoselect_one\2\23other_win_hl_color\f#e35e4f\nsetup\18window-picker\frequire\0" },
    loaded = true,
    path = "/home/marcus.yong/.local/share/nvim/site/pack/packer/start/nvim-window-picker",
    url = "https://github.com/s1n7ax/nvim-window-picker"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/marcus.yong/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/marcus.yong/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/marcus.yong/.local/share/nvim/site/pack/packer/start/popup.nvim",
    url = "https://github.com/nvim-lua/popup.nvim"
  },
  ["telescope-asynctasks.nvim"] = {
    loaded = true,
    path = "/home/marcus.yong/.local/share/nvim/site/pack/packer/start/telescope-asynctasks.nvim",
    url = "https://github.com/GustavoKatel/telescope-asynctasks.nvim"
  },
  ["telescope-file-browser.nvim"] = {
    loaded = true,
    path = "/home/marcus.yong/.local/share/nvim/site/pack/packer/start/telescope-file-browser.nvim",
    url = "https://github.com/nvim-telescope/telescope-file-browser.nvim"
  },
  ["telescope-fzy-native.nvim"] = {
    loaded = true,
    path = "/home/marcus.yong/.local/share/nvim/site/pack/packer/start/telescope-fzy-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzy-native.nvim"
  },
  ["telescope-project.nvim"] = {
    loaded = true,
    path = "/home/marcus.yong/.local/share/nvim/site/pack/packer/start/telescope-project.nvim",
    url = "https://github.com/nvim-telescope/telescope-project.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/marcus.yong/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["tokyonight.nvim"] = {
    loaded = true,
    path = "/home/marcus.yong/.local/share/nvim/site/pack/packer/start/tokyonight.nvim",
    url = "https://github.com/folke/tokyonight.nvim"
  },
  ["vim-floaterm"] = {
    loaded = true,
    path = "/home/marcus.yong/.local/share/nvim/site/pack/packer/start/vim-floaterm",
    url = "https://github.com/voldikss/vim-floaterm"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/marcus.yong/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/home/marcus.yong/.local/share/nvim/site/pack/packer/start/vim-repeat",
    url = "https://github.com/tpope/vim-repeat"
  },
  ["vim-rhubarb"] = {
    loaded = true,
    path = "/home/marcus.yong/.local/share/nvim/site/pack/packer/start/vim-rhubarb",
    url = "https://github.com/tpope/vim-rhubarb"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/marcus.yong/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  ["vim-svelte"] = {
    loaded = true,
    path = "/home/marcus.yong/.local/share/nvim/site/pack/packer/start/vim-svelte",
    url = "https://github.com/evanleck/vim-svelte"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-window-picker
time([[Config for nvim-window-picker]], true)
try_loadstring("\27LJ\2\n�\1\0\0\6\0\f\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\t\0005\4\5\0005\5\4\0=\5\6\0045\5\a\0=\5\b\4=\4\n\3=\3\v\2B\0\2\1K\0\1\0\17filter_rules\abo\1\0\0\fbuftype\1\2\0\0\rterminal\rfiletype\1\0\0\1\5\0\0\rneo-tree\19neo-tree-popup\vnotify\rquickfix\1\0\3\20include_current\1\19autoselect_one\2\23other_win_hl_color\f#e35e4f\nsetup\18window-picker\frequire\0", "config", "nvim-window-picker")
time([[Config for nvim-window-picker]], false)
-- Config for: neo-tree.nvim
time([[Config for neo-tree.nvim]], true)
try_loadstring("\27LJ\2\n�\20\0\0\a\0?\0_6\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\0\0009\0\3\0009\0\4\0'\2\5\0005\3\6\0B\0\3\0016\0\0\0009\0\3\0009\0\4\0'\2\a\0005\3\b\0B\0\3\0016\0\0\0009\0\3\0009\0\4\0'\2\t\0005\3\n\0B\0\3\0016\0\0\0009\0\3\0009\0\4\0'\2\v\0005\3\f\0B\0\3\0016\0\r\0'\2\14\0B\0\2\0029\0\15\0005\2\16\0005\3\18\0005\4\17\0=\4\19\0035\4\20\0=\4\21\0035\4\22\0=\4\23\0035\4\24\0=\4\25\0035\4\26\0=\4\27\0035\4\29\0005\5\28\0=\5\30\4=\4\31\3=\3 \0025\3!\0005\4\"\0=\4#\0035\4%\0005\5$\0=\5&\0045\5'\0005\6(\0=\6)\5=\5*\4=\4+\3=\3,\0024\3\0\0=\3-\0025\0032\0005\4.\0004\5\0\0=\5/\0044\5\0\0=\0050\0044\5\0\0=\0051\4=\0043\0035\0045\0005\0054\0=\5+\4=\4,\3=\0036\0025\0037\0005\0049\0005\0058\0=\5+\4=\4,\3=\3:\0025\3=\0005\4;\0005\5<\0=\5+\4=\4,\3=\3\31\2B\0\2\0016\0\0\0009\0\1\0'\2>\0B\0\2\1K\0\1\0'nnoremap <C-n> :Neotree reveal<cr>\1\0\0\1\0\a\agc\15git_commit\6A\16git_add_all\agr\20git_revert_file\agp\rgit_push\aga\17git_add_file\agg\24git_commit_and_push\agu\21git_unstage_file\1\0\1\rposition\nfloat\fbuffers\1\0\0\1\0\3\abd\18buffer_delete\t<bs>\16navigate_up\6.\rset_root\1\0\3\18show_unloaded\2\21group_empty_dirs\2\24follow_current_file\2\15filesystem\1\0\0\1\0\t\a[g\22prev_git_modified\t<bs>\16navigate_up\6f\21filter_on_submit\a]g\22next_git_modified\6.\rset_root\6/\17fuzzy_finder\n<c-x>\17clear_filter\6D\27fuzzy_finder_directory\6H\18toggle_hidden\19filtered_items\1\0\4\24follow_current_file\1\27use_libuv_file_watcher\1\26hijack_netrw_behavior\17open_default\21group_empty_dirs\1\15never_show\20hide_by_pattern\17hide_by_name\1\0\4\16hide_hidden\1\20hide_gitignored\1\18hide_dotfiles\1\fvisible\2\18nesting_rules\vwindow\rmappings\6a\vconfig\1\0\1\14show_path\tnone\1\2\0\0\badd\f<space>\1\0\19\6d\vdelete\6s\16open_vsplit\6A\18add_directory\6z\20close_all_nodes\6c\tcopy\6q\17close_window\6?\14show_help\6w\28open_with_window_picker\6C\15close_node\6S\15open_split\t<cr>\topen\18<2-LeftMouse>\topen\6R\frefresh\6t\16open_tabnew\6m\tmove\6p\25paste_from_clipboard\6x\21cut_to_clipboard\6y\22copy_to_clipboard\6r\vrename\1\2\1\0\16toggle_node\vnowait\1\20mapping_options\1\0\2\fnoremap\2\vnowait\2\1\0\2\nwidth\3(\rposition\fcurrent\30default_component_configs\15git_status\fsymbols\1\0\0\1\0\t\runstaged\b\rmodified\b\fignored\b\14untracked\b\frenamed\b\fdeleted\b✖\nadded\b✚\rconflict\b\vstaged\b\tname\1\0\3\19trailing_slash\1\14highlight\20NeoTreeFileName\26use_git_status_colors\2\rmodified\1\0\2\vsymbol\b[+]\14highlight\20NeoTreeModified\ticon\1\0\5\18folder_closed\b\14highlight\20NeoTreeFileIcon\fdefault\6*\17folder_empty\b\16folder_open\b\vindent\1\0\t\23expander_highlight\20NeoTreeExpander\23last_indent_marker\b└\18indent_marker\b│\17with_markers\2\fpadding\3\1\16indent_size\3\2\14highlight\24NeoTreeIndentMarker\22expander_expanded\b\23expander_collapsed\b\14container\1\0\0\1\0\1\26enable_character_fade\2\1\0\5\22enable_git_status\2\23popup_border_style\frounded\25close_if_last_window\1\26sort_case_insensitive\1\23enable_diagnostics\2\nsetup\rneo-tree\frequire\1\0\2\ttext\b\vtexthl\23DiagnosticSignHint\23DiagnosticSignHint\1\0\2\ttext\t \vtexthl\23DiagnosticSignInfo\23DiagnosticSignInfo\1\0\2\ttext\t \vtexthl\23DiagnosticSignWarn\23DiagnosticSignWarn\1\0\2\ttext\t \vtexthl\24DiagnosticSignError\24DiagnosticSignError\16sign_define\afn0 let g:neo_tree_remove_legacy_commands = 1 \bcmd\bvim\0", "config", "neo-tree.nvim")
time([[Config for neo-tree.nvim]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
