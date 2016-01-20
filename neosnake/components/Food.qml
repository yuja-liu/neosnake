import QtQuick 2.0

Item{
    property var xPos : new Array();
    property var yPos : new Array();
    property var boardHeight: 18;
    property var boardWidth: 35;
    Component.onCompleted: {
        xPos[0] = 32; yPos[0] =17;
    }

    function newFood(xSnake,ySnake,xHinder,yHinder){
        var i ,overlay;
        do{
            overlay = false;
            xPos[0] = Math.floor(Math.random()*boardWidth);
            yPos[0] = Math.floor(Math.random()*boardHeight);
            for (i=0;i < xSnake.length ;i ++)
                if (xPos[0] == xSnake[i] && yPos[0] == ySnake[i] ) overlay = true;
            for(i=0; i < xHinder.length ;i++ ){
                if (xPos[0] == xHinder[i] && yPos[0] == yHinder[i]) overlay = true;
            }
        }while(overlay);
        countdown.left=7
    }
}
