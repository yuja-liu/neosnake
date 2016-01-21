import QtQuick 2.0

Rectangle{
    height:units.gu(6)
    width:parent.width
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
        anchors{right:score.left; margins:units.gu(2); verticalCenter: parent.verticalCenter}
        font.pointSize: 32
        text: i18n.tr("Score")
    }

    Text {
        id: score;
        anchors{right:timeLabel.left; margins: units.gu(8); verticalCenter: parent.verticalCenter}
        font.pointSize: 32
        text: i18n.tr(mainPage.item.score.toString());
    }

    Text {
        id: timeLabel
        anchors.centerIn:parent
        font.pointSize: 32
        text: i18n.tr("Time Left")
    }

    Text {
        id: timeLeft
        anchors{ left:timeLabel.right; margins: units.gu(2); verticalCenter: parent.verticalCenter}
        font.pointSize: 32
        text: i18n.tr(mainPage.item.timeLeft.toString());
    }
}

