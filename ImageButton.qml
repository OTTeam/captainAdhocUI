// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

// The image button is made of an image and a label. Up to three images can be
// provided, for normal, hovered and pushed states.
Rectangle {
    id: roundbutton

    color: "transparent"

    property string label
    property color textColor: buttonLabel.color
    property real labelSize: 14

    // possible values : left, right, down
    // if none of this is used, down is used as default
    property string labelPosition

    width : ( (labelPosition == "right" || labelPosition == "left" ) ?
            buttonRadius * 2 + buttonLabel.width : buttonRadius * 2 )
    height : buttonRadius * 2

    // the image button
    Image{
    }

    // this is the text label positionned next to the button
    Text{
        id: buttonLabel

        // todo : some logic to set x and y relativly to the parent
    }
}

