// pragma ComponentBehavior: Bound

import "bar"

import Quickshell
import Quickshell.Io
import Quickshell.Wayland
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts

ShellRoot {
    settings.watchFiles: true

    Bar {}
}
