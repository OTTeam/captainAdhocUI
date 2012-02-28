import QtQuick 1.1

Rectangle {

    width: 640
    height: 400

    property int ribbonHeight: 150
    property int separatorHeight : 5

    Component.onCompleted: {
        buttonPrevious.clicked.connect( mainDisplay.gotoPrevSlide )
        buttonNext.clicked.connect( mainDisplay.gotoNextSlide )

        mainDisplay.slideChanged.connect( currSlideTitle.changeText )
    }

    Rectangle{
        id:ribbon
        color: "white"

        height: ribbonHeight

        anchors{
            left: parent.left
            right: parent.right
        }
    }

    Rectangle{
        id: separator
        gradient: Gradient{
            GradientStop{ position: 0.0; color: "lightgrey" }
            GradientStop{ position: 0.5; color: "white" }
            GradientStop{ position: 1.0; color: "lightgrey" }
        }

        anchors{
            top: ribbon.bottom
            left: parent.left
            right: parent.right
        }

        height: separatorHeight
    }

    SlideWidget{
        id: mainDisplay

        anchors{
            top: separator.bottom
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }

        current: 1

        Rectangle{
            id: firstSlide
            color: "lightsteelblue"

            property string title: "1st slide"

            width: parent.width
            height: parent.height
        }

        Rectangle{
            id: secondSlide
            color:"lightgreen"

            property string title: "2nd slide"

            width: parent.width
            height: parent.height
        }

        Rectangle{
            id: thirdSlide
            color:"pink"

            property string title: "3rd slide"

            width: parent.width
            height: parent.height
        }
    }

    ImageButton{
        id : buttonPrevious

        imgSource: "arrow_left.png"
        imgHooverSource : "arrow_left_hoover.png"
        imgClickedSource : "arrow_left_clicked.png"
        imgWidth: 60
        imgHeight: 60

        label : "previous Slide"
        labelPosition : "right"

        anchors{
            left: parent.left
            top: parent.top
        }
    }

    ImageButton{
        id : buttonNext

        imgSource: "arrow_right.png"
        imgHooverSource: "arrow_right_hoover.png"
        imgClickedSource: "arrow_right_clicked.png"
        imgWidth: 60
        imgHeight: 60

        label: "next slide"
        labelPosition: "left"

        anchors{
            right: parent.right
            top: parent.top
        }
    }

    Text{
        id : currSlideTitle

        anchors{
            verticalCenter: buttonPrevious.verticalCenter
            horizontalCenter: parent.horizontalCenter
        }

        text: ""

        font{
            bold: true
            pointSize: 20
        }

        function changeText( title ){
            text = title
        }
    }
}
