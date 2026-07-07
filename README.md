# dotfiles

Configuración de **nvim** (LazyVim), **Alacritty** y **tmux**.

## Uso en Linux/Mac

```bash
git clone <url-del-repo> ~/dotfiles
ln -s ~/dotfiles/nvim ~/.config/nvim
ln -s ~/dotfiles/alacritty ~/.config/alacritty
ln -s ~/dotfiles/tmux ~/.config/tmux
nvim  # instala plugins y LSPs solo, al abrir
tmux  # dentro: prefix + I instala los plugins de TPM (tmux-resurrect, etc.)
```

## Uso en Windows

- **nvim**: clona el repo y crea un symlink (como admin, en PowerShell):
  ```powershell
  git clone <url-del-repo> C:\Users\<tu-usuario>\dotfiles
  New-Item -ItemType SymbolicLink -Path $env:LOCALAPPDATA\nvim -Target C:\Users\<tu-usuario>\dotfiles\nvim
  ```
  Necesitas Neovim, git, y un compilador (`winget install --id LLVM.LLVM` o usa MSVC)
  para que treesitter compile los parsers. Instala también `ripgrep` y `fd`
  (`winget install BurntSushi.ripgrep.MSVC sharkdp.fd`).

- **Alacritty**: symlink a `%APPDATA%\alacritty`. La fuente `JetBrains Mono` debe
  estar instalada en Windows; la transparencia/blur (`window.blur`) es específica
  de KWin/Wayland y no aplica en Windows — ignóralo, no rompe nada.

- **tmux**: tmux no corre nativo en Windows. Usa **WSL2** (Ubuntu) e instala tmux
  ahí; dentro de WSL, symlinkea igual que en Linux.

## Estructura

```
dotfiles/
├── nvim/         → LazyVim, ver nvim/MANUAL.md
├── alacritty/    → alacritty.toml (tema Sweet, Gruvbox-friendly)
└── tmux/         → tmux.conf (tema Catppuccin), plugins/ vía TPM (no versionado)
```
