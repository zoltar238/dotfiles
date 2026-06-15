import Quickshell
import Quickshell.Io
import Quickshell.Wayland
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts

import "./components"

Variants {
    model: Quickshell.screens;

    delegate: Component {
        PanelWindow {
            required property var modelData

            anchors {
                top: true
                left: true
                right: true
                bottom: false
            }

            visible: true
            implicitHeight: 50
            screen: modelData

            RowLayout {
                anchors.fill: parent
                anchors.margins: 8

                Stats {
                }
                Workspaces {}
            }
        }
    }
}