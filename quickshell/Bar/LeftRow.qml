import QtQuick
import Quickshell
import "../Widgets"

Row {
    spacing: 2
    anchors {
        left: parent.left
        verticalCenter: parent.verticalCenter
        leftMargin: 10
    }

    PowerProfileIndicator {}

    Text {
        id: nixLogo
        text: "\uf313"
        color: "#aaaaff"
        font {
            pixelSize: 24
            family: "Symbols Nerd Font"
        }
    }
}