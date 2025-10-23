pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
    id: root
    property string powerProfileIcon
    property string color
    
    Timer {
        interval: 5000
        running: true
        repeat: true
        onTriggered: checkProfile.running = true
    }

    Process {
        id: checkProfile
        command: ["tlp-stat","-m"]
        running: true

        stdout: StdioCollector {
            onStreamFinished: {
                const trimmedtext = this.text.trim()
                switch (trimmedtext) {
                    case "AC":
                        root.powerProfileIcon = "\udb85\udc0b"
                        root.color = "#B50000"
                        break
                    case "balanced":
                        root.powerProfileIcon = "\uf24e"
                        root.color = "#4F5FAE"
                        break
                    case "battery":
                        root.powerProfileIcon = "\udb80\udf2a"
                        root.color = "#4AA04F"
                        break
                    default:
                        root.powerProfileIcon = "\udb84\udd05"
                        break
                }
            }
        }
    }
}
