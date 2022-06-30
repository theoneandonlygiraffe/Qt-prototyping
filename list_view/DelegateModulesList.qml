import QtQuick 2.0


Rectangle{
    height: collumnModule.implicitHeight+3
    width: parent.width
    color: "darkgrey"
    radius: 5
    //border.color: "darkgrey"
    //border.width: 1

    Column {
        id:collumnModule
        spacing: 1

        Text { text: "Name : " + modelData.name }
        Text { text: 'Kürzel : ' + modelData.identificationCode }
        Text { text: "Schwierigkeit : " + modelData.severity }
        Text { text: 'Lerngruppen : ' + modelData.lernenGroup }


    }
}
