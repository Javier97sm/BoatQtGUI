import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQuick.Window 2.14
import QtQuick.Controls.Material 2.12
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4
import QtSensors 5.11

import QtLocation 5.6
import QtPositioning 5.6

ApplicationWindow {

    id: window

    //objectName: "logObject"

    width: 1200
    height: 800
    visible: true
    title: qsTr("EQEL HMI")

    Material.theme: Material.Dark
    Material.accent: Material.Purple

    color: "#0f0f17"

    property string waterLevel : dataClassQML.qWaterLevel
    property string temperature : dataClassQML.qTemperature;
    property string humidity : dataClassQML.qHumidity;
    property string yaw : dataClassQML.qYaw;
    property string pos_X : dataClassQML.qPos_X;
    property string pos_Y : dataClassQML.qPos_Y;
    property string pos_Z : dataClassQML.qPos_Z;
    property string acc_X : dataClassQML.qAcc_X;
    property string acc_Y : dataClassQML.qAcc_Y;
    property string acc_Z : dataClassQML.qAcc_Z;
    property string vel_X : dataClassQML.qVel_X;
    property string vel_Y : dataClassQML.qVel_Y;
    property string vel_Z : dataClassQML.qVel_Z;
    property string mag_X : dataClassQML.qMag_X;
    property string mag_Y : dataClassQML.qMag_Y;
    property string mag_Z : dataClassQML.qMag_Z;
    property string latitud : dataClassQML.qLatitud;
    property string longitud : dataClassQML.qLongitud;
    property string current : dataClassQML.qCurrent;


//    function myQmlFunction(msg) {
//        console.log("Got message:", msg)
//        waterLevel = msg;
//    }

//    property string logsOutputText: ""


//    function appendLogOutput(logText) {
//        logsOutputText = logText
//        console.log("QML<<  " + logsOutputText + " >>QML")
//    }


    RowLayout { //Columna izquierda
        anchors.fill: parent

        Rectangle {
            Layout.alignment: Qt.AlignLeft | Qt.AlignTop
            Layout.topMargin: 20
            Layout.leftMargin: 20
            Layout.rightMargin: 20
            width: 600
            height: 1000
            color:  "transparent"

            ColumnLayout {
                anchors.fill: parent
                spacing: 20

                Rectangle {
                    gradient: Gradient {
                        GradientStop { position: 0.0; color: "#062a45" }
                        GradientStop { position: 1; color: "#08426e" }
                    }
                    width: 600
                    height: 130
                    radius: 10

                    Text {
                        text: "Comunicaciones"
                        font.pixelSize: 30
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.top: parent.top
                        anchors.topMargin: 20
                        color: "white"
                    }
                    TextField {
                        id: textIP
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: 10
                        height: 55
                        width: 500
                        color: "black"
                        font.pixelSize: 30
                        focus: false
                        background: Rectangle {
                            height: 55
                            width: 500
                            color: "white"
                        }
                        onTextEdited: {
                            dataClassQML.setIP(textIP.text);
                        }
                    }
                }

                Rectangle {
                    Layout.alignment: Qt.AlignBottom
                    Layout.bottomMargin: 60
                    gradient: Gradient {
                        GradientStop { position: 0.0; color: "#062a45" }
                        GradientStop { position: 1; color: "#08426e" }
                    }
                    width: 600
                    height: 930
                    radius: 10

                    Text {
                        text: "Acelerómetro"
                        font.pixelSize: 30
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.top: parent.top
                        anchors.topMargin: 10
                        color: "white"
                    }

                    Rectangle {
                        height: 330
                        width: 330
                        radius: 10000
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.topMargin: 70
                        anchors.top: parent.top
                        border.color: "transparent"
                        border.width: 50
                        Rectangle {
                            anchors.centerIn: parent
                            height: 280
                            width: 280
                            radius: 10000
                            z: 2
                            gradient: Gradient {
                                GradientStop { position: 0.0; color: "#7fd2f0" }
                                GradientStop { position: 0.47; color: "#7fd2f0" }
                                GradientStop { position: 0.53; color: "blue" }
                                GradientStop { position: 1; color: "blue" }
                            }
                        }
                        Image {
                            anchors.centerIn: parent
                            source: "qrc:/images/shipLateralView.png"
                            sourceSize.width: 200
                            sourceSize.height: 200
                            z: 3
                        }
                        Image {
                            anchors.centerIn: parent
                            source: "qrc:/images/brujula.png"
                            sourceSize.width: 350
                            sourceSize.height: 350
                            z: 1
                        }
                        Rectangle {
                            anchors.centerIn: parent
                            color: "white"
                            height: 360
                            width: 360
                            radius: 10000
                            z: 0
                        }
                    }

                    Rectangle {
                        width: 400
                        height: 450
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: 20
                        anchors.horizontalCenter: parent.horizontalCenter
                        color: "transparent"
                        RowLayout {
                            anchors.fill: parent
                            spacing: 10
                            ColumnLayout {
                                spacing: 10
                                Text{
                                    text: "YAW"
                                    font.pixelSize: 22
                                    color: "white"
                                }
                                Text{
                                    text: "Posición X"
                                    font.pixelSize: 22
                                    color: "white"
                                }
                                Text {
                                    text: "Posición Y"
                                    font.pixelSize: 22
                                    color: "white"
                                }
                                Text {
                                    text: "Posición Z"
                                    font.pixelSize: 22
                                    color: "white"
                                }
                                Text{
                                    text: "Aceleración X"
                                    font.pixelSize: 22
                                    color: "white"
                                }
                                Text {
                                    text: "Aceleración Y"
                                    font.pixelSize: 22
                                    color: "white"
                                }
                                Text {
                                    text: "Aceleración Z"
                                    font.pixelSize: 22
                                    color: "white"
                                }
                                Text{
                                    text: "Velocidad X"
                                    font.pixelSize: 22
                                    color: "white"
                                }
                                Text {
                                    text: "Velocidad Y"
                                    font.pixelSize: 22
                                    color: "white"
                                }
                                Text {
                                    text: "Velocidad Z"
                                    font.pixelSize: 22
                                    color: "white"
                                }
                                Text {
                                    text: "Magnetómetro X"
                                    font.pixelSize: 22
                                    color: "white"
                                }
                                Text {
                                    text: "Magnetómetro Y"
                                    font.pixelSize: 22
                                    color: "white"
                                }
                                Text {
                                    text: "Magnetómetro Z"
                                    font.pixelSize: 22
                                    color: "white"
                                }
                            }
                            ColumnLayout {
                                spacing: 10
                                Rectangle {
                                    width: 200
                                    height: 25
                                    color: "white"
                                    Text{
                                        anchors.fill: parent
                                        text: yaw
                                        font.pixelSize: 22
                                        color: "black"
                                    }
                                }
                                Rectangle {
                                    width: 200
                                    height: 25
                                    color: "white"
                                    Text{
                                        anchors.fill: parent
                                        text: pos_X
                                        font.pixelSize: 22
                                        color: "black"
                                    }
                                }
                                Rectangle {
                                    width: 200
                                    height: 25
                                    color: "white"
                                    Text {
                                        anchors.fill: parent
                                        text: pos_Y
                                        font.pixelSize: 22
                                        color: "black"
                                    }
                                }
                                Rectangle {
                                    width: 200
                                    height: 25
                                    color: "white"
                                    Text {
                                        anchors.fill: parent
                                        text: pos_Z
                                        font.pixelSize: 22
                                        color: "black"
                                    }
                                }
                                Rectangle {
                                    width: 200
                                    height: 25
                                    color: "white"
                                    Text {
                                        anchors.fill: parent
                                        text: acc_X
                                        font.pixelSize: 22
                                        color: "black"
                                    }
                                }
                                Rectangle {
                                    width: 200
                                    height: 25
                                    color: "white"
                                    Text {
                                        anchors.fill: parent
                                        text: acc_Y
                                        font.pixelSize: 22
                                        color: "black"
                                    }
                                }
                                Rectangle {
                                    width: 200
                                    height: 25
                                    color: "white"
                                    Text {
                                        anchors.fill: parent
                                        text: acc_Z
                                        font.pixelSize: 22
                                        color: "black"
                                    }
                                }
                                Rectangle {
                                    width: 200
                                    height: 25
                                    color: "white"
                                    Text {
                                        anchors.fill: parent
                                        text: vel_X
                                        font.pixelSize: 22
                                        color: "black"
                                    }
                                }
                                Rectangle {
                                    width: 200
                                    height: 25
                                    color: "white"
                                    Text {
                                        anchors.fill: parent
                                        text: vel_Y
                                        font.pixelSize: 22
                                        color: "black"
                                    }
                                }
                                Rectangle {
                                    width: 200
                                    height: 25
                                    color: "white"
                                    Text {
                                        anchors.fill: parent
                                        text: vel_Z
                                        font.pixelSize: 22
                                        color: "black"
                                    }
                                }
                                Rectangle {
                                    width: 200
                                    height: 25
                                    color: "white"
                                    Text {
                                        anchors.fill: parent
                                        text: mag_X
                                        font.pixelSize: 22
                                        color: "black"
                                    }
                                }
                                Rectangle {
                                    width: 200
                                    height: 25
                                    color: "white"
                                    Text {
                                        anchors.fill: parent
                                        text: mag_Y
                                        font.pixelSize: 22
                                        color: "black"
                                    }
                                }
                                Rectangle {
                                    width: 200
                                    height: 25
                                    color: "white"
                                    Text {
                                        anchors.fill: parent
                                        text: mag_Z
                                        font.pixelSize: 22
                                        color: "black"
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }


        Rectangle { //Columna medio
            Layout.alignment: Qt.AlignHCenter
            width: 570
            height: 1100
            color:  "transparent"

            ColumnLayout {
                anchors.fill: parent
                spacing: 20

                Text {
                    text: "EQEL T12"
                    font.pixelSize: 50
                    Layout.topMargin: 20
                    horizontalAlignment: Text.AlignHCenter
                    color: "white"
                    Layout.alignment: Qt.AlignHCenter
                }

                Rectangle { //Control motores
                    id: rectangle
                    Layout.alignment: Qt.AlignHCenter
                    width: 570
                    height: 570
                    radius: 10
                    gradient: Gradient {
                        GradientStop { position: 0.0; color: "#062a45" }
                        GradientStop { position: 1; color: "#08426e" }
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            up.focus = true;
                        }
                    }

                    ColumnLayout {
                        anchors.fill: parent
                        RowLayout {
                            Layout.alignment : Qt.AlignHCenter
                            spacing: 20
                            CustomButtom {
                                focus: true
                                Layout.alignment : Qt.AlignHCenter
                                id: up
                                buttonText: "\u21E7"
                            }
                        }
                        RowLayout {
                            Layout.alignment : Qt.AlignHCenter
                            spacing: 50
                            CustomButtom {
                                focus: true
                                id: goLeft
                                buttonText: "\u21E6"
                            }
                            CustomButtom {
                                focus: true
                                Layout.alignment : Qt.AlignHCenter
                                id: stop
                                buttonText: "\u233E"
                            }
                            CustomButtom {
                                focus: true
                                id: goRight
                                buttonText: "\u21E8"
                             }
                         }
                        RowLayout {
                            Layout.alignment : Qt.AlignHCenter
                            spacing: 10
                            CustomButtom {
                                focus: true
                                Layout.alignment : Qt.AlignHCenter
                                id: back
                                buttonText: "\u21E9"
                            }
                        }
                    }
                }

                Rectangle {
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignBottom
                    width: 570
                    height: 400
                    color: "transparent"
                    radius: 10

                    //Corriente humedad y temperatura

                    Rectangle {
                        anchors.top: parent.top
                        anchors.left: parent.left
                        anchors.topMargin: 10
                        anchors.leftMargin: 10
                        width: 200
                        height: 200
                        color: "transparent"
                        Text {
                            text: "Temperatura"
                            font.pixelSize: 20
                            color: "white"
                            z: -10
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.top: parent.top
                            anchors.topMargin: 50
                        }
                        Text {
                            text: "ºC"
                            font.pixelSize: 20
                            color: "white"
                            z: -10
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.bottom: parent.bottom
                            anchors.bottomMargin: 50
                        }
                        CircularGauge { //Temperature
                            anchors.fill: parent
                            value: parseFloat(temperature)
                            Behavior on value {
                                NumberAnimation {
                                    duration: 1000
                                }
                            }
                            minimumValue: 0
                            maximumValue: 50
                            style: CircularGaugeStyle {
                                needle: Rectangle {
                                    y: outerRadius * 0.15
                                    implicitWidth: outerRadius * 0.03
                                    implicitHeight: outerRadius * 0.9
                                    antialiasing: true
                                    color: Qt.rgba(0.66, 0.3, 0, 1)
                                }
                            }
                        }
                    }
                    Rectangle {
                        anchors.top: parent.top
                        anchors.right: parent.right
                        anchors.topMargin: 10
                        anchors.rightMargin: 10
                        width: 200
                        height: 200
                        color: "transparent"
                        Text {
                            text: "Humedad"
                            font.pixelSize: 20
                            color: "white"
                            z: -10
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.top: parent.top
                            anchors.topMargin: 50
                        }
                        Text {
                            text: "%"
                            font.pixelSize: 20
                            color: "white"
                            z: -10
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.bottom: parent.bottom
                            anchors.bottomMargin: 50
                        }
                        CircularGauge { //Humedad
                            anchors.fill: parent
                            value: parseFloat(humidity)
                            Behavior on value {
                                NumberAnimation {
                                    duration: 1000
                                }
                            }
                            minimumValue: 0
                            maximumValue: 100
                            style: CircularGaugeStyle {
                                needle: Rectangle {
                                    y: outerRadius * 0.15
                                    implicitWidth: outerRadius * 0.03
                                    implicitHeight: outerRadius * 0.9
                                    antialiasing: true
                                    color: Qt.rgba(0.66, 0.3, 0, 1)
                                }
                            }
                        }
                    }
                    Rectangle {
                        anchors.bottom: parent.bottom
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.bottomMargin: 10
                        width: 200
                        height: 200
                        color: "transparent"
                        Text {
                            text: "Corriente"
                            font.pixelSize: 20
                            color: "white"
                            z: -10
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.top: parent.top
                            anchors.topMargin: 50
                        }
                        Text {
                            text: "mA"
                            font.pixelSize: 20
                            color: "white"
                            z: -10
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.bottom: parent.bottom
                            anchors.bottomMargin: 50
                        }
                        CircularGauge { //Corriente
                            anchors.fill: parent
                            value: parseFloat(current)*(-1)
                            Behavior on value {
                                NumberAnimation {
                                    duration: 1000
                                }
                            }
                            minimumValue: 0
                            maximumValue: 100
                            style: CircularGaugeStyle {
                                needle: Rectangle {
                                    y: outerRadius * 0.15
                                    implicitWidth: outerRadius * 0.03
                                    implicitHeight: outerRadius * 0.9
                                    antialiasing: true
                                    color: Qt.rgba(0.66, 0.3, 0, 1)
                                }
                            }
                        }
                    }
                }
            }
        }


        Rectangle { //Columna derecha
            Layout.alignment: Qt.AlignRight
            Layout.leftMargin: 20
            Layout.rightMargin: 20
            width: 600
            height: 1100
            color:  "transparent"

            ColumnLayout {
                anchors.fill: parent
                spacing: 50

                Rectangle {
                    gradient: Gradient {
                        GradientStop { position: 0.0; color: "#062a45" }
                        GradientStop { position: 1; color: "#08426e" }
                    }
                    width: 600
                    height: 200
                    radius: 10
                    Text {
                        text: "GPS"
                        font.pixelSize: 30
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.top: parent.top
                        anchors.topMargin: 10
                        color: "white"
                    }

                    Rectangle {
                        width: 500
                        height: 100
                        anchors.centerIn: parent
                        color: "transparent"
                        RowLayout {
                            anchors.fill: parent
                            spacing: 20
                            ColumnLayout {
                                spacing: 10
                                Text{
                                    text: "Latitud"
                                    font.pixelSize: 26
                                    color: "white"
                                }
                                Text {
                                    text: "Longitud"
                                    font.pixelSize: 26
                                    color: "white"
                                }
                            }
                            ColumnLayout {
                                spacing: 10
                                Rectangle {
                                    width: 200
                                    height: 35
                                    color: "white"
                                    Text{
                                        anchors.fill: parent
                                        text: latitud
                                        font.pixelSize: 26
                                        color: "black"
                                    }
                                }
                                Rectangle {
                                    width: 200
                                    height: 35
                                    color: "white"
                                    Text {
                                        anchors.fill: parent
                                        text: longitud
                                        font.pixelSize: 26
                                        color: "black"
                                    }
                                }
                            }
                            Image {
                                source: "qrc:/images/Map-icon.svg.png"
                                sourceSize.width: 100
                                sourceSize.height: 100
                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: mapas.open()
                                }
                            }
                        }
                    }
                }

                Rectangle {
                    gradient: Gradient {
                        GradientStop { position: 0.0; color: "#062a45" }
                        GradientStop { position: 1; color: "#08426e" }
                    }
                    width: 600
                    height: 600
                    radius: 10

                    Text {
                        text: "Trayectoria"
                        font.pixelSize: 30
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.top: parent.top
                        anchors.topMargin: 10
                        color: "white"
                    }

                    Rectangle {
                        anchors.centerIn: parent
                        color: "transparent"
                        width: 500
                        height: 450

                        ColumnLayout {
                            anchors.fill: parent
                            RadioButton {
                                Layout.alignment: Qt.AlignHCenter
                                text: "Triángulo"
                                font.pointSize: 20
                                //onToggled:
                            }
                            RadioButton {
                                Layout.alignment: Qt.AlignHCenter
                                text: "Círulo"
                                font.pointSize: 20
                                //onToggled:
                            }
                            RadioButton {
                                Layout.alignment: Qt.AlignHCenter
                                text: "Ocho"
                                font.pointSize: 20
                                //onToggled:
                            }
                            Button {
                                Material.background: Material.Purple
                                Layout.alignment: Qt.AlignHCenter
                                text: "Iniciar"
                                font.pointSize: 20
                                Layout.preferredWidth: 220
                                Layout.preferredHeight: 80
                            }
                            Button {
                                Material.background: Material.Purple
                                Layout.alignment: Qt.AlignHCenter
                                text: "Detener"
                                font.pointSize: 20
                                Layout.preferredWidth: 220
                                Layout.preferredHeight: 80
                            }
                        }
                    }
                }

                Rectangle {
                    gradient: Gradient {
                        GradientStop { position: 0.0; color: "#062a45" }
                        GradientStop { position: 1; color: "#08426e" }
                    }
                    width: 600
                    height: 200
                    radius: 10
                    Layout.alignment: Qt.AlignBottom
                    Layout.bottomMargin: 50

                    Text {
                        text: "Inundación"
                        font.pixelSize: 30
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.top: parent.top
                        anchors.topMargin: 10
                        color: "white"
                    }

                    Rectangle {
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.top: parent.top
                        anchors.topMargin: 60
                        width: 200
                        height: 35
                        color: "white"
                        Text {
                            id: inundacion
                            anchors.fill: parent
                            text: waterLevel
                            color: "black"
                            font.pixelSize: 26
                            onTextChanged: {
                                if (inundacion.text == "Empty") {
                                    waterBar.width = 50;
                                } else if (inundacion.text == "Low") {
                                    waterBar.width = 200;
                                } else if (inundacion.text == "Medium") {
                                    waterBar.width = 300;
                                } else if (inundacion.text == "High") {
                                    waterBar.width = 400;
                                } else { waterBar.width = 10; }
                            }
                        }
                    }

                    Rectangle {
                        height: 50
                        width: 400
                        color: "black"
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: 40
                        radius: 10
                        Rectangle {
                            id: waterBar
                            height: 50
                            width: 50
                            color: "green"
                            anchors.top: parent.top
                            anchors.left: parent.left
                            radius: 10
                            Behavior on width {
                                NumberAnimation {
                                    duration: 1000
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    Popup {
        id: mapas
        width: 760
        height: 760
        anchors.centerIn: Overlay.overlay

        modal: true

        Overlay.modal: Rectangle {
                    color: "transparent"
                }
        contentItem:
            Rectangle {
                z: 10
                width: 760
                height: 760
                anchors.centerIn: parent
                color: "transparent"

//                Map {
//                    id: map
//                    zoomLevel: (maximumZoomLevel - minimumZoomLevel)/2
//                    center {
//                        // The Qt Company in Oslo
//                        latitude: 59.9485
//                        longitude: 10.7686
//                    }
//                }
//                MapItemView {
//                    model: geocodeModel
//                    delegate: pointDelegate
//                }

            }


        enter: Transition {
                NumberAnimation { property: "opacity"; from: 0.0; to: 1.0 }
            }
        exit: Transition {
                NumberAnimation { property: "opacity"; from: 1.0; to: 0.0 }
            }
    }

    Timer {
        interval: 2000; running: true; repeat: true
        onTriggered: {
            console.log("Leer HTML:")
            dataClassQML.leerHtml()
        }
    }
}
