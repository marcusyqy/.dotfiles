/**
 * 3forge header: pixel-art logo (3 orange / 2 teal / 1 light-blue mark + 3FORGE
 * wordmark) rendered with half-block glyphs in the official brand colours.
 * Leaves the background transparent so the terminal background image shows.
 * `/builtin-header` restores Pi's default header.
 */

import type { ExtensionAPI, Theme } from "@earendil-works/pi-coding-agent";
import { VERSION } from "@earendil-works/pi-coding-agent";
import { truncateToWidth } from "@earendil-works/pi-tui";

type RGB = [number, number, number];
const ORANGE: RGB = [241, 105, 0];
const TEAL: RGB = [14, 145, 187];
const TEAL_LIGHT: RGB = [119, 206, 250];
const WHITE: RGB = [237, 242, 255];

// 7x11 pixel font, stroke 2, approximating the 3forge wordmark.
const FONT: Record<string, string[]> = {
	"3": ["#######", "#######", "....##.", "...##..", "..####.", "....###", ".....##", ".....##", "##...##", "#######", ".#####."],
	F: ["#######", "#######", "##.....", "##.....", "######.", "######.", "##.....", "##.....", "##.....", "##.....", "##....."],
	O: [".#####.", "#######", "##...##", "##...##", "##...##", "##...##", "##...##", "##...##", "##...##", "#######", ".#####."],
	R: ["######.", "#######", "##...##", "##...##", "#######", "######.", "##.##..", "##..##.", "##..##.", "##...##", "##...##"],
	G: [".#####.", "#######", "##.....", "##.....", "##.####", "##.####", "##...##", "##...##", "##...##", "#######", ".#####."],
	E: ["#######", "#######", "##.....", "##.....", "######.", "######.", "##.....", "##.....", "##.....", "#######", "#######"],
};

const ROWS = 12; // 11 px art + 1 px padding -> 6 terminal rows

function buildBitmap(): (RGB | null)[][] {
	const markW = 11;
	const gap = 4;
	const letterGap = 2;
	const word = "3FORGE";
	const width = markW + gap + word.length * (7 + letterGap) - letterGap;
	const bmp: (RGB | null)[][] = Array.from({ length: ROWS }, () => Array<RGB | null>(width).fill(null));

	// Mark: 3x3 grid of 3px squares with 1px gaps.
	const squares: [number, number, RGB][] = [
		[0, 0, ORANGE], [1, 0, ORANGE], [2, 0, ORANGE],
		[0, 1, TEAL], [1, 1, TEAL],
		[0, 2, TEAL_LIGHT],
	];
	for (const [cx, cy, c] of squares) {
		for (let y = 0; y < 3; y++) for (let x = 0; x < 3; x++) bmp[cy * 4 + y][cx * 4 + x] = c;
	}

	let ox = markW + gap;
	for (const ch of word) {
		const glyph = FONT[ch];
		for (let y = 0; y < glyph.length; y++) {
			for (let x = 0; x < 7; x++) if (glyph[y][x] === "#") bmp[y][ox + x] = WHITE;
		}
		ox += 7 + letterGap;
	}
	return bmp;
}

const fg = ([r, g, b]: RGB) => `\x1b[38;2;${r};${g};${b}m`;
const bg = ([r, g, b]: RGB) => `\x1b[48;2;${r};${g};${b}m`;
const RESET = "\x1b[0m";

function renderBitmap(bmp: (RGB | null)[][], indent: string): string[] {
	const lines: string[] = [];
	for (let y = 0; y < bmp.length; y += 2) {
		let line = indent;
		for (let x = 0; x < bmp[y].length; x++) {
			const top = bmp[y][x];
			const bottom = bmp[y + 1]?.[x] ?? null;
			if (top && bottom) line += `${fg(top)}${bg(bottom)}▀${RESET}`;
			else if (top) line += `${fg(top)}▀${RESET}`;
			else if (bottom) line += `${fg(bottom)}▄${RESET}`;
			else line += " ";
		}
		lines.push(line);
	}
	return lines;
}

const LOGO = renderBitmap(buildBitmap(), "  ");
const LOGO_WIDTH = 2 + buildBitmap()[0].length;

function header(theme: Theme, width: number): string[] {
	const tag = `  ${theme.fg("accent", "●")} ${theme.fg("mdLink", "Institutional. Real-time. Proven.")}`;
	const meta = `  ${theme.fg("dim", `pi v${VERSION}`)}${theme.fg("borderMuted", "  │  ")}${theme.fg("muted", "/ commands · @ files · ! bash · /hotkeys")}`;
	const art =
		width >= LOGO_WIDTH
			? LOGO
			: [`  ${fg(ORANGE)}■■■${RESET} ${fg(TEAL)}■■${RESET} ${fg(TEAL_LIGHT)}■${RESET}  ${theme.bold(theme.fg("text", "3FORGE"))}`];
	return ["", ...art, "", tag, meta, ""].map((l) => truncateToWidth(l, width));
}

export default function (pi: ExtensionAPI) {
	pi.on("session_start", async (_event, ctx) => {
		if (ctx.mode !== "tui") return;
		ctx.ui.setHeader((_tui, theme) => ({
			render: (width: number) => header(theme, width),
			invalidate() {},
		}));
	});

	pi.registerCommand("builtin-header", {
		description: "Restore Pi's built-in header",
		handler: async (_args, ctx) => {
			ctx.ui.setHeader(undefined);
			ctx.ui.notify("Built-in header restored", "info");
		},
	});
}

