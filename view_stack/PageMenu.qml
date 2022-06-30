import QtQuick 2.0
import QtQuick.Controls 2.15

Item {
    id: pageMenu


    property variant namesButtons : []
    property int numButtons : namesButtons.length

    signal buttonsClicked(int buttonIndex)

    Row{
        Repeater{
            model: numButtons

            Button{

                height:pageMenu.height
                width:pageMenu.width/numButtons
                text:namesButtons[index]
                onClicked:
                    buttonsClicked( index )
                palette.buttonText: "black"
            }
        }
    }
}
