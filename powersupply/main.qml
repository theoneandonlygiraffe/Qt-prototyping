import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15


ApplicationWindow {
    id:mainWindow
    width: 640
    height: 480
    visible: true
    title: qsTr("Powersupply")

        Rectangle{
            id: topBar

            width: mainWindow.width
            height: 20
        }
        Rectangle{
            id:mainGUI
            anchors.top: topBar.bottom
            anchors.bottom: footNote.top
            width:mainWindow.width
            Column{
                width:parent.width-50
                anchors.horizontalCenter: parent.horizontalCenter

                MySlider{
                    width:parent.width
                    label: qsTr("Voltage: ")
                    from:0
                    to:24000
                    onValueChanged: mypowersupply.voltage=value
                    value:mypowersupply.voltage
                    unit: qsTr("mV")
                }
                MySlider{
                    width:parent.width
                    label: qsTr("Current: ")
                    from:0
                    to:24000
                    onValueChanged: mypowersupply.current=value
                    value:mypowersupply.current
                    unit:qsTr("mV")
                }
                Rectangle{
                    width:parent.width
                    height:1
                    color:"grey"
                }

                Text{
                   id: powertext
                   text:"power output: "+ mypowersupply.power+ "W"
                }

                MySlider{
                    width:parent.width
                    label: qsTr("Max Power: ")
                    from:0
                    to:50
                    onValueChanged: mypowersupply.maxpower=value
                    value:mypowersupply.maxpower
                    unit: qsTr("W")
                }
            }
        }

        Rectangle{
            id: footNote
            color: "#dcdcdc"

            anchors.bottom: parent.bottom
            anchors.horizontalCenter: mainWindow.horizontalCenter
            width: mainWindow.width
            height:20
            Text {
                id: footNotetext

                color: "grey"
                anchors.verticalCenter: parent.verticalCenter
                text: qsTr('by Alexander Strasser <html><style type="text/css"></style><a href="https://github.com/theoneandonlygiraffe">github</a></html>')
                onLinkActivated: Qt.openUrlExternally(link)
            }
        }




}
