import QtQuick 2.0

Item{
    id:ruler
    property var side
    anchors.fill:parent
    onHeightChanged: side=compute(ruler.width, ruler.height)
    onWidthChanged: side=compute(ruler.width, ruler.height)
    function compute(x, y){
        var sideX = Math.floor(x/35)
        var sideY = Math.floor(y/18)
        var side = (sideX>sideY) ? sideY :sideX
        return side
    }
}

