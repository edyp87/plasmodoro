import QtQuick 2.7

Item {
    id: counter
    property int workTimeAmount
    property int restTimeAmount
    property int secondsElapsed : workTimeAmount
    signal timeChanged
    signal stateChanged
    state: "pomodoro_work"

    function toStrings()
    {
        var suffix = "work - "
        if (state === "pomodoro_rest") {
            suffix = "rest - "
        }

        return  suffix.concat(makePrintible(getHours()), ":", makePrintible(getMinutes()), ":", makePrintible(getSeconds()))
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
        secondsElapsed = workTimeAmount
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

    function pauseUnpause()
    {
        if (secondsCounter.running) {
            secondsCounter.stop()
        } else {
            secondsCounter.start()
        }
    }

    states: [
        State {
            name: "pomodoro_work"
            PropertyChanges {
                target: counter
                secondsElapsed: workTimeAmount
            }
        },
        State {
            name: "pomodoro_rest"
            PropertyChanges {
                target: counter
                secondsElapsed: restTimeAmount
            }
        }

    ]

    function changeState()
    {
        counter.stateChanged()
        if (state == "pomodoro_work") {
            state = "pomodoro_rest"
            console.log("to pomodoro_rest")
        }
        else {
            state = "pomodoro_work"
            console.log("to pomodoro_work")
        }
    }

    Timer
    {
        id: secondsCounter
        interval: 1
        running: true
        Component.onCompleted: counter.timeChanged()
        onTriggered: {
            if (counter.secondsElapsed <= 0)
            {
                counter.changeState()
            }
            counter.secondsElapsed--;
            restart()
            counter.timeChanged()
        }
    }
}
