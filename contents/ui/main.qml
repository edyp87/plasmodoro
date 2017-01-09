import QtQuick 2.0
import org.kde.plasma.plasmoid 2.0
import org.kde.plasma.components 2.0 as PlasmaComponents
import org.kde.plasma.core 2.0 as PlasmaCore


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
                anchors.fill: parent
                onClicked: { counter.reset(); counter.start() }
            }
    }

    Counter {
        id : counter
        counterSizeInSeconds : 500
        onTimeChanged: page.timer = toStrings()
    }

}
