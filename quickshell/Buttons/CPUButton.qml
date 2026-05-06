import "../Buttons"
import "../Widgets"
import QtQuick

Button {
    id: root
    property bool state: true
    text: state ? CPUStatus.percentageUse + "% \uf4bc" : CPUStatus.temperature + "°C \uf4bc"
    isSymbol: false

    MouseArea {
        anchors.fill: parent
        onClicked: {
            root.state = !root.state;
        }
    }
}
