import "../Buttons"
import "../Widgets"
import QtQuick
import Quickshell.Io

Button {
    id: root
    text: WifiStatus.buttonText

    MouseArea {
        anchors.fill: parent
        acceptedButtons: Qt.LeftButton | Qt.RightButton
        onClicked: mouse => {
            if (mouse.button == Qt.LeftButton) {
                openBlueman.running = true;
            } else if (mouse.button == Qt.RightButton) {
                WifiStatus.textState = (WifiStatus.textState + 1) % 3;
            }
        }
    }

    Process {
        id: openBlueman
        command: ["kitty", "-T", "FloatingKitty", "nmtui"]
        running: false
    }
}
