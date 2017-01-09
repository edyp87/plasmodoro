import QtQuick 2.0
import org.kde.plasma.plasmoid 2.0
import org.kde.plasma.components 2.0 as PlasmaComponents
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.private.timer 0.1 as TimerPlasmoid

Rectangle {
    id: page
    anchors.fill: parent
    color: "transparent"
    property string timer : ""

    Plasmoid.compactRepresentation: PlasmaComponents.Label {

            id: clock
            anchors.fill: parent
            font.pixelSize: parent.height < parent.width / 4 ? parent.height : parent.width / 4;

            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter

            text: page.timer

            MouseArea
            {
                acceptedButtons: Qt.LeftButton | Qt.MiddleButton
                anchors.fill: parent
                onClicked: {
                    if (mouse.button == Qt.LeftButton) {
                        counter.pauseUnpause()
                    }
                    else if (mouse.button == Qt.MiddleButton) {
                        counter.reset()
                        counter.start()
                    }
                }
            }
    }

    Counter {
        id : counter
        workTimeAmount : 500
        restTimeAmount : 200
        onTimeChanged: page.timer = toStrings()
        onStateChanged: TimerPlasmoid.Timer.runCommand("play --no-show-progress /usr/share/sounds/KDE-Sys-App-Positive.ogg")
    }

}
