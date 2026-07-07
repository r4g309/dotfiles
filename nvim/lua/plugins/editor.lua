return {
  -- Surround con los atajos clásicos de vim-surround (los mismos de vscodevim):
  --   ys{motion}{char}  → rodear:      ysiw"  → "palabra"
  --   cs{old}{new}      → cambiar:     cs"'   → 'palabra'
  --   ds{char}          → borrar:      ds"    → palabra
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    opts = {},
  },
}
