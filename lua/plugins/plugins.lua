return {
  {
    "mbbill/undotree",
    cmd = "SymbolsOutline",
    keys = { { "U", "<cmd>UndotreeToggle<CR>", desc = "UndotreeToggle" } },
    config = function()
      vim.cmd("let g:undotree_SetFocusWhenToggle = 1")
      vim.cmd("let g:undotree_DiffAutoOpen = 1")
      vim.cmd("let g:undotree_DiffpanelHeight = 8")
      vim.cmd("let g:undotree_SplitWidth = 24")
      vim.cmd("let g:undotree_ShortIndicators = 1")
      vim.cmd("let g:undotree_WindowLayout = 2")
    end,
  },
  {
    "gcmt/wildfire.vim",
    -- 可能需要更正这个命令，使其与 wildfire 插件匹配
    -- 暂时我会删除它，因为我不确定 wildfire 插件有哪个命令与之关联
    config = function()
      vim.cmd([[
      let g:wildfire_objects = {
        \ "*" : ["i'", 'i"', "i)", "i]", "i}", "ip", "it"],
        \ "html,xml" : ["at", "it"]
      \ }
      ]])
    end,
  },
  {
    "mg979/vim-visual-multi",
  },
  {
    "ggandor/leap.nvim",
    keys = {
    -- 禁用 leap.nvim 插件中的 s 和 S 映射
    {"s", false},
    {"S", false},
    },
  },
  {
    "folke/flash.nvim",
    enabled = true,
  },
}
