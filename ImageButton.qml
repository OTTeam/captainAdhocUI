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

    property string imgSource
    property int imgWidth
    property int imgHeight

    // the image button
    Image{
        id : buttonImage

        source : parent.imgSource

        width: parent.imgWidth > 0 ? parent.imgWidth : implicitWidth
        height: parent.imgHeight > 0 ? parent.imgHeight : implicitHeight

        x : ( labelPosition === "left" ? buttonLabel.width : 0 )

    }

    // this is the text label positionned next to the button
    Text{
        id: buttonLabel

        text : parent.label

        x : getTextXPosition()
        y : getTextYPosition()
    }

    function getTextXPosition(){
        switch( labelPosition )
        {
        case "left":
            return 0;
        case "right":
            return buttonImage.width;
        default: // down
            return ( buttonImage.width - buttonLabel.width ) / 2;
        }
    }

    function getTextYPosition(){
        if( labelPosition == "left" || labelPosition == "right" )
        {
            return ( buttonImage.height - buttonLabel.height ) / 2;
        }
        else
        {
            return buttonImage.height;
        }
    }
}

