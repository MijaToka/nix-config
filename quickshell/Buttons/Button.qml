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
    
    property bool doubleWidth: false

    FontLoader {
        id: jetBrainsMono
        source: "/home/mija/.nix-profile/share/fonts/truetype/NerdFonts/JetBrainsMono/JetBrainsMonoNerdFontPropo-Regular.ttf"
    }

    height: parent.height
    width: !doubleWidth ? textObj.width + 15 : textObj.width * 2 + 15
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
            pixelSize: 13
            family: isSymbol? symbolFont : jetBrainsMono.name
        }
        anchors {
            centerIn: parent
        }
    } 
}