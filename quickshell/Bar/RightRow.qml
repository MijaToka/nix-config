import QtQuick
import Quickshell
import "../Widgets"
Row { 
    spacing: 5
    anchors {
        right: parent.right
        verticalCenter: parent.verticalCenter
        rightMargin: 0
    }

    height: parent.height - 12

    PowerProfileIndicator {id:powerProfile}
    
    Button { // CPU/GPU
        text: " 0 \uf4bc"
        isSymbol: false
        }
    
    Button { // Wifi
        text: "\uf1eb"
    }

    Button { // Bluetooth
        text: "\udb80\udcaf"
    }
    
    Button { // Battery
        text: "\udb80\udc79"
    }
    Button { // Power profile
        text: powerProfile.powerProfile 
        fillColor: powerProfile.color
        }
    
    Button { // Date
        text: Time.date
        isSymbol: false
    }

    Button { // Time
        text: Time.time
        isSymbol: false
        }

    Button { //Power button
        text: "\u23fb" 
        fillColor: "#161616"
        hasBorder: true
    }

    Text { // Spacing
        text: " "
    }
}