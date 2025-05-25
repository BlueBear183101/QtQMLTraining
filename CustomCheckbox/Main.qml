import QtQuick
import QtQuick.Controls
Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    CheckBox {
        text: qsTr("Do you agree ?")
        font.pointSize: 20
        checked: true
    }

    property bool isChecked: false
    Row {
        spacing: 40
        anchors.centerIn: parent
        Rectangle {
            id: cbx
            width: 80
            height: 80

            color: "transparent"
            border.width: 5
            anchors.verticalCenter: parent.verticalCenter

            Image {
                id: tick
                source: "qrc:/img/checkIcon.svg"
                anchors.fill: cbx
                visible: isChecked
            }

            MouseArea {
                anchors.fill: cbx
                onClicked: {
                    tick.visible = !tick.visible
                }
            }
        }
        Text {
            text: "Do you agree ?"
            font.pointSize: 30
            anchors.verticalCenter: parent.verticalCenter
        }




    }


}
