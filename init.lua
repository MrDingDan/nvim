-- bootstrap lazy.nvim, LazyVim and your plugins
-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
-- vim.g.python3_host_prog = "D:\\Programming\\PackageManager\\Acaconda\\python.exe"

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
