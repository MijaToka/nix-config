import "../Buttons"
import "../Widgets"
import QtQuick
import Quickshell
import Quickshell.Io

Button {

    id: root
    // PowerProfileIndicator {id:powerProfile}

    text: PowerProfileIndicator.powerProfileIcon
    fillColor: PowerProfileIndicator.color

}
