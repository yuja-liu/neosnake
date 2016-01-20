import QtQuick 2.0

Canvas{
    contextType: "2d";
    property var dispX: new Array();
    property var dispY: new Array();
    property var dispColor: "black"
    onPaint: {
        context.clearRect(0,0,parent.width ,parent.height);
        context.fillStyle=dispColor;
        context.beginPath();
        var i = 0;
        for(; i<dispX.length; i++){
            context.rect(dispX[i] * units.gu(3), dispY[i] *units.gu(3), units.gu(3), units.gu(3));
        }
        context.fill();
    }
}
