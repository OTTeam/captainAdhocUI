// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Rectangle {
    width: 640
    height: 400

    property int ribbonHeight: 150
    property int separatorHeight : 5

    Rectangle{
        id:ribbon
        color: "white"
        height: ribbonHeight
        width: parent.width
    }

    Rectangle{
        id: separator
        gradient: Gradient{
            GradientStop{ position: 0.0; color: "lightgrey" }
            GradientStop{ position: 0.5; color: "white" }
            GradientStop{ position: 1.0; color: "lightgrey" }
        }

        y: ribbonHeight

        width: parent.width
        height: separatorHeight
    }

    Rectangle{
        id: fileDisplay
        color: "white"

        y: ribbonHeight + separatorHeight

        width: parent.width
        height: parent.height - ribbonHeight - separatorHeight

        anchors.bottom: parent.bottom
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            Qt.quit();
        }
    }
}
