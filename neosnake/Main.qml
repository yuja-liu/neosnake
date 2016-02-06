import QtQuick 2.0
import Ubuntu.Components 1.3
import"pages"
import"components"

MainView {
    id: mainView
    applicationName: "neosnake.rain"
    MyPanel{
        id: panel
        z:1
        anchors.bottom: parent.bottom
        width: parent.width
        height:parent.height/2
        visible: (tabs.selectedTab==tab1 && mainStack.currentPage == tabs ) ? true : false
    }
    ShowBar{
        id:showbar
        side:mainPage.item.side
        z:2
        anchors.right: parent.right
        visible: (tabs.selectedTab==tab1) ? true : false
    }

    PageStack{
        id:mainStack
        Component.onCompleted: push(tabs)
        Tabs{
            id:tabs
            Tab{
                id:tab1
                title:"Neosnake"
                page:Loader{
                    id:mainPage
                    parent: tab1
                    anchors{
                        left:parent.left
                        right: parent.right
                        bottom: parent.bottom
                    }
                    source: (tabs.selectedTab === tab1) ? Qt.resolvedUrl("pages/MainPage.qml") : ""
                }
            }
            Tab{
                id:tab2
                title:"About"
                page:Loader{
                    id:aboutPage
                    parent: tab2
                    anchors{
                        left:parent.left
                        right: parent.right
                        bottom: parent.bottom
                    }
                    source: (tabs.selectedTab === tab2) ? Qt.resolvedUrl("pages/AboutPage.qml") : ""
                    onLoaded: {
                        item.side= mainPage.item.side
                    }
                }
            }
        }
        HelpPage{
            id:helpPage
            side:mainPage.item.side
        }
    }


}
