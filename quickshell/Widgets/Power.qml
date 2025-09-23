import QtQuick
import Quickshell
import Quickshell.Io

Scope {
    id: root

    property string timeRemainding
    property int battery
    property string batteryIcon
    property string chargingIcon
    property string text: battery + "% " + batteryIcon + " " +  chargingIcon
    property bool isCharging
    
    Timer {
        interval: 10000
        running: true
        repeat: true
        onTriggered: {
            capacity.running = true
            energy.running = true
            power.running = true
            charging.running = true
        }
    }

    Process {
        id: capacity
        running: true
        command: ["cat","/sys/class/power_supply/BAT0/capacity"]

        stdout: StdioCollector {
            onStreamFinished: {
                root.battery = parseInt(this.text)
                const batCase = Math.round(root.battery / 10)
                switch (batCase){
                    case 0:
                        root.batteryIcon = "\udb80\udc7a"
                        break
                    case 1:
                        root.batteryIcon = "\udb80\udc7b"
                        break
                    case 2:
                        root.batteryIcon = "\udb80\udc7c"
                        break
                    case 3:
                        root.batteryIcon = "\udb80\udc7d"
                        break
                    case 4:
                        root.batteryIcon = "\udb80\udc7e"
                        break
                    case 5:
                        root.batteryIcon = "\udb80\udc7f"
                        break
                    case 6:
                        root.batteryIcon = "\udb80\udc80"
                        break
                    case 7:
                        root.batteryIcon = "\udb80\udc81"
                        break
                    case 8:
                        root.batteryIcon = "\udb80\udc82"
                        break
                    case 9:
                        root.batteryIcon = "\udb80\udc79"
                        break
                    default:
                        root.batteryIcon = "\udb80\udc79"
                        break
                }
            }
        }

    }

    Process {
        id: energy

    }

    Process {
        id: power 

    }

    Process {
        id: charging
        running: true
        command: ["cat","/sys/class/power_supply/ADP1/online"]

        stdout: StdioCollector {
            onStreamFinished: {
                root.isCharging = parseInt(this.text)
                root.chargingIcon = root.isCharging ? "\udb85\udc0b" : ""
            }
        }
    }
}