import "../Buttons"
import "../Widgets"
import QtQuick
import Quickshell
import Quickshell.Io

Button {

    id: root
    // PowerProfileIndicator {id:powerProfile}

    text: PowerProfileIndicator.powerProfileIcon
    fillColor: PowerProfileIndicator.color

    MouseArea {
        anchors.fill: parent
        onClicked: {
            changePower.running = true
        }
    }

    Process {
        id: changePower
        
        command: ["powerprofilesctl","set",PowerProfileIndicator.nextState]
        running: false
    }
}