import QtQuick 1.1

Rectangle {

    width: 640
    height: 400

    property int ribbonHeight: 90
    property int separatorHeight : 5

    Component.onCompleted: {
        buttonPrevious.clicked.connect( mainDisplay.gotoPrevSlide )
        buttonNext.clicked.connect( mainDisplay.gotoNextSlide )

        mainDisplay.slideChanged.connect( updateLabels )
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

        current: 2

        Rectangle{
            id: configurationSlide
            color: "darkgray"

            property string title: "Configuration"

            width: parent.width
            height: parent.height

            SharedDirectoriesView{
                id: sharedDirView

                anchors{
                    top: parent.top
                    left: parent.left
                    right: parent.right
                    bottom: downloadFolderConfig.top
                }
            }

            Item{
                id: downloadFolderConfig

                height: 24

                anchors{
                    margins: 2

                    left: parent.left
                    right: parent.right
                    bottom: parent.bottom
                }

                Text {
                    id: label
                    text: "Download folder : "
                    anchors{
                        left: parent.left
                        verticalCenter: parent.verticalCenter
                    }
                    font.pixelSize: parent.height - 8
                }

                LineInput{
                    id: downloadFolderInput
                    anchors{
                        left: label.right
                        right: applyButton.left
                        top: parent.top
                        bottom: parent.bottom
                    }
                }

                SimpleButton{
                    id: applyButton
                    width: 60
                    label: "Apply"
                    anchors{
                        margins: 2
                        right: parent.right
                        top: parent.top
                        bottom: parent.bottom
                    }
                }
            }
        }

        Rectangle{
            id: downloads
            color:"darkgray"

            property string title: "Downloads"

            width: parent.width
            height: parent.height
        }

        Rectangle{
            id: thirdSlide
            color:"darkgray"

            property string title: "Available files"

            width: parent.width
            height: parent.height

            FileView{
                id:availableFilesView

                anchors.fill: parent
            }
        }
    }

    ImageButton{
        id : buttonPrevious

        imgSource: "images/arrow_left.png"
        imgHooverSource : "images/arrow_left_hoover.png"
        imgClickedSource : "images/arrow_left_clicked.png"
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

        imgSource: "images/arrow_right.png"
        imgHooverSource: "images/arrow_right_hoover.png"
        imgClickedSource: "images/arrow_right_clicked.png"
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
    }

    function updateLabels(){
        currSlideTitle.text  = mainDisplay.getCurrentSlideTitle();
        buttonPrevious.label = mainDisplay.getPrevSlideTitle();
        buttonNext.label     = mainDisplay.getNextSlideTitle();
    }
}
