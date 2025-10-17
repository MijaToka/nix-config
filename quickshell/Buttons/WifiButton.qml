import "./Buttons"

import QtQuick
import Quickshell
import Quickshell.Io

Button {
    id: root
    text:  "\uf1eb"

    MouseArea { 
        anchors.fill: parent
        onClicked: {
            openBlueman.running = true
        }
    }

    Process {
        id: openBlueman
        command: ["kitty","-T","FloatingKitty","nmtui"]
        running: false
    }
}