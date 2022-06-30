import QtQuick 2.0

BasePage {
    title: "wie läuft dein Tag ab Schnegge?"
    onButtonsClicked:
        switch (buttonIndex){
        case 0: mainStack.pop(); break;
        case 1: mainStack.push(pageBreakfast); break;
        }
}
