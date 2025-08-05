import QtQuick
import Quickshell
import "../Widgets"
import "../Buttons"
Row { 
    spacing: 5
    anchors {
        right: parent.right
        verticalCenter: parent.verticalCenter
        rightMargin: 0
    }

    height: parent.height - 12

    PowerProfileIndicator {id:powerProfile}
    Power {id:battery}

    Button { // CPU/GPU
        text: " 0 \uf4bc"
        isSymbol: false
        }
    Button { // Audio
        text: "\uf028"
    }
    Button { // Wifi
        text: "\uf1eb"
    }

    Button { // Bluetooth
        text: "\udb80\udcaf"
    }
    
    Button { // Power profile
        text: powerProfile.powerProfile 
        fillColor: powerProfile.color
    }
    Button { // Battery
        text: battery.text
        isSymbol: false
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