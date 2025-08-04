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
                left: true
                right: true
            }

            margins {
                top: 10
                left: 10
                right: 10
            }

            BarBase {}
            BarContents { id: barContent }     



            implicitHeight: 30
        }

    }
}