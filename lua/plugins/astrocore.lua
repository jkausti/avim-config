-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 256, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics = { virtual_text = true, virtual_lines = false }, -- diagnostic settings on startup
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- passed to `vim.filetype.add`
    filetypes = {
      -- see `:h vim.filetype.add` for usage
      extension = {
        foo = "fooscript",
      },
      filename = {
        [".foorc"] = "fooscript",
      },
      pattern = {
        [".*/etc/foo/.*"] = "fooscript",
      },
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "yes", -- sets vim.opt.signcolumn to yes
        wrap = false, -- sets vim.opt.wrap
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- first key is the mode
      n = {
        -- disabled
        ["."] = false,
        ["<Leader>h"] = false,
        ["<Leader>j"] = false,
        ["<Leader>k"] = false,
        ["<Leader>l"] = false,

        -- disable unnecessary lsp mappings
        ["<Leader>li"] = false,
        ["<Leader>lI"] = false,
        ["<Leader>lf"] = false,
        ["<Leader>lS"] = false,
        ["<Leader>ld"] = false,
        ["<Leader>lD"] = false,
        ["<Leader>la"] = false,
        ["<Leader>lA"] = false,
        ["<Leader>lr"] = false,
        ["<Leader>lR"] = false,
        ["<Leader>ls"] = false,
        ["<Leader>lG"] = false,

        -- lsp mappings
        ["<Leader>gD"] = { function() vim.lsp.buf.definition() end, desc = "Go to definition" },
        ["<Leader>gd"] = { function() vim.lsp.buf.declaration() end, desc = "Go to declaration" },
        ["<Leader>vca"] = { function() vim.lsp.buf.code_action() end, desc = "Code Actions" },
        ["<Leader>vd"] = { function() vim.diagnostic.open_float() end, desc = "Open Diagnostics Float" },
        ["K"] = { function() vim.lsp.buf.hover() end, desc = "LSP Hover" },
        ["<Leader>rn"] = { function() vim.lsp.buf.rename() end, desc = "LSP Rename" },

        -- keep cursor in middle when jumping up and down
        ["<C-d>"] = { "<C-d>zz", desc = "Jump down" },
        ["<C-u>"] = { "<C-u>zz", desc = "Jump up" },

        -- go to end of line
        ["§"] = { "$", desc = "Go to end of line" },

        -- jump between windows
        ["<Leader>h"] = { "<C-w>h", desc = "Jump to left window" },
        ["<Leader>j"] = { "<C-w>j", desc = "Jump upwards" },
        ["<Leader>k"] = { "<C-w>k", desc = "Jump downwards" },
        ["<Leader>l"] = { "<C-w>l", desc = "Jump to left window" },

        -- move windows
        ["<S-L>"] = { "<C-w>L", desc = "Move window right" },
        ["<S-H>"] = { "<C-w>H", desc = "Move window left" },

        -- navigate buffer tabs
        ["<A-.>"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        ["<A-,>"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

        -- mappings seen under group name "Buffer"
        ["<Leader>bd"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Close buffer from tabline",
        },

        -- terminal
        ["<Leader>tf"] = false, -- disabling
        ["<A-t>"] = { "<Cmd>ToggleTerm direction=float<CR>", desc = "Show ToggleTerm float" },

        -- tables with just a `desc` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        -- ["<Leader>b"] = { desc = "Buffers" },

        -- setting a mapping to false will disable it
        -- ["<C-S>"] = false,
      },
      v = {
        -- move selected row up and down
        ["J"] = { ":<C-u>exec 'move ' . (line(\"'>\")+1)<CR>gv=gv", desc = "Move row down" },
        ["K"] = { ":<C-u>exec 'move ' . (line(\"'>\")-2)<CR>gv=gv", desc = "Move row up" },
      },
      t = {
        ["<Esc>"] = { "<c-\\><c-n>", desc = "Escape terminal mode" },
        ["<A-e>"] = { "<c-\\><c-n>", desc = "Exit terminal mode" },
      },
      i = {
        -- Unnecessary cmp mappings that interfer
        ["<C-j>"] = false,
        ["<C-J>"] = false,
      },
    },
  },
}
