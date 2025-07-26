pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
    id: root
    property string time

    Process {
        id: dateProc
        command: ['date']
        running: true
        stdout: StdioCollector {
            onStreamFinished: root.time = text
        }
    }
    Timer {
        interval: 500
        running: true
        repeat: true
        onTriggered: dateProc.running = true
    }
}