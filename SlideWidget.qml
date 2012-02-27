/* Silde widget
 * Main widget for CaptainAdhoc's UI. This is a widget that can display its
 * children as slides.
 */

import QtQuick 1.1

Item {
    id: slideWidget

    default property alias content: stack.children

    property int current: 0

    signal gotoNextSlide
    signal gotoPrevSlide

    onGotoNextSlide: showNextSlide()
    onGotoPrevSlide: showPrevSlide()

    Component.onCompleted: {
        if( stack.children.length > 0 )
        {
            // check if current current value is acceptable.
            // if not, it is reset to 0.
            if( current >= stack.children.length  || current < 0 )
                current = 0;

            for( var i = 0 ; i < stack.children.length ; i++ )
            {
                if( i !== current )
                    stack.children[ i ].x = - slideWidget.width;
                else
                    stack.children[ i ].x = 0
            }
        }
    }

    PropertyAnimation {
        id: currentViewAnimation
        duration : 500
        property: "x"
        easing.type: Easing.InQuad
    }

    PropertyAnimation {
        id: nextViewAnimation
        duration : 500
        property: "x"
        easing.type: Easing.InQuad
    }

    Item {
        id: stack
        anchors.fill: parent
    }

    function showNextSlide(){
        if( current < stack.children.length - 1 )
        {
            var currView = stack.children[ current ];
            var nextView = stack.children[ current + 1 ];

            if( currentViewAnimation.running )
                currentViewAnimation.complete();

            if( nextViewAnimation.running )
                nextViewAnimation.complete();

            currentViewAnimation.target = currView;
            currentViewAnimation.to     = slideWidget.width * -1; // the current view is sent to the left
            currentViewAnimation.start();

            nextViewAnimation.target = nextView;
            nextViewAnimation.from   = slideWidget.width;
            nextViewAnimation.to     = -0; // no idea why the "-" is here but it was in the example
            nextViewAnimation.start();

            current++;
        }
    }

    function showPrevSlide(){
        if( current > 0 )
        {
            var currView = stack.children[ current ];
            var nextView = stack.children[ current - 1 ];

            if( currentViewAnimation.running )
                currentViewAnimation.complete();

            if( nextViewAnimation.running )
                nextViewAnimation.complete();

            currentViewAnimation.target = currView;
            currentViewAnimation.to     = slideWidget.width * 1; // the current view is sent to the left
            currentViewAnimation.start();

            nextViewAnimation.target = nextView;
            nextViewAnimation.from   = - slideWidget.width;
            nextViewAnimation.to     = -0; // no idea why the "-" is here but it was in the example
            nextViewAnimation.start();

            current--;
        }
    }
}
