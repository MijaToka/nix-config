import "./Buttons"

import QtQuick
import Quickshell
import Quickshell.Io

Button {
    id: root
    text:  "\udb80\udcaf"

    MouseArea { 
        anchors.fill: parent
        onClicked: {
            openBlueman.running = true
        }
    }

    Process {
        id: openBlueman
        command: ["blueman-manager"]
        running: false
    }
}