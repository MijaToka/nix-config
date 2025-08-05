import QtQuick
import Quickshell

Rectangle {
    id: root

    property string text
    
    property string fillColor: "#111111"
    property string textColor: "#ffffff"
    property string borderColor: "#111111"
    
    property bool hasBorder: false
    property bool isSymbol: true
    
    property string symbolFont: "Symbols Nerd Font Mono"

    FontLoader {
        id: jetBrainsMono
        source: "/nix/store/nq4ns1qivbcsaiml82d1hidlhy2wq1m3-home-manager-path/share/fonts/truetype/NerdFonts/JetBrainsMono/JetBrainsMonoNerdFontPropo-Regular.ttf"
    }

    height: parent.height
    width: textObj.width + 10
    radius: 5
    color: fillColor

    border {
        width: hasBorder ? 2 : 0
        color: borderColor
    }

    Text {
        id: textObj
        text: root.text
        color: textColor
        font {
            pixelSize: 12
            family: isSymbol? symbolFont : jetBrainsMono.name
        }
        anchors {
            centerIn: parent
        }
    } 
}