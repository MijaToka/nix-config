pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
    id: root
    property real totalGiB
    property real ocupiedGiB

    property real percentage: Math.round(ocupiedGiB/totalGiB*100)

    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: {
            getRAMValues.running = true
        }
    }

    Process {
        id: getRAMValues
        command: ["sh","-c","free | grep 'Mem:' | awk '{print $2/(1024*1024),$3/(1024*1024)}'"]
        running: true
        stdout: StdioCollector {
            onStreamFinished: {
                var parts = this.text.trim().split(' ')
                root.totalGiB = Math.round(parseFloat(parts[0])*10)/10
                root.ocupiedGiB = Math.round(parseFloat(parts[1])*10)/10
            }
        }
    }
}