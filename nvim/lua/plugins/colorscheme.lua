-- Gruvbox Dark Hard, como en VSCode
return {
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    opts = {
      contrast = "hard",
      -- Fondo transparente: nvim usa el fondo de Alacritty (opacity + blur),
      -- así desaparece el "marco" que se veía por el padding de la terminal.
      transparent_mode = true,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },
}
