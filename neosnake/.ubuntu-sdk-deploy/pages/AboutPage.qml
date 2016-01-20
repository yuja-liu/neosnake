import QtQuick 2.0
import Ubuntu.Components 1.3
import QtGraphicalEffects 1.0

Page{
    title:"About"
    Column{
        anchors.fill: parent
        anchors.margins: units.gu(7)
        spacing: units.gu(5)
        Rectangle{
            anchors.horizontalCenter: parent.horizontalCenter
            width:units.gu(20)
            height:units.gu(20)
            radius:5
            Image{
                anchors.fill: parent
                source:"../images/neosnakeIcon.png"
            }
            DropShadow{
                z:-1
                anchors.fill: parent
                verticalOffset: units.gu(0.6)
                horizontalOffset: units.gu(0.6)
                samples: 16
                color:"#80000000"
            }
        }
        Column{
            anchors.horizontalCenter: parent.horizontalCenter
            Text{anchors.horizontalCenter: parent.horizontalCenter; font.pointSize: 44; font.bold: true; text:"Neosnake"}
            Text{anchors.horizontalCenter: parent.horizontalCenter; font.pointSize: 24; text:"version 0.1"}
        }
        Column{
            anchors.horizontalCenter: parent.horizontalCenter
            Text{anchors.horizontalCenter: parent.horizontalCenter; font.pointSize: 24; text:"(C)2016 Randolph Liu"}
            Text{anchors.horizontalCenter: parent.horizontalCenter; font.pointSize: 24; text:"Realease under the terms of the GNU GPL v3"}
        }
        Text{anchors.horizontalCenter: parent.horizontalCenter; font.pointSize: 24; text:"Source code available"}
    }
}

