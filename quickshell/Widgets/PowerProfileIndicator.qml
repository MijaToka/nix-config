pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
    id: root
    property string powerProfileIcon
    property bool turbo
    property string color
    
    Timer {
        interval: 5000
        running: true
        repeat: true
        onTriggered: {
          checkTurbo.running = true
          checkProfile.running = true
        }
    }

    Process {
      id: checkTurbo
      command: ["cat","/sys/devices/system/cpu/intel_pstate/no_turbo"]
      running: true

      stdout: StdioCollector {
        onStreamFinished: {
          root.turbo = !parseInt(this.text) 
          }
      }
    }
    Process {
        id: checkProfile
        command: ["cat","/sys/devices/system/cpu/cpufreq/policy0/scaling_governor"]
        running: true

        stdout: StdioCollector {
            onStreamFinished: {
                const trimmedtext = this.text.trim()
                switch (trimmedtext) {
                    case "performance":
                        root.powerProfileIcon = root.turbo ? "\udb82\udc20":"\udb85\udc0b"
                        root.color = "#B50000"
                        break
                    case "balanced":
                        root.powerProfileIcon = "\uf24e"
                        root.color = "#4F5FAE"
                        break
                    case "powersave":
                    root.powerProfileIcon = root.turbo ? "\udb86\udd05" : "\udb80\udf2a"
                        root.color = "#4AA04F"
                        break
                    default:
                        root.powerProfileIcon = "\udb84\udd05"
                        break
                }
            }
        }
    }
}
