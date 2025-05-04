import QtQuick
import QtQuick.Layouts

Window {
    width: 1000
    height: 600
    visible: true
    title: qsTr("Custom Button")

    Rectangle {
        anchors.fill: parent
        color: "#353535"
    }

    GridLayout {
        id: btnGridLayout
        anchors.centerIn: parent
        rows: 3
        columns: 2
        rowSpacing: 60
        columnSpacing: 100

        HoverButton {
            onButtonHoverClicked: {
                console.log("Hover Button")
            }
        }

        PulsingButton {
            onButtonPulsingClicked: {
                console.log("Pulsing Button")
            }
        }

        SlideButton {

        }
    }
}
