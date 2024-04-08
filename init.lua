require("mahl")

-- vim.g.monotone_color = { 0, 0, 0 }
vim.g.monotone_secondary_hue_offset = 200
vim.g.monotone_emphasize_comments = 1
vim.g.monotone_emphasize_whitespace = 1

-- call s:Hi('MatchParen', s:color_hl_2, s:color_dark_3, 214, 16, 'NONE')
vim.cmd("colorscheme monotone")
