pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
    id: root
    property string powerProfileIcon
    property string color
    property string nextState
    
    Timer {
        interval: 500
        running: true
        repeat: true
        onTriggered: checkProfile.running = true
    }

    Process {
        id: checkProfile
        command: ["powerprofilesctl","get"]
        running: true

        stdout: StdioCollector {
            onStreamFinished: {
                const trimmedtext = this.text.trim()
                switch (trimmedtext) {
                    case "performance":
                        root.powerProfileIcon = "\udb85\udc0b"
                        root.color = "#B50000"
                        root.nextState = "power-saver"
                        break
                    case "balanced":
                        root.powerProfileIcon = "\uf24e"
                        root.color = "#4F5FAE"
                        root.nextState = "performance"
                        break
                    case "power-saver":
                        root.powerProfileIcon = "\udb80\udf2a"
                        root.color = "#4AA04F"
                        root.nextState = "balanced"
                        break
                    default:
                        root.powerProfileIcon = "\udb84\udd05"
                        root.nextState = "balanced"
                        break
                }
            }
        }
    }
}
