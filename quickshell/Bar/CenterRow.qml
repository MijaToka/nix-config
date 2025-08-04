import QtQuick
import Quickshell
import Quickshell.Hyprland

Row {
    spacing: 2
    anchors {
        centerIn: parent
        verticalCenter: parent.verticalCenter
    }

    HyprWorkspaces {}

    // If no workspaces
    Text {
        visible: Hyprland.workspaces.length === 0
        text: "No work spaces"
        color: "#ffffff"
        font.pixelSize: 12
    }

}