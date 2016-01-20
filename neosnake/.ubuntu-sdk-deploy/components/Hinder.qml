import QtQuick 2.0

Item{
    property var xPos: new Array(5);
    property var yPos: new Array(5);
    property var boardHeight: 18;
    property var boardWidth: 35;
    Component.onCompleted: {
        newHinder(Array(0,0), Array(boardHeight - 1,0));
    }

    function newHinder(xSnake, ySnake){
        var i , j ,overlay
        for( j=0;j < xPos.length; j++){    //for the generation of each hinder:
            do{
                overlay = false
                xPos[j] = Math.floor(Math.random()*boardWidth);
                yPos[j] = Math.floor(Math.random()*boardHeight);
                for(i=0;i<j; i++)  //first check overlay against former hinder(s)
                    if(xPos[j] == xPos[i] && yPos[j] == yPos[i])
                        overlay = true
                for (i=0;i < xSnake.length ;i ++)  //second check overlay against every node of the snake
                    if (xPos[j] == xSnake[i] && yPos[j] == ySnake[i])
                        overlay = true; //third check overlay against the creeping way of the snake
                if(xPos[j] == xSnake[0] || yPos[j] == ySnake[0])
                    overlay = true
            }while(overlay);
        }
    }
}
