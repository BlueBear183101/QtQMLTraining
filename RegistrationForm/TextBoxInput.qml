import QtQuick
import QtQuick.Controls

Item {
    id: root
    property int widthRec
    property int heightRec
    property string placeHolderText: "Enter Text"
    property int borderWidth: 2
    property color borderColor: "#E3A8A3"
    property int radiusRec: 10
    property int fontSize: 14
    property alias echoMode : input.echoMode
    property alias textContent: input.text
    width: widthRec
    height: input.implicitHeight + 2 * input.topPadding
    TextField {
        id: input
        anchors.fill: parent
        font.pixelSize: fontSize
        font.family: "Manjari"
        placeholderText: placeHolderText
        topPadding: 8
        bottomPadding: 7
        leftPadding: 15
        rightPadding: 15
        background: Rectangle {
            border.width: root.borderWidth
            border.color: root.borderColor
            radius: root.radiusRec
        }
    }

}
