import QtQuick
import QtQuick.Controls.Basic
import Qt5Compat.GraphicalEffects

Item {
    id: neonButton

    property string baseColor: "transparent"
    property color borderColor: "#2dc653"
    property double borderRadius: 5.0
    property string buttonText: "Neon Button"
    property color textColor: "#ffffff"
    property int fontSize: 15
    property color shadowColor: Qt.darker(borderColor, 1.5)
    property color hoverShadowColor: Qt.lighter(borderColor, 1.1)
    property color exitShadowColor: Qt.darker(borderColor, 1.5)
    property int shadowRadius: 5
    property int shadowSamples: 7

    signal buttonClicked()

    width: content.width + content.leftPadding * 2
    height: content.height + content.topPadding * 2

    Rectangle {
        id: backgroundContainer
        anchors.fill: parent
        color: neonButton.baseColor
        radius: neonButton.borderRadius
        border.width: 1
        border.color: neonButton.borderColor

        layer.enabled: true
        layer.effect: DropShadow {
            transparentBorder: true
            color: neonButton.shadowColor
            radius: neonButton.shadowRadius
            samples: neonButton.shadowSamples
            horizontalOffset: 1
            verticalOffset: 1
        }
    }

    Label {
        id: content
        text: neonButton.buttonText
        anchors.centerIn: parent
        color: neonButton.textColor
        topPadding: 10
        bottomPadding: 10
        leftPadding: 20
        rightPadding: 20
        font.pointSize: neonButton.fontSize
    }
    
    MouseArea {
        id: mouseEvent
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor
        hoverEnabled: true
        
        onClicked: neonButton.buttonClicked()

        onEntered: {
            hoverEnterAnimation.start()
        }

        onExited: {
            hoverExitAnimation.start()
        }
    }

    ParallelAnimation {
        id: hoverEnterAnimation
        running: false


        ColorAnimation {
            target: backgroundContainer
            property: "color"
            to: neonButton.borderColor
            duration: 200
            easing.type: Easing.InOutQuad
        }
        ColorAnimation {
            target: neonButton
            property: "shadowColor"
            to: neonButton.hoverShadowColor
            duration: 200
            easing.type: Easing.InOutQuad
        }
        NumberAnimation {
            target: neonButton
            property: "shadowRadius"
            to: 22
            duration: 50
            easing.type: Easing.InOutQuad
        }
        NumberAnimation {
            target: neonButton
            property: "shadowSamples"
            to: 50
            duration: 50
            easing.type: Easing.InOutQuad
        }
    }

    ParallelAnimation {
        id: hoverExitAnimation
        ColorAnimation {
            target: backgroundContainer
            property: "color"
            to: neonButton.baseColor
            duration: 200
            easing.type: Easing.InOutQuad
        }
        ColorAnimation {
            target: neonButton
            property: "shadowColor"
            to: neonButton.exitShadowColor
            duration: 200
            easing.type: Easing.InOutQuad
        }
        NumberAnimation {
            target: neonButton
            property: "shadowRadius"
            to: 3
            duration: 50
            easing.type: Easing.InOutQuad
        }
        NumberAnimation {
            target: neonButton
            property: "shadowSamples"
            to: 7
            duration: 50
            easing.type: Easing.InOutQuad
        }
    }

}
