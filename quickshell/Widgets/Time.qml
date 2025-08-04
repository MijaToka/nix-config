pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
    id: root
    property string time

    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: {
            var now = new Date()
            root.time = Qt.formatDate(now, "dd MMM yyyy") + " " + Qt.formatTime(now, "hh:mm")
        }
    }
}
