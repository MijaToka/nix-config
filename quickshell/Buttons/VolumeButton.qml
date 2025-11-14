import "../Buttons"
import "../Widgets"
import QtQuick
import Quickshell
import Quickshell.Io

Button {
    id: root
    text: (true?VolumeStatus.volume + "% ":"") + audioIcon

    property int volumeLevel: (VolumeStatus.volume >= 66) + (VolumeStatus.volume >= 33)
    property string audioIcon: VolumeStatus.muted? "\ueee8": (volumeLevel == 0?"\uf026":(volumeLevel==1?"\uf027":(volumeLevel==2?"\uf028":"\uf028")))
    property string muteMicIcon: "\uf131"

}