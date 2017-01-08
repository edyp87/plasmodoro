import QtQuick 2.0
import org.kde.plasma.plasmoid 2.0
import org.kde.plasma.components 2.0 as PlasmaComponents
import org.kde.plasma.core 2.0 as PlasmaCore


Rectangle {
    id: page
    anchors.fill: parent
    color: "transparent"
    //Component.onCompleted: parent.height = 600
    property string timer : ""

    Plasmoid.compactRepresentation: PlasmaComponents.Label {

            id : clock
            anchors.fill: parent
            font.pixelSize: panelItem.textHeight
         //   scale: paintedWidth > width ? (width / paintedWidth) : 1

            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter

            text : page.timer

            MouseArea
            {
                anchors.fill : parent
                onClicked: { counter.reset(); counter.start() }
            }

    }

    Counter {
        id : counter
        counterSizeInSeconds : 500
        onTimeChanged: page.timer = toStrings()
    }

}
