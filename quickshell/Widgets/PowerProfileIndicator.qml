import QtQuick
import Quickshell
import Quickshell.Io

Scope {
    id: root
    property string powerProfile
    property string color
    Timer {
        interval: 1000
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
                        root.powerProfile = "\udb85\udc0b"
                        root.color = "#B50000"
                        break
                    case "balanced":
                        root.powerProfile = "\uf24e"
                        root.color = "#4F5FAE"
                        break
                    case "power-saver":
                        root.powerProfile = "\udb80\udf2a"
                        root.color = "#4AA04F"
                        break
                    default:
                        root.powerProfile = "\udb84\udd05"
                        break
                }
            }
        }
    }
}
