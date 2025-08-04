import QtQuick
import Quickshell
import Quickshell.Io

Scope {
    id: root
    property string powerProfile

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
                        break
                    case "balanced":
                        root.powerProfile = "\uf24e"
                        break
                    case "power-saver":
                        root.powerProfile = "\udb80\udf2a"
                        break
                    default:
                        root.powerProfile = "\udb84\udd05"
                        break
                }
            }
        }
    }
}
