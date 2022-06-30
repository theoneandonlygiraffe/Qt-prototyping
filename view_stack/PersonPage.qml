import QtQuick 2.0
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15



BasePage {
    title: "Personal Info"
    buttonLabels: ["next"]
    onButtonsClicked:
        if (buttonIndex == 0){
            mainStack.push(pageDailyRoutine);
        }

    GridLayout{
        columns:2
        Text{text:"First Name:"} TextField{}
        Text{text:"Last Name:"} TextField{}
        Text{text:"Birthday:"} TextField{}
        Text{text:"Sex:"}
        ComboBox {
            width: 200
            model: [ "male", "female", "diverse"]
            palette.buttonText: "black"
        }

    }
}
