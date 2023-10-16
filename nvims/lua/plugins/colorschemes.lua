-- Installing & loading colorschemes (just onedark for now)
-- (going off of LazyVim docs, but why does the onedark docs say to use require('onedark').load()?)
return {
  -- add onedark
  {
    "navarasu/onedark.nvim",
    -- opts will be merged with the parent spec
    opts = { style = 'dark' }
  },

  -- Configure LazyVim to load onedark
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "onedark",
    },
  },
}
