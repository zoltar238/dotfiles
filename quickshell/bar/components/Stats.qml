import QtQuick
import Quickshell.Io


Rectangle {
    id: statsPanel
    clor: "blue"
    Layout.preferredHeight: 30
    Layout.preferredWidth: 800

    CircularProgress {
        id: cpuCircle
        icon: "../../assets/cpu.svg"
        colorBg: "#3b4252"
        colorFg: "#a3be8c" // Color verde
        value: 0.0
        valuePercent: "0 %"
    }

    Process {
        id: cpu
        running: true

        // Get CPU usage from terminal
        command: ["sh", "-c", "vmstat 1 2 | tail -1 | awk '{print 100 - $15}'"]

        stdout: StdioCollector {
            onStreamFinished: {
                // Clean spaces and transform to float
                var usageNumeric = parseFloat(this.text.trim());

                if (!isNaN(usageNumeric)) {
                    cpuCircle.value = usageNumeric / 100.0;
                    cpuCircle.valuePercent = usageNumeric + " %"
                }
            }
        }
    }


    Timer {
        interval: 2000
        running: true
        repeat: true
        onTriggered: cpu.running = true
    }
}
