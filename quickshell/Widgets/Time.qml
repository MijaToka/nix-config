pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
    id: root
    property string time
    property string date

    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: {
            var now = new Date()
            root.time = Qt.formatTime(now, "hh:mm")
            root.date = Qt.formatDate(now, "ddd dd MMM")
        }
    }
}
