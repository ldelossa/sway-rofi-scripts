# Sway Rofi Scripts

Kinda like [sway-fzfify](https://github.com/ldelossa/sway-fzfify) but with Rofi.

You'll probably want to use this with the [Rofi Fork](https://github.com/lbonn/rofi#wayland-support)

# The Goods

## sway-drun.sh

Parses out desktop files and displays them for launching.
This is a carry over from "sway-fzfify", you probably just want to use Rofi's 
default "drun" mode (it has fancy icons).

## sway-mark-switcher.sh

Switch directly to a window you have set a mark on.

## sway-mark.sh

Mark the currently focused window (leave it blank to unmark the currently focused window).

## sway-new-workspace.sh

Open a new workspace with the desired name. 

As a convenience, if you set a "CDPATH" variable and the workspace name prefixed
by a path in "CDPATH" resolves to a valid directory on your filesystem, a terminal
will be opened to that directory. 

For example, I keep this repo on my filesystem at "\~/git/sway/sway-rofi-scripts".
In my "CDPATH" I have the path prefix "\~/git". If I then create a workspace named
"sway/sway-rofi-scripts", a terminal will automatically be opened to 
"\~/git/sway/sway-rofi-scripts".

The first path that resolves to a valid directory wins.

The default terminal is "kitty" but you can change this in the script.

## sway-rename.sh

Rename the current workspace

## sway-tree-switcher.sh

Switch to an open window in Sway's window tree.

## sway-window-move.sh

Move the currently focused window to a selectable workspace.

## sway-workspace-move.sh

Move a workspace to the current output.

## sway-workspace-switcher.sh

Move to a selectable workspace.
