import "../Buttons"
import "../Widgets"
import QtQuick

Button {
    id: root
    // PowerProfileIndicator {id:powerProfile}

    text: PowerProfileIndicator.powerProfileIcon
    fillColor: PowerProfileIndicator.color
}
