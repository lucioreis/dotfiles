# config.nu
#
# Installed by:
# version = "0.101.0"
#
# This file is used to override default Nushell settings, define
# (or import) custom commands, or run any other startup tasks.
# See https://www.nushell.sh/book/configuration.html
#
# This file is loaded after env.nu and before login.nu
#
# You can open this file in your default editor using:
# config nu
#
# See `help config nu` for more options
#
# You can remove these comments if you want or leave
# them for future reference.

use std/dirs

#
# NVIM
# Start neovim with lazyvim config
def --env nvim [...args: string] {
  $env.NVIM_APPNAME = "lazyvim"
  ^nvim ...$args
}

# Advent of neovim
def --env advim [...args: string] {
  $env.NVIM_APPNAME = "advim"
  ^nvim ...$args
}


$env.config.buffer_editor = $"($env.NVIM_APPNAME = "lazyvim")nvim"
$env.config.show_banner = false
$env.config.edit_mode = 'vi'

$env.ENV_CONVERSIONS = $env.ENV_CONVERSIONS | merge {
  "XDG_DATA_DIRS": {
    from_string: { |s| $s | split row (char esep) | path expand --no-symlink},
    to_string: {|v| $v | path expand --no-symlink | str join (char esep)}
  }
}

if ((which zoxide | length) > 0) and not ($"($nu.default-config-dir)/conf.d/zoxide.nu" | path exists) {
  zoxide init nushell | save -f $"($nu.default-config-dir)/conf.d/zoxide.nu"
}

source $"($nu.default-config-dir)/conf.d/zoxide.nu"
source $"($nu.default-config-dir)/conf.d/carapace.nu"
source $"($nu.default-config-dir)/conf.d/yazi.nu"

$env.ASDF_DIR = ($env.HOME | path join '.asdf')
source /home/lucio/.asdf/asdf.nu
