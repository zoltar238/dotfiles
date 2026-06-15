import Quickshell
import Quickshell.Io
import Quickshell.Wayland
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts

Rectangle {
    id: wsContainer
    color: "red"
    border.color: "black"
    Layout.preferredHeight: 30
    Layout.preferredWidth: 800

    Row {
        // anchors.centerIn: parent
        spacing: 8

        Repeater {
            model: 10

            Rectangle {
                width: 30
                height: 30

                Text {
                    // Live data from hyprland
                    property var ws: Hyprland.workspaces.values.find(w => w.id === index + 1)
                    property bool isActive: Hyprland.focusedWorkspace?.id === (index + 1)

                    // anchors.fill: parent

                    text: index + 1
                    color: isActive ? "black" : (ws ? "gray" : "red")
                    MouseArea {
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onClicked: Hyprland.dispatch("hl.dsp.focus({workspace =  " + (index + 1) + "})")

                        // "on-scroll-up": "hyprctl dispatch 'hl.dsp.focus({workspace = \"e+1\"})'",
                    }
                }
            }
        }
    }
}
