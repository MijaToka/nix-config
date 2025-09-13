import "../Buttons"
import "../Widgets"
import QtQuick
import Quickshell
import Quickshell.Io

Button {
    id: root
    property bool state: true
    text: state ? RAMStatus.ocupiedGiB+"/"+RAMStatus.totalGiB + "GiB \uefc5": RAMStatus.percentage + "% \uefc5"
    isSymbol: false

    MouseArea {
        anchors.fill: parent
        onClicked: {
            root.state = !root.state
        }
    }
}