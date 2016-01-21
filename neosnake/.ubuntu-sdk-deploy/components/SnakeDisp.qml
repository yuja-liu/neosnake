import QtQuick 2.0

Canvas{
    contextType: "2d";
    property var head: "../images/head.png"
    property var dispX: new Array()
    property var dispY: new Array()
    property var side
    onPaint: {
        context.clearRect(0,0,parent.width ,parent.height)

        context.save()
        context.translate(dispX[0] * side, dispY[0]*side)
        context.scale(side/800*2, side/800*2)
        switch(parent.direction){
            case 1:
                context.drawImage(head,-200,-400)
                break
            case 2:
                context.rotate(Math.PI/2)
                context.drawImage(head,-200,-800)
                break
            case 3:
                context.rotate(Math.PI)
                context.drawImage(head,-600,-800)
                break
            case 4:
                context.rotate(-Math.PI/2)
                context.drawImage(head,-600,-400)
                break
        }
        context.restore()

        context.fillStyle="white";
        context.beginPath()
        var i = 4;
        var length = dispX.length
        for(; i<length-3; i++){
            context.rect(dispX[i] * side, dispY[i] *side, side, side);
        }
        context.fill();

        for(i=1;i<4;i++){
            context.fillStyle=Qt.rgba(1, 0.3*i, 0.3*i)
            context.beginPath()
            context.rect(dispX[i]* side,dispY[i]* side,side,side)
            context.fill()
        }
        for(i=1; i<4; i++){

            context.fillStyle=Qt.rgba(1-0.25*i, 1-0.25*i, 1-0.25*i)
            context.beginPath()
            context.rect(dispX[length-4+i]* side+side*i*0.05, dispY[length-4+i]* side+side*i*0.05, side-side*i*0.1,side-side*i*0.1)
            context.fill()
        }
    }
    Component.onCompleted: loadImage(head)
    onImageLoaded: requestPaint()
}
