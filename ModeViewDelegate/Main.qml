import QtQuick
import QtQuick.Controls
Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    ListModel {
        id: models
        ListElement {
            name: "abc"
            age: 24
        }

        ListElement {
            name: "def"
            age: 25
        }

        ListElement {
            name: "ghi"
            age: 25
        }

        ListElement {
            name: "jkl"
            age: 26
        }

        ListElement {
            name: "mno"
            age: 27
        }
    }

    ListView {
        width: 100
        height: 100
        anchors.centerIn: parent
        spacing: 10

        model: models

        delegate: myDelegate
    }
    Component {
        id: myDelegate

        Label {
            required property string name
            required property int age
            text: "This number is " + name + ". Age: " + age
            font.pointSize: 15
        }
    }
}
