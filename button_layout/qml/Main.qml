import QtQuick
import QtQuick.Controls

ApplicationWindow {
    id: mainWindow
    width: 400
    height: 300
    visible: true

    Image {
        id: myimage
        source: "hs-mannheim.jpg"

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        //color: "red"
        width: parent.width
        height: 105
    }

    Row{
        id: mybuttons
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.width
        property int num_buttons: 3

        Rectangle{
            id: button1
            width:parent.width/parent.num_buttons
            anchors.left: parent.left
            MyButton{
                label: qsTr("button 1")
            }
        }
        Rectangle{
            id: button2
            width:parent.width/parent.num_buttons
            anchors.left: button1.right
            MyButton{
                label: qsTr("button 2")
            }
        }
        Rectangle{
            id: button3
            width:parent.width/parent.num_buttons
            anchors.left: button2.right
            MyButton{
                label: qsTr("button 3")
            }
        }


    }




}
