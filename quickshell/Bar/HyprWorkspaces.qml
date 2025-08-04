import QtQuick
import Quickshell
import Quickshell.Hyprland

Repeater {
    model: Hyprland.workspaces

    Rectangle {
        width: 18
        height: 15
        radius: 4
        color: modelData.active ? "#4a9eff":"#333333"
        border {
            color: "#555555"
            width: 1
        }

        MouseArea {
            anchors.fill: parent
            onClicked: Hyprland.dispatch("workspace " + modelData.id)
        }

        Text {
            text: modelData.id
            anchors.centerIn: parent
            color: "#aaaaaa"
            font {
                pixelSize: 12
                family: "Inter, sans-serif"
            }
        }
    }
}