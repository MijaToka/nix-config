import "../Buttons"
import QtQuick
import Quickshell.Hyprland

Repeater {
    model: Hyprland.workspaces
    Button {
        required property HyprlandWorkspace modelData
        property bool isActive: Hyprland.focusedMonitor?.activeWorkspace?.id === modelData.id
        visible: modelData.id > 0
        text: modelData.id
        fillColor: isActive ? "#4F5FAE" : "#111111"
        doubleWidth: isActive
        MouseArea {
            anchors.fill: parent
            onClicked: parent.modelData.activate()
        }
    }
}
