# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this repo is

Archbyte is a two-phase Arch Linux install system that produces a DWM desktop. Phase 1 installs bare Arch from an ISO; phase 2 configures the full desktop environment. The repo must remain cloned at `~/archbyte/` after setup — all dotfiles are symlinks pointing into it.

## Install flow

```bash
# Phase 1 — run from Arch ISO (partitions disk, installs base system, configures bootloader)
bash <(curl -fsSL https://github.com/zachbyte/archbyte/raw/main/arch/server-setup.sh)

# Phase 2 — run after first boot into the new system
curl -fsSL https://github.com/zachbyte/archbyte/raw/main/install.sh | sh

# Update (rebase + recompile suckless)
curl -fsSL https://github.com/zachbyte/archbyte/raw/main/update.sh | sh
```

DWM auto-starts via TTY1 autologin → zsh login shell → `.zprofile` runs `startx` if `$DISPLAY` is unset.

## Building suckless tools

After any change to `suckless/dwm/config.h`, `suckless/st/config.h`, or `suckless/dmenu/config.h`, recompile and reinstall:

```bash
cd ~/archbyte/suckless/dwm  && sudo make clean install
cd ~/archbyte/suckless/st   && sudo make clean install
cd ~/archbyte/suckless/dmenu && sudo make clean install
```

DWM can be restarted in-place without losing window positions via `Alt+Shift+W`.

## Architecture

### Two-script install pipeline

`arch/server-setup.sh` runs **inside the Arch ISO** as root. It interactively collects disk, filesystem (btrfs/ext4/LUKS), timezone, keymap, and credentials, then partitions, formats, pacstraps the base system, installs GPU drivers and microcode, and configures GRUB. After this script the system is bootable.

`install.sh` runs **as the target user** after first boot. It clones this repo to `~/archbyte/`, installs the AUR helper (yay), installs all packages, creates symlinks from `~/.config/` and `~/` into `~/archbyte/extra/`, compiles the three suckless tools, and installs Claude Code.

### Dotfile symlinking model

`install.sh` does a destructive `find $HOME -type l -exec rm {} +` before recreating symlinks. **All config edits must be made inside `~/archbyte/extra/`**, not in `~/.config/`. Changes to `~/.config/nvim`, `~/.zshrc`, etc. will be lost because those paths are symlinks.

Key symlink targets in `extra/`:
- `.zshrc`, `.zprofile`, `.xinitrc` → home directory
- `nvim/`, `gtk-3.0/`, `qt5ct/`, `fastfetch/`, `cava/` → `~/.config/`
- `picom.conf` → `~/.config/picom/picom.conf`
- `grub/grub` → `/etc/default/grub` (applied at install time only)

### DWM status bar

The status bar text is set by a `while true; sleep 1` loop in `.xinitrc` that calls `xsetroot -name`. There is no external status bar process — adding new status items means editing that loop in `extra/.xinitrc`.

### DWM configuration

All DWM customization lives in `suckless/dwm/config.h`. The modifier key is `Mod1` (Alt). Application launchers (terminal, browser, file manager, etc.) are defined as `*cmd[]` arrays in `config.h` and bound to keys in the `keys[]` table.

The `colorbar` patch enables the `SchemeStatus`, `SchemeTagsSel`, `SchemeTagsNorm`, `SchemeInfoSel`, `SchemeInfoNorm` color slots — these are in addition to the standard `SchemeNorm`/`SchemeSel` pair and must all be present in `config.h`.

### Claude Code alias

`cc` in the shell runs `claude --dangerously-skip-permissions`.
