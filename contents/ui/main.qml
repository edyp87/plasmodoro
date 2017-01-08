import QtQuick 2.0
import org.kde.plasma.components 2.0 as PlasmaComponents

Rectangle {
    id: page
    color: "transparent"
    width: 600; height: 180

    PlasmaComponents.Label
    {
        id : clock
        text : "asd"
        font.pointSize: 100

        MouseArea
        {
            anchors.fill : parent
            onClicked: { counter.reset(); counter.start() }
        }
    }

    Counter {
        id : counter
        counterSizeInSeconds : 500
        onTimeChanged: clock.text = toStrings()
    }
}
