import QtQuick 2.0

Rectangle{
    height:units.gu(6)
    width:units.gu(140)
    color: "white"
    Image {
        id:headcolor
        height:parent.height
        width:units.gu(20)
        anchors.right: parent.right
        source: "../images/headcolor.jpg"
        fillMode: Image.Stretch
    }

    Text {
        id: scoreLabel
        anchors.right:score.left
        anchors.rightMargin: units.gu(3)
        anchors.verticalCenter: parent.verticalCenter
        font.pixelSize: 60
        text: i18n.tr("Score")
    }

    Text {
        id: score;
        anchors.right:timeLabel.left
        anchors.rightMargin: units.gu(10)
        anchors.verticalCenter: parent.verticalCenter
        font.pixelSize: 60
        text: i18n.tr(mainPage.item.score.toString());
    }

    Text {
        id: timeLabel
        anchors.right:timeLeft.left
        anchors.rightMargin: units.gu(3)
        anchors.verticalCenter: parent.verticalCenter
        font.pixelSize: 60
        text: i18n.tr("Time Left")
    }

    Text {
        id: timeLeft
        anchors.right:headcolor.left
        anchors.rightMargin: units.gu(15)
        anchors.verticalCenter: parent.verticalCenter
        font.pixelSize: 60
        text: i18n.tr(mainPage.item.timeLeft.toString());
    }
}

