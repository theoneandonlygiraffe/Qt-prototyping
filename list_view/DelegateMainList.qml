import QtQuick 2.0


Rectangle{
    id: container
    height: column.implicitHeight + 5
    width: parent.width
    border.color: "darkgrey"
    border.width: 3
    color: "lightgrey"
    radius:5
    Row{
        spacing: 20
        Image {
            id: bild
            source: modelData.image
            width: column.implicitHeight + 5
            height: column.implicitHeight + 5
        }

        Column{
            id: column
            spacing: 3
            width: implicitWidth
            Text { text: 'Name : ' + modelData.name }
            Text { text: 'Vorname : ' + modelData.forename }
            Text { text: 'Kurs : ' + modelData.course }
            Text { text: 'Alter : ' + modelData.age }
            Text { text: 'Matrikel Nummer : ' + modelData.matriculationNumber }
            Text { text: 'Semester : ' + modelData.semester }


        }

        Rectangle{
            height: container.height
            width: 300//listviewModules.implicitWidth
            visible: true
            color: "transparent"
            border.color: "darkgrey"
            clip: true
            ListView{
                visible: true
                id: listviewModules
                height: parent.height
                width: parent.width
                model: modelData.modules
                delegate:DelegateModulesList{}

                spacing:5
            }
        }

    }

}
