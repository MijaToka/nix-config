import "../Buttons"
import QtQuick
import Quickshell
import Quickshell.Hyprland

Repeater {
    model: Hyprland.workspaces

    Button {
        visible: modelData.id > 0
        text: modelData.id
        fillColor: modelData.active ? "#4F5FAE":"#111111"
        doubleWidth: modelData.active
        MouseArea {
            anchors.fill: parent
            onClicked: Hyprland.dispatch("workspace " + modelData.id)
        }
    }
}