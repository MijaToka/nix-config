import "../Buttons"
import QtQuick
import Quickshell
import Quickshell.Hyprland

Repeater {
    model: Hyprland.workspaces
    Button {
        property bool isActive: Hyprland.focusedMonitor?.activeWorkspace?.id === modelData.id
        visible: modelData.id > 0
        text: modelData.id
        fillColor: isActive ? "#4F5FAE":"#111111"
        doubleWidth: modelData.active
        MouseArea {
            anchors.fill: parent
            onClicked: Hyprland.dispatch("workspace " + modelData.id)
        }
    }
}