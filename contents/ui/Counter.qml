import QtQuick 2.0

Item {
    id: counter
    property int counterSizeInSeconds
    property int secondsElapsed : counterSizeInSeconds
    signal timeChanged

    function toStrings()
    {
        return  "".concat(makePrintible(getHours()), ":", makePrintible(getMinutes()), ":", makePrintible(getSeconds()))
    }

    function getSeconds()
    {
        return secondsElapsed % 60
    }

    function getMinutes()
    {
        return Math.floor(secondsElapsed / 60) % 60
    }

    function getHours()
    {
        return Math.floor(secondsElapsed / 3600)
    }

    function reset()
    {
        secondsElapsed = counterSizeInSeconds
    }

    function makePrintible(number)
    {
        var printibleNumber = number.toString()

        if (printibleNumber.length === 1)
        {
            return "0".concat(printibleNumber)
        }

        return printibleNumber
    }

    function start()
    {
        secondsCounter.start()
    }

    Timer
    {
        id: secondsCounter
        interval: 1
        running: true
        onTriggered: {
            if (counter.secondsElapsed <= 0)
            {
                stop()
                return
            }
            counter.secondsElapsed--;
            restart()
            counter.timeChanged()
        }
    }
}
