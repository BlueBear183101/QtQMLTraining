import QtQuick 2.15
import QtQuick.Controls.Basic
import Qt5Compat.GraphicalEffects
Item {
    id : hoverButton

    property string baseColor: "#3dccc7"
    property double borderRadius: 5.0
    property string buttonText: "Click Me"
    property string textColor: "#ffffff"
    property int textFontSize: 15
    property string shadowColor: Qt.darker(baseColor, 1.6)

    signal buttonHoverClicked()

    width: buttonLabel.implicitWidth + buttonLabel.rightPadding * 2
    height: buttonLabel.implicitHeight + buttonLabel.topPadding * 2
    Rectangle {
        id: buttonBackground
        anchors.fill: parent
        color: hoverButton.baseColor
        radius: hoverButton.borderRadius

        layer.enabled: true
        layer.effect: DropShadow {
            transparentBorder: true
            color: hoverButton.shadowColor
            horizontalOffset: 2
            verticalOffset: 2
            radius: 15
            samples: 32
        }
    }

    Label {
        id: buttonLabel
        anchors.centerIn: parent
        topPadding: 10
        bottomPadding: 10
        rightPadding: 20
        leftPadding: 20
        text: "Hover Button"
        font.pointSize: hoverButton.textFontSize
        color: hoverButton.textColor
    }

    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor
        onClicked: hoverButton.buttonHoverClicked()

        onEntered: {
            hoverEffect.to = hoverButton.shadowColor
            hoverEffect.start()
        }

        onExited: {
            hoverEffect.to = hoverButton.baseColor
            hoverEffect.start()
        }
    }


    ColorAnimation {
        id: hoverEffect
        duration: 300
        target: buttonBackground
        properties: "color"
        easing.type: Easing.InOutQuad
    }

}
