import QtQuick
import Qt5Compat.GraphicalEffects

Window {
    width: 1200
    height: 900
    visible: true
    title: qsTr("Registration")

    //#DFC2CC
    Rectangle {
        anchors.fill: parent

        gradient: Gradient {
            orientation: Gradient.Horizontal
            GradientStop {
                position: 0.0
                color: "#f5ebe0"
            }
            GradientStop {
                position: 0.5
                color: "#E1CBD3"
            }

            GradientStop {
                position: 1.0
                color: "#DFC2CC"
            }
        }
    }
    Rectangle {
        id: mainRect
        width: 800
        height: 600
        color: "#FEFCFD"
        anchors.centerIn: parent
        radius: 20
        layer.enabled: true
        layer.effect: DropShadow {
            transparentBorder: true
            color: Qt.darker(mainRect.color, 1.5)
            radius: 20
            samples: 11
            horizontalOffset: 5
            verticalOffset: 5
        }

        Row {
            spacing: 50
            anchors.fill: mainRect
            Image {
                id: imgResgister
                property int radius: mainRect.radius
                source: "qrc:/images/pictureRegister.png"
                height: mainRect.height
                width: mainRect.width / 2
                fillMode: Image.PreserveAspectCrop

                layer.enabled: true
                layer.effect: OpacityMask {
                    id: opacityMaskImg
                    maskSource: Rectangle {
                        id: maskedRect
                        width: imgResgister.width
                        height: imgResgister.height
                        topLeftRadius: imgResgister.radius
                        bottomLeftRadius: imgResgister.radius
                    }
                }
            }

            Column {
                id: colRight
                width: mainRect.width / 2 - 2 * parent.spacing
                height: mainRect.height
                topPadding: 50

                spacing: 20

                Text {
                    text: "Get Started"
                    font.pointSize: 18
                    font.family: "Manjari"
                    font.bold: true
                    color: "#30154A"
                }

                Column {
                    id: colName
                    topPadding: 10
                    spacing: 12
                    width: colRight.width
                    Text {
                        text: "Name"
                        font.family: "Manjari"
                        color: "#30154A"
                        font.pointSize: 12
                    }
                    TextBoxInput {
                        id: tbxNameInput
                        placeHolderText: "Name"
                        fontSize: 14
                        widthRec: parent.width
                    }
                }

                Column {
                    id: colEmail
                    spacing: 12
                    width: colRight.width
                    Text {
                        text: "Email"
                        font.family: "Manjari"
                        color: "#30154A"
                        font.pointSize: 12
                    }
                    TextBoxInput {
                        id: tbxEmailInput
                        placeHolderText: "Email"
                        fontSize: 14
                        widthRec: parent.width
                    }
                }

                Column {
                    id: colPassword
                    spacing: 12
                    width: colRight.width
                    Text {
                        text: "Password"
                        font.family: "Manjari"
                        color: "#30154A"
                        font.pointSize: 12
                    }
                    TextBoxInput {
                        id: tbxPasswordInput
                        placeHolderText: "Password"
                        fontSize: 14
                        widthRec: parent.width
                        echoMode: TextInput.Password
                        Image {
                            id: iconVisibility
                            anchors.margins: 10
                            anchors.right: parent.right
                            source: "qrc:/images/visibility.svg"
                            anchors.verticalCenter: parent.verticalCenter

                            MouseArea {
                                anchors.fill: parent
                                onPressed: {
                                    tbxPasswordInput.echoMode = TextInput.Normal
                                }
                                onReleased: {
                                    tbxPasswordInput.echoMode = TextInput.Password
                                }
                                onCanceled: {
                                    tbxPasswordInput.echoMode = TextInput.Password
                                }
                            }
                        }
                    }
                }

                Row {
                    id: rowSignButton
                    spacing: 20
                    width: colRight.width

                    ButtonSignInUp {
                        id: btnSignUp
                        widthBtn: (parent.width - parent.spacing) / 2
                        textBtn: "Sign Up"
                        recColor: "#F5D67E"

                        MouseArea {
                            anchors.fill: parent

                            onClicked: {
                                var name = tbxNameInput.textContent
                                var email = tbxEmailInput.textContent
                                var pwd = tbxPasswordInput.textContent
                                console.log("Sign Up Click with name = " + name + ", email = " + email + ", password = " + pwd)
                            }
                        }
                    }

                    ButtonSignInUp {
                        id: btnSignIn
                        widthBtn: (parent.width - parent.spacing) / 2
                        textBtn: "Sign In"

                        MouseArea {
                            anchors.fill: parent
                            hoverEnabled: true

                            onEntered: {
                                btnSignIn.recBorWidth = 2
                            }

                            onExited: {
                                btnSignIn.recBorWidth = 0
                            }

                            onClicked: {
                                console.log("SignIn Clicked!")
                            }
                        }
                    }
                }

                Column {
                    id: colContinue
                    spacing: 10
                    width: colRight.width

                    Text {
                        anchors.horizontalCenter: parent.horizontalCenter
                        text: "or continue width"
                        color: "#aaa"
                        font.family: "lato"
                        font.pointSize: 8
                    }

                    Row {
                        spacing: 20
                        anchors.horizontalCenter: parent.horizontalCenter
                        Image {
                            id: appleImg
                            source: "qrc:/images/apple.svg"
                            width: 35
                            height: 35
                            layer.enabled: true
                            layer.effect: OpacityMask {
                                maskSource: Rectangle {
                                    width: 35
                                    height: 35
                                    radius: 5
                                }
                            }

                            MouseArea {
                                anchors.fill: parent

                                onClicked: {
                                    console.log("Apple Login")
                                }
                            }
                        }

                        Image {
                            id: googleImg
                            source: "qrc:/images/google.svg"
                            width: 35
                            height: 35
                            layer.enabled: true
                            layer.effect: OpacityMask {
                                maskSource: Rectangle {
                                    width: 35
                                    height: 35
                                    radius: 5
                                }
                            }

                            MouseArea {
                                anchors.fill: parent

                                onClicked: {
                                    console.log("Google Login")
                                }
                            }
                        }

                        Image {
                            id: facebookImg
                            source: "qrc:/images/facebook.svg"
                            width: 35
                            height: 35
                            layer.enabled: true
                            layer.effect: OpacityMask {
                                maskSource: Rectangle {
                                    width: 35
                                    height: 35
                                    radius: 5
                                }
                            }
                            MouseArea {
                                anchors.fill: parent

                                onClicked: {
                                    console.log("Facebook Login")
                                }
                            }
                        }


                    }
                }
                Row {
                    id: cboxTermOfService
                    spacing: 10
                    anchors.horizontalCenter: parent.horizontalCenter

                    Rectangle {
                        id: cbxRec
                        width: 20
                        height: 20
                        border.color: "#E3A8A3"
                        border.width: 2
                        color: "transparent"
                        anchors.verticalCenter: parent.verticalCenter

                        Image {
                            id: checkImg
                            source: "qrc:/images/check_pink.svg"
                            anchors.fill: parent
                            anchors.margins: 2
                            fillMode: Image.PreserveAspectFit
                            visible: false
                        }

                        MouseArea {
                            anchors.fill: cbxRec

                            onClicked: {
                                checkImg.visible = !checkImg.visible
                            }
                        }


                    }

                    Text {
                        textFormat: Text.RichText
                        anchors.verticalCenter: parent.verticalCenter
                        text: ' I agree to <a href="termService" style="color:#30154A; font-family:Manjari; text-decoration:underline;">Term of service</a>
                                and <a href="privacy" style="color:#30154A; font-family:Manjari; text-decoration:underline;">Privacy Policy</a>'
                        color: "#aaa"

                        font.pointSize: 8

                        onLinkActivated: function(link){
                            if (link === "termService") {
                                console.log("Term of Service Clicked!");
                            }
                            else if (link === "privacy") {
                                console.log("Privacy Policy Clicked!");
                            }
                        }
                    }

                }


            }
        }
    }
}
