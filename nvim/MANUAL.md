# 📖 Manual: de VSCode a Neovim (LazyVim)

Tu configuración es **LazyVim** con extras de Python, TypeScript/Vue (cubre Node y NestJS),
JSON, YAML, TOML, Docker, Markdown, Prettier y ESLint. Tema **Gruvbox Dark Hard**,
como en tu VSCode.

> La tecla **leader** es `<espacio>`, igual que tenías en vscodevim.
> **El truco número 1:** presiona `<espacio>` y espera medio segundo — aparece un menú
> (which-key) con TODOS los atajos disponibles. No necesitas memorizar nada al inicio.

---

## 1. Comandos esenciales de mantenimiento

| Comando | Qué hace |
|---|---|
| `:Lazy` | Gestor de plugins (actualizar con `U`, sincronizar con `S`) |
| `:Mason` | Gestor de LSPs/formatters/linters (como el panel de extensiones) |
| `:LazyExtras` | Activar/desactivar packs de lenguaje (aquí añades Go, Rust, Java cuando quieras: pon el cursor sobre el extra y presiona `x`) |
| `:checkhealth` | Diagnóstico general si algo falla |
| `:LazyHealth` | Diagnóstico específico de LazyVim |

---

## 2. Tus atajos de VSCode → LazyVim

Elegiste el modo **híbrido**: se mantienen los defaults de LazyVim y añadí tus
esenciales encima. Esta tabla es tu mapa de transición:

### Lo que funciona IGUAL que en tu VSCode

| Atajo | Acción |
|---|---|
| `jj` / `jk` | Salir de modo insert (lo añadí en `keymaps.lua`) |
| `Ctrl+d` / `Ctrl+u` | Media página con cursor centrado (`zz` automático, lo añadí) |
| `gd` | Ir a definición |
| `gr` | Ver referencias |
| `K` | Hover/documentación (en VSCode usabas `gh`) |
| `s` + 2 letras | Saltar a cualquier parte visible (**flash.nvim**, tu "sneak/easymotion") |
| `ysiw"` `cs"'` `ds"` | Surround: rodear, cambiar, borrar (mismos atajos que vscodevim) |
| `gcc` / `gc` en visual | Comentar línea / selección |
| `>` `<` en visual | Indentar sin perder la selección (default de LazyVim) |
| `Alt+j` / `Alt+k` | Mover línea/selección abajo/arriba (tu `<leader>d`/`<leader>u`) |
| Yank resaltado | Al copiar se ilumina lo copiado (nativo en LazyVim) |
| Números relativos | Activados por defecto |
| Portapapeles del sistema | Activado (`clipboard=unnamedplus`) |
| Format on save | Activado por defecto (conform.nvim: ruff, prettier, etc.) |

### Lo que CAMBIA (memoriza estos 12)

| En tu VSCode | En LazyVim | Acción |
|---|---|---|
| `<leader>f` | `<leader><espacio>` o `<leader>ff` | Buscar archivo (tu Ctrl+P) |
| `<leader>g` | `<leader>/` o `<leader>sg` | Buscar texto en el proyecto |
| `<leader>e` | `<leader>e` ✅ igual | Explorador de archivos |
| `<leader>w` | `Ctrl+s` o `:w` | Guardar (`<leader>w` aquí es el menú de ventanas) |
| `<leader>q` | `<leader>bd` | Cerrar buffer (archivo) |
| `<leader>Q` | `<leader>qq` | Salir de todo |
| `<leader>r` | `<leader>cr` | Renombrar símbolo |
| `<leader>a` | `<leader>ca` | Code action / quick fix |
| `<leader>F` | `<leader>cf` | Formatear documento |
| `<leader>]` / `<leader>[` | `H` / `L` (también `[b` / `]b`) | Buffer anterior/siguiente |
| `<leader>h/j/k/l` | `Ctrl+h/j/k/l` | Moverse entre splits |
| `<leader>v` / `<leader>s` | `<leader>\|` / `<leader>-` | Split vertical / horizontal |
| `gp` (peek) | `gd` y vuelves con `Ctrl+o` | En nvim se "viaja" y se regresa |
| `gh` (hover) | `K` | Documentación flotante |

