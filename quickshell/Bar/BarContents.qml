import QtQuick
import Quickshell
import "../Widgets"

Rectangle {
    id: root
    anchors.fill: parent
    color: "transparent"
    BarRow {}

    Text {
        text: Time.time
        anchors {
            right: parent.right
            rightMargin: 20
            verticalCenter: parent.verticalCenter
        }
        color : "#ffffff"
    }
}