import QtQuick 2.0
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

BasePage {
    title: "Was gabs leggeres zum Frühstück?"
    buttonLabels: ["back"]
    onButtonsClicked:
        if (buttonIndex == 0){
            mainStack.pop();
        }
    GridLayout{
        columns:2
        Text{text:"Cereal:"} Switch{}
        Text{text:"Bread:"} Switch{}
        Text{text:"Egg:"} Switch{}
        Text{text:"Sausage:"} Switch{}
        Text{text:"Jam:"} Switch{}
        Text{text:"cheese:"} Switch{}
        Text{text:"honey:"} Switch{}
        Text{text:"drinking:"}
        ComboBox {
            width: 200
            model: [ "Coffee", "Tea", "Juice"]
            palette.buttonText: "black"
        }

    }
}
