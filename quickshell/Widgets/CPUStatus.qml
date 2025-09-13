pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
    id: root
    property real temperature
    property real percentageUse: (currTotal-prevTotal) == 0 ? 0 : Math.round(1000*(currUsed-prevUsed)/(currTotal-prevTotal))/10

    property int prevUsed
    property int prevIdle
    property int prevTotal: prevUsed + prevIdle

    property int currUsed
    property int currIdle
    property int currTotal: currUsed + currIdle

    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: {
            // root.prevIdle = root.currIdle
            // root.prevUsed = root.currUsed
            getCurrValues.running = true
            getTemp.running = true
        }
    }

    Process {
        id: getCurrValues
        command: ["sh","-c","cat /proc/stat | grep '^cpu ' | awk '{print $2 + $3 + $4 + $7 + $8 + $9, $5 + $6}'"]
        running: true
        stdout: StdioCollector {
            onStreamFinished: {
                var parts = this.text.trim().split(' ')
                var tmpUsed = root.currUsed
                var tmpIdle = root.currIdle
                root.currUsed = parseInt(parts[0])
                root.currIdle = parseInt(parts[1])
                root.prevIdle = tmpIdle
                root.prevUsed = tmpUsed
            }
        }
    }

    Process {
        id: getTemp
        command: ["cat","/sys/class/thermal/thermal_zone9/temp"]
        running: true
        stdout: StdioCollector {
            onStreamFinished: {
                root.temperature = parseInt(this.text)/1000}
        }
    }
}