> ⚠️ **H y L**: en tu VSCode eran inicio/fin de línea; en LazyVim cambian de buffer.
> Si no te acostumbras, en `lua/config/keymaps.lua` hay dos líneas comentadas
> para recuperar tu costumbre (y navegas buffers con `[b` / `]b`).
> Mientras tanto: inicio de línea = `^` (o `_`), fin de línea = `$`.

### Los que no tenías y te van a encantar

| Atajo | Acción |
|---|---|
| `<leader>,` | Cambiar entre buffers abiertos (fuzzy) |
| `<leader>sk` | **Buscar cualquier atajo por nombre** (¿olvidaste uno? búscalo aquí) |
| `<leader>ss` | Saltar a un símbolo del archivo (función, clase...) escribiendo su prefijo |
| `Ctrl+o` / `Ctrl+i` | Volver / avanzar en el historial de saltos (oro puro) |
| `<leader>gg` | **LazyGit** (tu GitLens + panel de git, pero mejor) |
| `Ctrl+/` | Terminal flotante (tu Ctrl+ñ) |
| `<leader>xx` | Panel de diagnósticos del proyecto (Trouble, tu "Problems") |
| `<leader>uh` | Toggle inlay hints (tus type hints de Pylance) |
| `u` dentro del explorador | — y `?` muestra la ayuda del explorador |

---

## 3. Flash.nvim — tu "space + ss + prefijo"

Lo que hacías con easymotion/sneak ahora es **flash** y es mejor:

1. En modo normal presiona **`s`**
2. Escribe **2 caracteres** de donde quieres ir (ej: `s` + `de` para saltar a "def")
3. Aparecen **etiquetas** (letras) sobre cada coincidencia visible
4. Presiona la letra de la etiqueta → saltas ahí

Extras:
- **`S`** → selecciona nodos de sintaxis (funciones, bloques) con etiquetas
- La búsqueda normal `/texto` también muestra etiquetas para saltar directo
- `f`/`t` mejorados: repite con la misma tecla para avanzar

Y ojo: **`<leader>ss`** (¡literalmente space+ss!) busca símbolos del archivo por
prefijo — escribe el inicio del nombre de una función y saltas a ella.

---

## 4. Surround (idéntico a vscodevim)

| Comando | Antes | Después |
|---|---|---|
| `ysiw"` | `palabra` | `"palabra"` |
| `ysiw(` | `palabra` | `( palabra )` (con espacios) |
| `ysiw)` | `palabra` | `(palabra)` (sin espacios) |
| `cs"'` | `"hola"` | `'hola'` |
| `cs'<q>` | `'hola'` | `<q>hola</q>` |
| `ds"` | `"hola"` | `hola` |
| `S"` (en visual) | selección | `"selección"` |

---

## 5. LSP: tu Pylance/Volar/ESLint en nvim

Servidores instalados (via Mason): **pyright + ruff** (Python), **vtsls + vue-language-server**
(TS/JS/Vue/Node/NestJS), **eslint**, **json**, **yaml**, **docker**, **taplo** (TOML),
**marksman** (Markdown), **lua**.

| Atajo | Acción |
|---|---|
| `gd` / `gr` / `gI` / `gy` | Definición / referencias / implementación / tipo |
| `K` | Documentación |
| `<leader>ca` | Code actions (tu quick fix) |
| `<leader>cr` | Renombrar símbolo en todo el proyecto |
| `<leader>cf` | Formatear (aunque ya formatea al guardar) |
| `]d` / `[d` | Siguiente / anterior diagnóstico |
| `<leader>cd` | Ver diagnóstico de la línea completo |
| `<leader>xx` | Todos los problemas del proyecto (Trouble) |
| `<leader>co` | Organizar imports (tu organize imports de ruff) |

Los errores se muestran **inline al final de la línea** (como tu Error Lens) por defecto.

**Python:** ruff formatea y organiza imports al guardar, pyright hace el type checking,
inlay hints disponibles con `<leader>uh`. Selecciona el venv con `<leader>cv` si el
proyecto tiene varios.

---

## 6. Archivos y proyecto

