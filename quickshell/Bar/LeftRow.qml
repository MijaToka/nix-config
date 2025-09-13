import QtQuick
import Quickshell
import Quickshell.Io
import "../Widgets"

Row {
    spacing: 2
    anchors {
        left: parent.left
        verticalCenter: parent.verticalCenter
        leftMargin: 10
    }

    Text {
        id: nixLogo
        text: "\uf313"
        color: "#aaaaff"
        font {
            pixelSize: 24
            family: "Symbols Nerd Font"
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                openDRun.running = true
            }
        }

        Process {
            id: openDRun
            command: ["wofi","--show", "drun"]
        }

    }
}