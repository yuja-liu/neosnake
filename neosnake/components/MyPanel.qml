import QtQuick 2.0
import QtGraphicalEffects 1.0
import QtMultimedia 5.0
import Ubuntu.Components 1.3

Panel {
    Rectangle{
        id:recRestart
        visible: false
        width:units.gu(20)
        height:units.gu(20)
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        Image{
            anchors.fill: parent
            source:"../images/restart.jpg"
            fillMode: Image.Stretch
        }
        DropShadow{
            z:-1
            anchors.fill: parent
            verticalOffset: units.gu(0.6)
            horizontalOffset: units.gu(0.6)
            samples: 16
            color:"#80000000"
        }
        function trigger(){
            mainPage.item.restart()
            panel.close()
        }
    }
    Rectangle{
        id:recConti
        width:units.gu(20)
        height:units.gu(20)
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        Image{
            anchors.fill: parent
            source:"../images/continue.jpg"
            fillMode: Image.Stretch
        }
        DropShadow{
            z:-1
            anchors.fill: parent
            verticalOffset: units.gu(0.6)
            horizontalOffset: units.gu(0.6)
            samples: 16
            color:"#80000000"
        }
        function trigger(){
            mainPage.item.conti()
            panel.close()
        }
    }
    Rectangle{
        id:recSound
        width:units.gu(12)
        height:units.gu(12)
        anchors.top: parent.top
        anchors.right:recRestart.left
        anchors.margins: units.gu(4)
        DropShadow{
            z:-1
            anchors.fill: parent
            verticalOffset: units.gu(0.6)
            horizontalOffset: units.gu(0.6)
            samples: 16
            color:"#80000000"
        }
        Image{
            anchors.fill: parent
            source:"../images/volume.jpg"
            fillMode: Image.Stretch
        }
        MouseArea{
            anchors.fill:parent
            onClicked: {
                console.log("recSound clicked")
                panel.close()
            }
        }
    }
    Rectangle{
        id:recTutorial
        width:units.gu(12)
        height:units.gu(12)
        anchors.top: parent.top
        anchors.left: recRestart.right
        anchors.margins: units.gu(4)
        DropShadow{
            z:-1
            anchors.fill: parent
            verticalOffset: units.gu(0.6)
            horizontalOffset: units.gu(0.6)
            samples: 16
            color:"#80000000"
        }
        Image{
            anchors.fill: parent
            source:"../images/tutorial.jpg"
            fillMode: Image.Stretch
        }
        MouseArea{
            anchors.fill:parent
            onClicked: {
                mainStack.push(helpPage)
            }
        }
    }
    Rectangle{
        width:units.gu(4)
        height:units.gu(4)
        anchors.top: recSound.top
        anchors.left: recTutorial.right
        anchors.margins: units.gu(4)
        color: "#bdff2f"
    }
    Rectangle{
        width:units.gu(4)
        height:units.gu(4)
        anchors.top: recSound.top
        anchors.right:recSound.left
        anchors.margins: units.gu(4)
        color: "#ff2525"
    }

    MediaPlayer{
        id:bgm
        autoPlay:true
        loops:MediaPlayer.Infinite
    }

    onOpenedChanged: {
        if(opened==true){
            mainPage.item.pause()
            mainPage.item.showAnimation.start()
            bgm.source="../bgm/drops.mp3"
        }
        else{
            mainPage.item.conti()
            mainPage.item.popAnimation.start()
            bgm.source="../bgm/pingpongpang.mp3"
        }
    }
    Component.onCompleted: panel.open()
    function swapButton(){
        recConti.visible=false
        recRestart.visible=true
}
}

