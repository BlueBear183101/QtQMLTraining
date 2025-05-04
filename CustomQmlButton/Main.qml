import QtQuick

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Custom Button")

    Rectangle {
        anchors.fill: parent
        color: "#353535"
    }

    HoverButton {
        x: 100
        y: 100

        onButtonHoverClicked: {
            console.log("Hover Button")
        }
    }
}
