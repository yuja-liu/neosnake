import QtQuick 2.0

Item{
    property var xPos :new Array;
    property var yPos :new Array;
    property var direction //up-1;right-2;down-3;left-4
    property var boardHeight: 18;
    property var boardWidth: 35;
    property var score: 0;

    function init(){    //back to initial state
        var i=0;
        xPos=xPos.slice(-10)
        yPos=yPos.slice(-10)
        for (;i<10;i++){
            xPos[i]=9-i;
            yPos[i]=boardHeight-1;
        }
        direction = 2;
        score = 0;
    }

    function turnLeft(){
        if (direction==1)
            direction=4
        else
            direction--
    }
    function turnRight(){
        if (direction==4)
            direction=1
        else
            direction++
    }

    function move(){    //move a step following the timer
        var i =xPos.length-1;
        for(; i >=0; i--){
            if (i==0){
                switch(direction){
                case 1:
                    yPos[i] --; //up
                    if (yPos[i] < 0) yPos[i]= boardHeight-1;
                    break;
                case 3:
                    yPos[i] ++; //down
                    if (yPos[i] >= boardHeight) yPos[i]= 0;
                    break;
                case 4:
                    xPos[i] --; //left
                    if (xPos[i] < 0) xPos[i]= boardWidth-1;
                    break;
                case 2:
                    xPos[i] ++; //right
                    if (xPos[i] >= boardWidth) xPos[i]= 0;
                    break;
                }
            }
            else{
                xPos[i] = xPos[i-1];
                yPos[i] = yPos[i-1];
            }
        }
    }

    function eat(xFood, yFood){ //judge if food exist and eat
        if (xPos[0] == xFood && yPos[0] == yFood){
            xPos.push(xPos[xPos.length-1]);
            yPos.push(yPos[yPos.length-1]);
            score ++;
            if (score % 5 == 0) hinder.newHinder(xPos,yPos);
            food.newFood(xPos,yPos,hinder.xPos,hinder.yPos);
        }
    }

    function crash(xHinder,yHinder){    //judge if the snake crash itself or on the hinder
        var i = 1, j = 0;
        for (;i < xPos.length; i++){
            if (xPos[i] == xPos[0] && yPos[i] == yPos[0])
                die()
            for ( ;j < xHinder.length; j++){
                if (xPos[0] == xHinder[j] && yPos[0] == yHinder[j])
                    die()
            }
        }
    }

    signal dead()
    function die(){ //when dies, stop timers and call restart
        timer.stop();
        countdown.stop(); countdown.left = 0;
        dead()
        //if (Number(showScore.text) > Number(topScore.text)) topScore.text=showScore.text; //recount top score
    }

}
