import QtQuick
import QtQuick.Controls
Item {
    id: clickableButton

    property string baseColor: "#353535"
    property string hoverColor: "#F7CA18"
    property double borderRadius: 5.0
    property string buttonText: "Sliding Button"
    property string textColor: "#ffffff"
    property string hoverTextColor: "#ffffff"
    property int textFontSize: 15
    property string shadowColor: Qt.darker(baseColor, 1.5)

    signal buttonClicked()

    width: lb.implicitWidth + lb.leftPadding * 2
    height: lb.implicitHeight + lb.topPadding * 2


    // static
    Rectangle {
        id: backgroundBtn
        anchors.fill: parent
        color: clickableButton.baseColor
        border.color: clickableButton.hoverColor
        border.width: 3
        radius: clickableButton.borderRadius
    }

    // Slide background

    Rectangle {
        id: hoverEffect
        height: parent.height
        width: 0
        color: clickableButton.hoverColor
        radius: clickableButton.borderRadius
        border.color: clickableButton.hoverColor
        border.width: 3
    }

    Label {
        id: lb
        text: clickableButton.buttonText
        anchors.centerIn: parent
        topPadding: 10
        bottomPadding: 10
        leftPadding: 20
        rightPadding: 20
        font.pointSize: clickableButton.textFontSize
        color: clickableButton.textColor
    }

    MouseArea {
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor
        hoverEnabled: true
        onEntered: {
            enterHoverEnimation.start()
        }
        onExited: {
            exitHoverEnimation.start()
        }
        onClicked: clickableButton.buttonClicked()
    }

    NumberAnimation {
        id: enterHoverEnimation
        target: hoverEffect
        property: "width"
        to: backgroundBtn.width
        duration: 500
        easing.type: Easing.InOutQuad
    }

    NumberAnimation {
        id: exitHoverEnimation
        target: hoverEffect
        property: "width"
        to: 0
        duration: 500
        easing.type: Easing.InOutQuad
    }
}
