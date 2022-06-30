import QtQuick

Rectangle{
    id: body
    height: 50
    width: 100
    radius: height/2
    color: "grey"
    anchors.centerIn: parent

    property string label: ""

    Text {
        id: buttonText
        anchors.centerIn: parent
        text: body.label
    }

    MouseArea{
        id: hitBox
        anchors.fill: parent
        onClicked:
            if(body.state === "ON"){
                body.state = "OFF"
                console.log(body.label+" set to OFF")
            }
            else if(body.state === "OFF"){
                body.state ="ON"
                console.log(body.label+" set to ON")
            }
            else if(body.state === ""){
                body.state ="ON"
                console.log(body.label+" set to ON")
            }
            else{
                body.state =""
                console.log(body.label+" set to DEACTIVE")
            }
    }

    states: [
        State{
            name: "ON"
            PropertyChanges {
                target: body;
                color: "blue"
                scale:0.9
            }
            PropertyChanges {
                target: buttonText;
                color: "white"
                scale:0.9
            }
        },
        State{
            name: "OFF"
            PropertyChanges {
                target: body
                color: "red"
            }
        }
    ]

    transitions: [
        Transition {
            from: "*"
            to: "ON"
            ColorAnimation {
                duration: 200
            }
            NumberAnimation {
                duration: 200
            }
        },
        Transition {
            from: "*"
            to: "OFF"
            ColorAnimation {
                duration: 200
            }
            NumberAnimation {
                duration: 200
            }
        }

    ]
}
