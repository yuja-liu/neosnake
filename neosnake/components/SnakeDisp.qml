import QtQuick 2.0

Canvas{
    contextType: "2d";
    property var head: "../images/head.png"
    onPaint: {
        context.clearRect(0,0,parent.width ,parent.height)

        context.save()
        context.translate(parent.xPos[0] * units.gu(3), parent.yPos[0]*units.gu(3))
        context.scale(0.1,0.1)
        switch(parent.direction){
            case 1:
                context.drawImage(head,-350,-650)
                break
            case 3:
                context.rotate(Math.PI)
                context.drawImage(head,-900,-1200)
                break
            case 2:
                context.rotate(Math.PI/2)
                context.drawImage(head,-350,-1200)
                break
            case 4:
                context.rotate(-Math.PI/2)
                context.drawImage(head,-900,-700)
                break
        }
        context.restore()

        context.fillStyle="white";
        context.beginPath()
        var i = 4;
        var length = parent.xPos.length
        for(; i<length-3; i++){
            context.rect(parent.xPos[i] * units.gu(3), parent.yPos[i] *units.gu(3), units.gu(3), units.gu(3));
        }
        context.fill();

        for(i=1;i<4;i++){
            context.fillStyle=Qt.rgba(1, 0.3*i, 0.3*i)
            context.beginPath()
            context.rect(parent.xPos[i]* units.gu(3),parent.yPos[i]* units.gu(3),units.gu(3),units.gu(3))
            context.fill()
        }
        for(i=1; i<4; i++){

            context.fillStyle=Qt.rgba(1-0.25*i, 1-0.25*i, 1-0.25*i)
            context.beginPath()
            context.rect(parent.xPos[length-4+i]* units.gu(3)+units.gu(i*0.2), parent.yPos[length-4+i]* units.gu(3)+units.gu(i*0.2), units.gu(3-i*0.4),units.gu(3-i*0.4))
            context.fill()
        }
    }
    Component.onCompleted: loadImage(head)
    onImageLoaded: requestPaint()
}
