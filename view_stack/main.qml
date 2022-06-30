import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Window {
    width: 9*30
    height: 16*30
    visible: true
    title: qsTr("Datenklauer 3000")

    PersonPage{id:pagePerson}
    DailyRoutinePage{id:pageDailyRoutine}
    BreakfastPage{id:pageBreakfast}

    Rectangle {
        id:titleBox
        width: parent.width
        height: 20
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        color: "grey"

        Text {
            id: titleText
            anchors.centerIn: parent
            text: mainStack.currentItem.title
        }
    }

    StackView{
        id:mainStack
        anchors { top: titleBox.bottom; bottom: menuBox.top; left: parent.left; right: parent.right;}
        initialItem: pagePerson
    }

    PageMenu{
        id: menuBox
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        height: 50
        width: parent.width
        namesButtons: mainStack.currentItem.buttonLabels
        onButtonsClicked:
            mainStack.currentItem.buttonsClicked(buttonIndex)

    }
}
