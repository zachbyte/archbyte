<div align="center">
  <h1>ARCHBYTE</h1>
</div>


<div align="center">
  <h2>Obtain Arch</h2>
</div>

[Arch Linux download page](https://archlinux.org/download/).

[Arch Verify ISO](https://youtu.be/aqQd8ygDuqo)

<div align="center">
  <h2>Arch Server Install Script</h2>
</div>

Run in arch ISO.
 ```shell
 bash <(curl -fsSL https://github.com/zachbyte/archbyte/raw/main/arch/server-setup.sh)
 ```

<p align="center">
  <img src=".github/images/logo.png" alt="Image">
</p>

<hr>

<div align="center">
  <h2>Usage</h2>
</div>

Install via curl
  ```shell
  curl -fsSL https://github.com/zachbyte/archbyte/raw/main/install.sh | sh
  ```

Install via git
  ```shell
  git clone https://github.com/zachbyte/archbyte
  cd archbyte
  chmod +x install.sh
  ./install.sh
  ```

Starting dwm
- DWM is auto-started from tty1 via autologin and zprofile only after rebooting / logging out & logging back in.

Updating dotfiles
- To sync your clone of DWM with the latest version, you can use the following command:
  ```shell
  curl -fsSL https://github.com/zachbyte/archbyte/raw/main/update.sh | sh
  ```

Uninstalling dotfiles
- To uninstall the dotfiles, you can use the following command:
  ```shell
  curl -fsSL https://github.com/zachbyte/archbyte/raw/main/uninstall.sh | sh
  ```
> [!NOTE]  
> This will restore any previous configuration files overwritten by the install script.

> [!IMPORTANT]  
> This rice relies on having a permament existing ``archbyte/`` directory. Do **NOT** remove the directory after setup.
> Any changes to the dotfiles should be made in the ``archbyte/`` directory, any changes made in ``~/.config/`` will **NOT** work.

<div align="center">
  <h2>Information</h2>
</div>

Important notes
- These dotfiles use zsh as the default shell, and as such be prepared to manually set up your shell if you do not plan on using zsh.
- The archbyte folder in your home directory is used as the primary configuration folder, if you remove it every symlink created by the install script will cease to work; and if you want to change anything inside of the dotfiles it is recommended that you make your changes in the archbyte folder. Most of the configuration is done in the extra directory, that is where you'll find all of the important config files.
- The install script will nuke any existing symlinks in your home dir, if you want to keep them, make sure to back them up before running it.

<div align="center">
  <h2>Keybinds overview</h2>
</div>

| Keybind | Description |  
| --- | --- |  
| `MOD + X` | Spawns st (Terminal) |  
| `MOD + R` | Spawns dmenu (Application launcher) |  
| `MOD + Q` | Kills current window |  
| `MOD + Tab` | Switch between tags |
| `MOD SHIFT + Q` | Kills dwm |  
| `MOD SHIFT + W` | Restarts dwm and keeps application positions |
| `MOD SHIFT + F` | Toggles fullscreen (Actualfullscreen Patch) |
| `MOD + B` | Spawns thorium (Browser) |
| `MOD + N` | Spawns dailyWire (News) |
| `MOD + M` | Spawns outlook (Mail) |
| `MOD + O` | Spawns obsidian |
| `MOD + C` | Spawns microsoft 365 (Copilot) |
| `MOD + P` | Spawns maim (Screenshot utility) | 
| `MOD + LMB` | Drags selected window |
| `MOD + RMB` | Resizes window in floating & resizes mfact in tiled; when two or more windows are on screen |
| `MOD SHIFT + SPACE` | Makes the selected window float |
| `MOD + R` | Resets mfact |

<div align="center">
  <h2>Preview</h2>
</div>

![PV](.github/images/preview.png)
