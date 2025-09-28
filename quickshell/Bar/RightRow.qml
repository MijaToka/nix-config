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


    Power {id:battery}

    CPUButton {}

    RAMButton {}

    Button { // Audio
        text: "\uf028"
    }

    WifiButton { }

    BluetoothButton { }
    
    PowerProfileButton { }

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