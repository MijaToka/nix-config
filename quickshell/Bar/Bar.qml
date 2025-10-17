import Quickshell
import QtQuick
Scope {
    Variants {
        model: Quickshell.screens;
        PanelWindow {
            id: panel
            required property var modelData
            screen: modelData
            color: "transparent"
            anchors {
                top: true
                bottom: false
                left: true
                right: true
            }

            margins {
                top: 5
                left: 5
                right: 5
            }

            BarBg {}
            BarContents { id: barContent }     

            implicitHeight: 35
        }

    }
}