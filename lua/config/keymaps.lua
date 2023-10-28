-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "Q", ":q<CR>", { noremap = true, silent = true, desc = "quitModifyToQ" })
vim.keymap.set( { "i", "n","v" }, "<C-c>","y", { noremap = false,silent = true, desc = "yToCtrlC" })
vim.keymap.set( { "i", "n","v" }, "<C-v>","p", { noremap = false,silent = true, desc = "pToCtrlV" })
vim.keymap.set( "n", "<leader>wh","<C-w>b<C-w>H", { noremap = false,silent = true, desc = "AllHorizon" })
vim.keymap.set( "n", "<leader>wv","<C-w>b<C-w>K", { noremap = false,silent = true, desc = "AllVertical" })
vim.keymap.set( "n",  "<leader>h",":vs<CR>", { noremap = false,silent = true, desc = ":vs" })
vim.keymap.set( "n",  "<leader>v",":sp<CR>", { noremap = false,silent = true, desc = ":sp" })

    -- 设置 c-e 快捷键映射
vim.keymap.set('n', '<C-e>', ':lua CompileRunGcc()<CR>', { noremap = false,silent = true, desc = "runProgram" })

function CompileRunGcc()
    vim.cmd("w")
    local filetype = vim.bo.filetype

    if filetype == 'c' then
        vim.cmd([[
            set splitbelow
            sp
            res -5
            term gcc % -o %< && time ./%<
        ]])
    elseif filetype == 'cpp' then
        vim.cmd([[
            set splitbelow
            exec "!g++ -std=c++11 % -Wall -o %<"
            sp
            res -15
            term ./%<
        ]])
    elseif filetype == 'cs' then
        vim.cmd([[
            set splitbelow
            silent! exec "!mcs %"
            sp
            res -5
            term mono %<.exe
        ]])
    elseif filetype == 'java' then
        vim.cmd([[
            set splitbelow
            sp
            res -5
            term java % 
        ]])
    elseif filetype == 'sh' then
        vim.cmd("!time bash %")
    elseif filetype == 'python' then
        vim.cmd([[
            set splitbelow
            sp
            term python %
        ]])
    elseif filetype == 'html' then
        vim.cmd('silent! exec "!".g:mkdp_browser." % &"')
    elseif filetype == 'markdown' then
        vim.cmd("InstantMarkdownPreview")
    elseif filetype == 'tex' then
        vim.cmd([[
            silent! VimtexStop
            silent! VimtexCompile
        ]])
    elseif filetype == 'dart' then
        vim.cmd('exec "CocCommand flutter.run -d ".g:flutter_default_device." ".g:flutter_run_args')
        vim.cmd("silent! CocCommand flutter.dev.openDevLog")
    elseif filetype == 'javascript' then
        vim.cmd([[
            set splitbelow
            sp
            term export DEBUG="INFO,ERROR,WARNING"; node --trace-warnings .
        ]])
    elseif filetype == 'racket' then
        vim.cmd([[
            set splitbelow
            sp
            res -5
            term racket %
        ]])
    elseif filetype == 'go' then
        vim.cmd([[
            set splitbelow
            sp
            term go run .
        ]])

    end
end

return 