| Atajo | Acción |
|---|---|
| `<leader><espacio>` | Buscar archivo (Ctrl+P de VSCode) |
| `<leader>e` | Explorador (árbol lateral). `a` crea, `d` borra, `r` renombra, `?` ayuda |
| `<leader>/` | Grep en todo el proyecto |
| `<leader>sw` | Buscar la palabra bajo el cursor en el proyecto |
| `<leader>fr` | Archivos recientes |
| `<leader>sr` | Buscar y reemplazar en el proyecto (grug-far) |
| `<leader>fn` | Archivo nuevo |
| `<leader>qs` | Restaurar la sesión anterior (abre todo como lo dejaste) |

El picker respeta `.gitignore`, así que `node_modules`, `.venv`, `dist`, etc.
quedan excluidos automáticamente (tu `search.exclude`).

---

## 7. Git (tu GitLens)

| Atajo | Acción |
|---|---|
| `<leader>gg` | **LazyGit**: stage, commit, push, branches, todo (instálalo, ver §10) |
| `<leader>gb` | Blame de la línea (tu GitLens inline blame) |
| `]h` / `[h` | Siguiente / anterior cambio (hunk) |
| `<leader>ghs` | Stage del hunk bajo el cursor |
| `<leader>ghr` | Descartar el hunk (revert) |
| `<leader>ghp` | Preview del cambio |
| `<leader>gs` | Git status (picker) |

Los cambios se marcan en la columna izquierda (verde/azul/rojo) como en VSCode.

---

## 8. Terminal

| Atajo | Acción |
|---|---|
| `Ctrl+/` | Abrir/cerrar terminal flotante (usa tu zsh) |
| `Ctrl+/` dentro de la terminal | Cerrarla |
| `Esc Esc` dentro de la terminal | Pasar a modo normal (para copiar texto del output) |

---

## 9. Plan de aprendizaje (3 semanas)

**Semana 1 — Supervivencia.** Usa solo esto y no intentes más:
`<leader><espacio>` (archivos), `<leader>e` (explorador), `Ctrl+s` (guardar),
`<leader>bd` (cerrar), `H`/`L` (cambiar buffer), `gd`/`Ctrl+o` (ir y volver),
`s` (flash), `jj` (salir de insert). Cuando dudes: `<espacio>` y lee el menú.
Corre `:Tutor` un día que tengas 30 min libres (repaso de vim puro).

**Semana 2 — Fluidez.** Incorpora: `<leader>/` (grep), `<leader>,` (buffers),
`<leader>ca`/`<leader>cr` (code actions/rename), `<leader>gg` (lazygit),
`]d`/`[d` (diagnósticos), surround (`ys`/`cs`/`ds`), `Ctrl+/` (terminal).

**Semana 3 — Poder.** Text objects con treesitter (`vif` selecciona dentro de una
función, `vaf` la función entera, `]f` siguiente función), `S` de flash,
`<leader>ss` (símbolos), macros (`qa` ... `q`, ejecutar con `@a`),
`:` + comandos (`:%s/viejo/nuevo/g` reemplazo en archivo).

**Regla de oro:** si algo te frustra más de 2 minutos, `<leader>sk` y busca el
atajo por nombre, o abre VSCode para esa tarea puntual y sigue. La migración no
tiene que ser un martirio de un solo día.

---

## 10. Pendientes y cómo crecer

### Instala estas 2 herramientas (necesitan sudo)

```bash
sudo pacman -S fd lazygit
```

- `fd` → hace más rápidos los pickers de archivos
- `lazygit` → sin él, `<leader>gg` no funciona

### Añadir lenguajes después (Go, Rust, Java...)

`:LazyExtras` → busca `lang.go`, `lang.rust`, `lang.java` → presiona `x` sobre el
extra → reinicia nvim. Mason instala solo el LSP. Así de simple.

### Equivalencias de tus extensiones de VSCode

| VSCode | En tu LazyVim |
|---|---|
| Error Lens | Diagnósticos inline (ya activo) |
| GitLens | gitsigns + lazygit (ya activo) |
| Better Comments | todo-comments (ya activo: `TODO:`, `FIXME:`, `HACK:` se resaltan; `<leader>st` los busca) |
| Prettier / ESLint | extras ya activos |
| Ruff / Pylance | pyright + ruff (ya activo) |
| Volar | vue-language-server (ya activo) |
| Path Intellisense | el LSP + blink.cmp lo cubren |
| Bookmarks | marcas nativas: `ma` crea la marca "a", `'a` salta a ella, `<leader>sm` las lista |
| autoDocstring | instala `neogen` si lo extrañas (pídemelo) |
| Remote SSH | abre la terminal en el server y usa nvim allí, o monta con `sshfs` |
| Live Server | `python -m http.server` o la extensión del framework (vite ya lo trae) |

