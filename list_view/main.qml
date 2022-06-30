import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Window {
    id:mainWindow
    width: 750
    height: 480
    visible: true
    title: qsTr("Liste")

    function readFile(fileUrl) {
        var request = new XMLHttpRequest()
        var txt = "";
        request.open('GET', fileUrl ,true)
        request.onreadystatechange = function(event) {
            if (request.readyState === XMLHttpRequest.DONE) {
                console.log(request.status);
                //console.log(request.responseText)
                listviewMain.model=JSON.parse( request.responseText )
                //textfield.text = request.responseText

            }
        }
        request.send();


    }

    //Column{
        Row{
            id: fileselector
            anchors.top: mainWindow.top

            Button{
                id:buttonLoad
                text:"load"
                palette.buttonText: "black"
                onClicked:
                    readFile(textfieldTarget.text)

            }
            TextField{
                id:textfieldTarget
                text:'file:///home/user/Sync/Workspace/SET/set-labor/software/apps/praktikum5/Kommilitonen.txt'

                width: mainWindow.width-buttonLoad.width
            }
        }
        Rectangle{
            anchors.top: fileselector.bottom
            height: mainWindow.height - fileselector.height
            width: mainWindow.width

            clip:true
        ListView{
            id:listviewMain
            //anchors{top: fileselector.bottom; bottom: mainWindow.bottom; right: mainWindow.right; left: mainWindow.left }
            anchors{fill:parent}

            model: readFile(textfieldTarget.text)
            delegate: DelegateMainList{}
            spacing: 6
            cacheBuffer: 50

        }
        }
   // }

}
