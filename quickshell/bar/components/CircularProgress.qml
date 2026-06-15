import QtQuick 2.15
import QtQuick.Shapes 1.15
import QtQuick.Layouts 1.15

Item {
    id: control

    property real value: 0.0
    property string valuePercent: "0 %"
    property string icon: ""
    property color colorBg: "#2e3440"
    property color colorFg: "#88c0d0"

    RowLayout {
        id: mainLayout
        spacing: 8

        // Circle container
        Item {
            id: circleContainer
            Layout.preferredWidth: 30
            Layout.preferredHeight: 30

            // Circle background
            Rectangle {
                anchors.fill: parent
                radius: width / 2
                color: control.colorBg
                antialiasing: true
            }

            // Circle progress
            Shape {
                anchors.fill: parent
                layer.enabled: true
                layer.samples: 4

                ShapePath {
                    strokeColor: "transparent"
                    fillColor: control.colorFg

                    // Usamos las medidas de 'circleContainer' para que el dibujo sea exacto
                    PathLine {
                        x: circleContainer.width / 2; y: circleContainer.height / 2
                    }

                    PathAngleArc {
                        centerX: circleContainer.width / 2
                        centerY: circleContainer.height / 2
                        radiusX: circleContainer.width / 2
                        radiusY: circleContainer.height / 2
                        startAngle: -90
                        sweepAngle: 360 * Math.max(0.0, Math.min(1.0, control.value))

                        Behavior on sweepAngle {
                            NumberAnimation {
                                duration: 300; easing.type: Easing.OutQuad
                            }
                        }
                    }

                    PathLine {
                        x: circleContainer.width / 2; y: circleContainer.height / 2
                    }
                }
            }

            Image {
                width: 24
                height: 24
                anchors.centerIn: parent
                sourceSize.width: width
                sourceSize.height: height
                source: control.icon
            }
        }

        // Text containing de data
        Text {
            id: percentText
            text: control.valuePercent
            color: "black"
            font.pixelSize: 13
        }
    }
}