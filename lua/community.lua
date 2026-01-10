-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },

  -- import/override with your plugins folder
  { import = "astrocommunity.completion.copilot-lua" },
  { import = "astrocommunity.utility.noice-nvim" },
  { import = "astrocommunity.fuzzy-finder.telescope-nvim" },
  -- { import = "astrocommunity.completion.avante-nvim" },
  { import = "astrocommunity.recipes.ai" },
  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.pack.svelte" },
  { import = "astrocommunity.file-explorer.oil-nvim" },
  -- { import = "astrocommunity.code-runner.overseer-nvim" },
  { import = "astrocommunity.code-runner.executor-nvim" },
}
