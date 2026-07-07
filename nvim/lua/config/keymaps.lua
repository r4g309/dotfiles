-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

local map = vim.keymap.set

-- Salir de insert sin tocar Esc (tu jj / jk de vscodevim)
map("i", "jj", "<Esc>", { desc = "Salir de insert" })
map("i", "jk", "<Esc>", { desc = "Salir de insert" })

-- Scroll de media página manteniendo el cursor centrado (evita mareo)
map("n", "<C-d>", "<C-d>zz", { desc = "Media página abajo (centrado)" })
map("n", "<C-u>", "<C-u>zz", { desc = "Media página arriba (centrado)" })

-- Resultados de búsqueda siempre centrados
map("n", "n", "nzzzv", { desc = "Siguiente resultado (centrado)" })
map("n", "N", "Nzzzv", { desc = "Resultado anterior (centrado)" })

-- NOTA: H y L en LazyVim cambian de buffer (pestaña anterior/siguiente).
-- Para inicio/fin de línea usa ^ y $ (o descomenta estas dos líneas si
-- prefieres tu costumbre de VSCode y navegar buffers con [b y ]b):
-- map({ "n", "x", "o" }, "H", "^", { desc = "Inicio de línea" })
-- map({ "n", "x", "o" }, "L", "$", { desc = "Fin de línea" })

-- JSON del clipboard -> interfaz TypeScript, pegada en el cursor (usa quicktype)
map("n", "<leader>cj", function()
  local json = vim.fn.getreg("+")
  if json == "" then
    vim.notify("El clipboard está vacío", vim.log.levels.WARN)
    return
  end
  vim.ui.input({ prompt = "Nombre de la interfaz: ", default = "Root" }, function(name)
    if not name or name == "" then
      return
    end
    local result = vim.fn.system({ "quicktype", "-l", "ts", "-t", name, "--just-types" }, json)
    if vim.v.shell_error ~= 0 then
      vim.notify("quicktype falló:\n" .. result, vim.log.levels.ERROR)
      return
    end
    local lines = vim.split(result, "\n", { trimempty = true })
    vim.api.nvim_put(lines, "l", true, true)
  end)
end, { desc = "JSON (clipboard) a interfaz TS (quicktype)" })
