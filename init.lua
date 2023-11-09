-- bootstrap lazy.nvim, LazyVim and your plugins
-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
-- vim.g.python3_host_prog = "D:\\Programming\\PackageManager\\Acaconda\\python.exe"
local im_select_exe = "D:\\BaiduSyncdisk\\Downloads\\im-select.exe"
local english_im = "1033"

-- 为了从插入模式返回时恢复原输入法，需要存储原输入法代码
-- 这里需要一个方式来获取当前的输入法代码，并存储它
-- 请替换 `your_default_im_code` 为你的默认输入法代码
local your_default_im_code = "2052"

-- 切换到英文输入法
local function switch_to_english()
  os.execute(im_select_exe .. " " .. english_im)
end

-- 切换回默认输入法
local function switch_to_default_im()
  os.execute(im_select_exe .. " " .. your_default_im_code)
end

-- 设置自动命令
vim.api.nvim_create_autocmd("InsertEnter", {
  pattern = "*",
  callback = switch_to_default_im,
})

vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  callback = switch_to_english,
})

vim.api.nvim_create_autocmd("VimEnter", {
  pattern = "*",
  callback = switch_to_english,
})

vim.api.nvim_create_autocmd("VimLeave", {
  pattern = "*",
  callback = switch_to_default_im,
})

vim.o.timeoutlen = 50
local cmp = require("cmp")
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
require("lspconfig").pyright.setup({
  cmd = { "C:\\Users\\a2286\\AppData\\Roaming\\npm\\pyright-langserver.cmd", "--stdio" },
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        venvPath = "D:\\Programming\\PackageManager\\Acaconda\\python.exe", -- 替换为您的虚拟环境的目录路径
      },
    },
  },
})
