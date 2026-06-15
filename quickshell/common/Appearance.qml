pragma Singleton
pragma ComponentBehaviour: Bound

import QtQuick
import Quickshell

Singleton {
    id: root

    property string theme: "light"
    property string primaryColor: "#e11288"
    property string accentColor: "#960093"
}