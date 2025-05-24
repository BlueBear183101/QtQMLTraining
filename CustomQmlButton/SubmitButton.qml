import QtQuick
import QtQuick.Controls.Fusion
import Qt5Compat.GraphicalEffects

Item {
    id: loadingBtn
    property string baseColor: "#6c757d"
    property string spinnerColor: Qt.darker(baseColor, 1.45)
    property string highlightColor: Qt.lighter(baseColor, 1.1)
    property double borderRadius: 5.0
    property string buttonText: "Submit Button"
    property string textColor: "#ffffff"
    property int fontSize: 15
    property int iconDimension: 50
    property int busyIndicatorSize: 60
    property string shadowColor: Qt.darker(baseColor, 1.1)

    signal buttonClicked()

    width: textLabel.width + textLabel.leftPadding * 2
    height: textLabel.height + textLabel.topPadding * 2

    // Background with shadow
    Rectangle {
        id: background
        anchors.fill: parent
        color: loadingBtn.baseColor
        radius: loadingBtn.borderRadius

        layer.enabled: true
        layer.effect: DropShadow {
            transparentBorder: true
            color:loadingBtn.shadowColor
            radius: 15
            samples: 35
            horizontalOffset: 1
            verticalOffset: 1
        }
    }

    // ProgressBar for loading indication
    Rectangle {
        id: progressBar
        height: parent.height
        width: 0
        color: loadingBtn.spinnerColor
    }

    Label {
        id: textLabel
        text: loadingBtn.buttonText
        anchors.centerIn: parent
        topPadding: 10
        rightPadding: 20
        bottomPadding: 10
        leftPadding: 20
        font.pointSize: loadingBtn.fontSize
        color: loadingBtn.textColor
    }

    BusyIndicator {
        id: busyIndicator
        visible: false
        anchors.centerIn: parent
        width: loadingBtn.busyIndicatorSize
        height: loadingBtn.busyIndicatorSize
        palette.text: loadingBtn.highlightColor
    }

    Image {
        id: icon
        source: "qrc:/images/check.svg"
        width: loadingBtn.iconDimension
        height: loadingBtn.iconDimension
        visible: false
        anchors.centerIn: parent
    }

    // interaction handling
    MouseArea {
        id: interactionArea
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor
        hoverEnabled: true

        onClicked: {
            loadingBtn.buttonClicked()
            if (icon.visible){
                textLabel.visible = true
                busyIndicator.visible = false
                icon.visible = false
                progressBar.width = 0
            }
            else if (busyIndicator.visible){
                textLabel.visible = true
                busyIndicator.visible = false
                icon.visible = false
                progressBar.width = 0
            }
            else {
                textLabel.visible = false
                busyIndicator.visible = true
                icon.visible = false
                loadingAnimation.start()
            }


        }
    }


    NumberAnimation {
        id: loadingAnimation
        target: progressBar
        property: "width"
        duration: 1000
        to: loadingBtn.width
        easing.type: Easing.InOutQuad
        onFinished: {
            busyIndicator.visible = false
            icon.visible = true
        }
    }

}
