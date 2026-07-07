return {
  "saghen/blink.cmp",
  opts = {
    keymap = {
      preset = "super-tab", -- Tab acepta la sugerencia / navega snippets, Shift-Tab retrocede
      -- navegar sugerencias estilo vim sin usar flechas (Alt-j/k quedan libres para mover líneas)
      ["<C-j>"] = { "select_next", "fallback" },
      ["<C-k>"] = { "select_prev", "fallback" },
    },
  },
}
