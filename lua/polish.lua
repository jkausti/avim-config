-- if true then return end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- This will run last in the setup process.
-- This is just pure lua so anything that doesn't
-- fit in the normal config locations above can go here
--
--

-- Set the background to transparent
vim.cmd "hi Normal guibg=NONE ctermbg=NONE"
vim.cmd "hi CursorColumn cterm=NONE ctermbg=NONE ctermfg=NONE"
vim.cmd "hi CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE"
vim.cmd "hi CursorLineNr cterm=NONE ctermbg=NONE ctermbg=NONE"
vim.cmd "hi clear LineNr"
vim.cmd "hi clear SignColumn"
vim.cmd "hi clear StatusLine"
