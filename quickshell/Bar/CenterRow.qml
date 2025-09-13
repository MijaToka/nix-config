import QtQuick
import Quickshell
import Quickshell.Hyprland

Row {
    spacing: 2
    anchors {
        centerIn: parent
        verticalCenter: parent.verticalCenter
    }
    height: parent.height-12
    HyprWorkspaces {}

    // If no workspaces
    Text {
        visible: Hyprland.workspaces.length === 0
        text: " "
        color: "#ffffff"
        font.pixelSize: 12
    }

}