### Estructura de tu config (dónde tocar qué)

```
~/.config/nvim/
├── init.lua                  ← no tocar (bootstrap)
├── lazyvim.json              ← extras activados (lo gestiona :LazyExtras)
├── MANUAL.md                 ← este archivo
└── lua/
    ├── config/
    │   ├── options.lua       ← opciones del editor (scrolloff, wrap, rulers...)
    │   ├── keymaps.lua       ← TUS atajos personalizados
    │   └── autocmds.lua      ← automatizaciones
    └── plugins/
        ├── colorscheme.lua   ← gruvbox
        ├── editor.lua        ← nvim-surround
        └── *.lua             ← cada archivo nuevo aquí añade/modifica plugins
```

---

## 11. Masterizar Vim: guías interactivas web y método

### Interactivas (en el navegador)

| Recurso | Qué es |
|---|---|
| [openvim.com](https://www.openvim.com) | Tutorial interactivo en el navegador — el mejor punto de partida, gratis |
| [vim-adventures.com](https://vim-adventures.com) | Videojuego tipo Zelda donde te mueves con motions de vim (primeros niveles gratis) |
| [vimhero.com](https://www.vimhero.com) | Ejercicios interactivos progresivos con código real |
| [vimgolf.com](https://www.vimgolf.com) | Retos: lograr una edición en la menor cantidad de teclas — adictivo cuando ya tienes base |
| [devhints.io/vim](https://devhints.io/vim) | Cheatsheet de referencia rápida para tener abierta en una pestaña |

Y dentro del propio nvim (ya viene incluido, no es plugin): **`:Tutor`** — el tutorial
oficial interactivo, 30 minutos que valen oro.

### Para ver y leer

- **"Vim As Your Editor"** de ThePrimeagen (YouTube) — serie corta, es LA referencia
  para desarrolladores que migran
- **Practical Vim** de Drew Neil (libro) — cuando ya lleves un mes; te cambia el chip
  de "atajos sueltos" a "lenguaje de edición"

### El método que de verdad funciona

1. **Vim es un lenguaje, no una lista de atajos**: verbo + objeto. `d` (borrar) +
   `iw` (dentro de palabra) = `diw`. `c` (cambiar) + `i"` (dentro de comillas) =
   `ci"`. Cuando entiendes esto, dejas de memorizar y empiezas a *hablar*.
2. **Una cosa nueva por semana**, no diez. Semana 1: `ci"`/`ciw`. Semana 2: `.`
   (repetir último cambio). Semana 3: text objects de función (`vif`, `daf`)...
3. **Si presionas la misma tecla más de 3 veces, hay una forma mejor.**
   ¿`jjjjjjj`? Usa `7j`, `s` (flash) o `}`. Los números relativos del margen
   izquierdo existen exactamente para eso.
4. **El punto `.` es tu superpoder**: repite el último cambio. `ciw` + nuevo texto,
   luego `n` (siguiente coincidencia) + `.` — refactor manual a velocidad de macro.
5. **No abandones nvim en los momentos de fricción.** La regla de los 2 minutos:
   intenta resolverlo (`<leader>sk` busca atajos por nombre), y si no sale, resuélvelo
   "mal" pero dentro de nvim, y búscalo con calma después.
6. **VimGolf los viernes**: un reto de 10 minutos por semana te enseña más motions
   que cualquier lista.

---

## 12. Si algo falla

1. `:checkhealth` — te dice exactamente qué está roto y cómo arreglarlo
2. `:Lazy sync` — reinstala/actualiza plugins
3. `:Mason` — revisa que los LSPs estén instalados (✓ verde)
4. `:LspInfo` — muestra qué LSP está conectado al archivo actual
5. Empezar de cero sin perder nada: renombra `~/.local/share/nvim` y `~/.local/state/nvim` y abre nvim (reinstala todo solo). Tu config en `~/.config/nvim` no se toca.
