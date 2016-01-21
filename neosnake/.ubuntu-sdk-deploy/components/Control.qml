import QtQuick 2.0
import QtGraphicalEffects 1.0

Item{
    property alias imageSource: crtlHint.source
    property alias imageAnchors:crtlHint.anchors
    property alias fadeAway: fadeAway
    property alias text: label.text
    Image{
        id:crtlHint
        width:units.gu(20)
        height:units.gu(20)
        opacity: 0.4
        anchors{bottom: parent.bottom; margins: units.gu(5)}
        fillMode: Image.Stretch
        Text{
            id:label
            anchors.top: parent.bottom
            color:"white"
            font{bold:true; pointSize: 28}
        }
        DropShadow{
            z:-1
            anchors.fill: crtlHint
            verticalOffset: units.gu(0.6)
            horizontalOffset: units.gu(0.6)
            samples: 16
            color:"#80000000"
        }
    }
    PropertyAnimation{
        id:fadeAway
        target:crtlHint
        property:"opacity"
        to:0
        duration: 700
    }
}

