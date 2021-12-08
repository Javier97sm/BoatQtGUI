import QtQuick 2.0
import QtQuick.Layouts 1.15
import QtQuick.Controls.Material 2.12


Item {

    property string buttonText: ""
    property color buttonColor: Material.color(Material.Red)

    width: 150
    height: 150

    Keys.onPressed: {
        if (event.key === Qt.Key_W) {
            console.log("move up");
            up.opacity = 0.5;
            dataClassQML.buttonClicked('b')
        } else {
            up.opacity = 1;
        }
        if (event.key === Qt.Key_A) {
            console.log("move left");
            goLeft.opacity = 0.5;
            dataClassQML.buttonClicked('l')
        } else {
            goLeft.opacity = 1;
        }
        if (event.key === Qt.Key_Space) {
            console.log("stop");
            stop.opacity = 0.5;
            dataClassQML.buttonClicked('s')
        } else {
            stop.opacity = 1;
        }
        if (event.key === Qt.Key_D) {
            console.log("move right");
            goRight.opacity = 0.5;
            dataClassQML.buttonClicked('r')
        } else {
            goRight.opacity = 1;
        }
        if (event.key === Qt.Key_S) {
            console.log("move back");
            back.opacity = 0.5;
            dataClassQML.buttonClicked('a')
        } else {
            back.opacity = 1;
        }
    }

    Rectangle {
        id: rectangleButton
        anchors.fill: parent
        radius: 100
        color: buttonColor
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#eb526e" }
            GradientStop { position: 1; color: "#330606" }
        }
        Text {
            anchors.centerIn: parent
            text: buttonText
            color: "white"
            font.pixelSize : 100
            font.bold: true
        }
    }
}
