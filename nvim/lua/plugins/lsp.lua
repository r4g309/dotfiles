-- Envuelve un mensaje largo en varias líneas según un ancho máximo.
-- El handler de virtual_lines parte el mensaje por "\n", así que metiendo saltos
-- manuales conseguimos que se apile en varias líneas legibles en vez de salirse.
local function wrap_message(message, width)
  local lines = {}
  for _, paragraph in ipairs(vim.split(message, "\n")) do
    local current = ""
    for word in paragraph:gmatch("%S+") do
      if #current > 0 and #current + 1 + #word > width then
        table.insert(lines, current)
        current = word
      else
        current = (#current > 0) and (current .. " " .. word) or word
      end
    end
    table.insert(lines, current)
  end
  return table.concat(lines, "\n")
end

return {
  "neovim/nvim-lspconfig",
  opts = {
    diagnostics = {
      -- Texto inline a la derecha (como antes), pero oculto en la línea actual
      -- para no duplicarlo con el bloque envuelto de abajo.
      virtual_text = {
        spacing = 4,
        source = "if_many",
        prefix = "●",
        current_line = false,
      },
      -- Solo en la línea del cursor: mensaje completo y envuelto en varias líneas.
      virtual_lines = {
        current_line = true,
        format = function(diagnostic)
          local width = math.max(40, math.floor(vim.o.columns * 0.7))
          return wrap_message(diagnostic.message, width)
        end,
      },
    },
  },
}
