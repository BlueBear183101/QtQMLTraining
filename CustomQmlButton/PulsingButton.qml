import QtQuick
import QtQuick.Controls.Basic

Item {
    id: pulsingBtn

    property string baseColor: Qt.darker("#ff3466", 1.1)
    property double borderRadius: 20.0
    property string buttonText: "Click Me"
    property string textColor: "#ffffff"
    property int textFontSize: 15

    signal buttonPulsingClicked()

    width: lb.implicitWidth + lb.leftPadding * 2
    height: lb.implicitHeight + lb.topPadding * 2
    // Pulse background effect
    Rectangle {
        id: pulsingBgro
        anchors.fill: parent
        color: Qt.lighter(pulsingBtn.baseColor, 1.4)
        radius: pulsingBtn.borderRadius
        opacity: 0.8

        ParallelAnimation {
            running: true
            loops: Animation.Infinite
            PropertyAnimation {
                target: pulsingBgro
                property: "scale"
                to: 1.3
                duration: 1300
            }

            NumberAnimation {
                target: pulsingBgro
                property: "opacity"
                to: 0.3
                duration: 1300
            }
        }
    }

    // static background
    Rectangle {
        id: staticBgro
        anchors.fill: parent
        color: pulsingBtn.baseColor
        radius: pulsingBtn.borderRadius
    }

    Label {
        id: lb
        text: pulsingBtn.buttonText
        anchors.centerIn: parent
        topPadding: 10
        bottomPadding: 10
        leftPadding: 20
        rightPadding: 20
        color: pulsingBtn.textColor
        font.pointSize: pulsingBtn.textFontSize
    }

    // Interaction Area
    MouseArea {
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor
        hoverEnabled: true

        onClicked: pulsingBtn.buttonPulsingClicked()

        onEntered: {
            hoverEffect.to = Qt.darker(staticBgro.color, 1.2)
            hoverEffect.start()
        }

        onExited: {
            hoverEffect.to = pulsingBtn.baseColor
            hoverEffect.start()
        }

    }


    ColorAnimation {
        id: hoverEffect
        target: staticBgro
        property: "color"
        duration: 300
        easing.type: Easing.InOutQuad
    }
}
