import QtQuick
import QtQuick.Controls.Fusion

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Rectangle {
        anchors.fill: parent
        color: "#333"
    }

    Row {
        spacing: 100
        anchors.centerIn: parent

        BusyIndicator {
            width: 60
            height: 60
            palette.text: "white"
            anchors.verticalCenter: parent.verticalCenter
        }

        AnimatedImage {
            source: "qrc:/img/BusyLoading.gif"
            anchors.verticalCenter: parent.verticalCenter
        }
    }
}
