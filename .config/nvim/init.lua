local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

vim.opt.scrolloff = 10
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"
vim.opt.guicursor = "n-v-c:ver25-blinkon1,i-ci-ve:ver25-blinkon1"
--vim.opt.number = true
--vim.opt.fillchars:append("eob: ")

require("vim-options")
require("lazy").setup("plugins")
