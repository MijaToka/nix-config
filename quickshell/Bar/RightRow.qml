import QtQuick
import Quickshell
import "../Widgets"
Row { 
    spacing: 5
    anchors {
        right: parent.right
        verticalCenter: parent.verticalCenter
        rightMargin: 20
    }
    PowerProfileIndicator {id:powerProfile}
    Text {
        text: powerProfile.powerProfile
        color: "#ffffff"
        font {
            pixelSize: 12
            family: "Symbols Nerd Font"
        }
    }
    Text {
        text: Time.time
        color : "#ffffff"
        font {
            pixelSize: 12
        }
    }
}