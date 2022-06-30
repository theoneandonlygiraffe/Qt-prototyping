import QtQuick 2.0
import QtQuick.Controls 2.15


Item {
    id:container
    height: label.height


    property alias value: slider.value
    property alias from: slider.from
    property alias to: slider.to


    property alias unit: unit.text
    property alias label: label.text

    //label...

    signal valChanged ()

    Row{

        width:parent.width-50
        anchors.horizontalCenter: parent.horizontalCenter

        Text{
            id:label
            //width:50
            anchors.verticalCenter: parent.verticalCenter
        }

        Slider{
            id:slider
            width: parent.width-label.width-textfield.width-unit.width-10
            anchors.verticalCenter: parent.verticalCenter
            snapMode: Slider.SnapOnRelease
            stepSize: 1

            onValueChanged:
                container.valChanged()
        }

        Text{
            id:textfield
            anchors.verticalCenter: parent.verticalCenter
            width:100
            text: container.value
        }
        Text {
            id: unit
            anchors.verticalCenter: parent.verticalCenter
            //width:50

        }
    }
}


