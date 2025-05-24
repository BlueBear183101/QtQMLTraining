import QtQuick
import QtQuick.Controls
Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Counter")

    Text {
        text: "Counter Application"
        font.pointSize: 20
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: 40
    }

    Column {
        id: clm
        spacing: 50
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: 150
        Label {
            id : numberCounter
            text: "0"
            font.pointSize: 30
            anchors.horizontalCenter: clm.horizontalCenter

        }

        Row {

            spacing: 30

            Button {
                height: 50
                width: 50
                contentItem: Text {
                    text: "-"
                    font.pointSize: 25
                    color: "white"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }

                font.pointSize: 25
                background: Rectangle {
                    color: "#27548A"
                    radius: 2
                }
                onClicked: {
                    numberCounter.text = Number(numberCounter.text) - 1
                }
            }
            Button {
                height: 50
                width: 50
                contentItem: Text {
                    text: "+"
                    font.pointSize: 25
                    color: "white"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
                font.pointSize: 25
                background: Rectangle{
                    color: "#27548A"
                    radius: 2
                }
                onClicked: {
                    numberCounter.text = Number(numberCounter.text) + 1
                }
            }
        }

    }
}
