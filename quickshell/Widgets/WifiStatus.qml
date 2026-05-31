pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
    id: root
    property int prevRBytes
    property int currRBytes
    property real recieveSpeed: (currRBytes - prevRBytes) / 1024

    property int prevTBytes
    property int currTBytes
    property real transmitSpeed: (currTBytes - prevTBytes) / 1024

    property string buttonText: displayValue + displayIcon
    property string displayValue: textState == 1 ? Math.round(recieveSpeed * 10) / 10 : textState == 2 ? Math.round(transmitSpeed * 10) / 10 : ""
    property string displayIcon: textState == 1 ? " KB/s \uf019" : textState == 2 ? " KB/s \uf093" : connectionStatus ? "\udb81\udda9" : "\udb81\uddaa"
    property int textState: 0
    property bool connectionStatus
    property string connectionType

    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: {
            checkConnection.running = true;
        }
    }

    Process {
        id: checkConnection
        command: ["sh", "-c", `ip route get 1.1.1.1 | awk '{print $5}'`]
        stdout: StdioCollector {
            onStreamFinished: {
                const text = this.text.trim();
                console.log("Check Connection:", JSON.stringify(text));
                if (text == "") {
                    root.connectionStatus = false;
                    root.connectionType = "";
                    root.prevTBytes = 0;
                    root.prevRBytes = 0;
                    root.currTBytes = -1;
                    root.currRBytes = -1;
                } else {
                    root.connectionType = text;
                    root.connectionStatus = true;
                    updateRx.running = true;
                    updateTx.running = true;
                }
            }
        }
    }
    Process {
        id: updateRx
        command: ["sh", "-c", "cat /sys/class/net/" + root.connectionType + "/statistics/rx_bytes /sys/class/net/" + root.connectionType + "/statistics/tx_bytes"]
        stdout: StdioCollector {
            onStreamFinished: {
                var parts = this.text.trim().split('\n');
                console.log(root.connectionType, "rx_bytes:", parts[0]);
                console.log(root.connectionType, "tx_bytes:", parts[1]);

                var tmpRx = root.currRBytes;
                var tmpTx = root.currTBytes;
                root.currRBytes = parseInt(parts[0]);
                root.currTBytes = parseInt(parts[1]);
                root.prevRBytes = tmpRx;
                root.prevTBytes = tmpTx;
            }
        }
    }
    Process {
        id: updateTx
    }
}
