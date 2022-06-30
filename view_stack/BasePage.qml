import QtQuick 2.0

Item {
    id:mainWrapper
    width:parent.width
    height:parent.height
    visible: false

    property string title: "helloworld"
    property variant buttonLabels: ["back","next"]

    signal buttonsClicked(int buttonIndex)

}
