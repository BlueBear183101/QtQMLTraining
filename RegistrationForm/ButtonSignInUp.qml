import QtQuick
import QtQuick.Controls

Item {
    property alias widthBtn: backRec.width
    property alias heightBtn: backRec.height
    property alias textBtn: txtBtn.text
    property int radiusBtn: 10
    property alias recColor: backRec.color
    property alias recBorWidth: backRec.border.width
    width: widthBtn
    height: txtBtn.implicitHeight + 2*txtBtn.topPadding
    Rectangle {
        id: backRec
        anchors.fill: parent
        radius: radiusBtn
        border.width: 0
        border.color: "#E3A8A3"

        Text {
            id: txtBtn
            anchors.centerIn: parent
            topPadding: 8
            color: "#30154A"
            font.family: "Manjari"
            font.bold: true
            font.pointSize: 11
        }
    }
}
