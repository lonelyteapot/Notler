import QtQuick 2.6
import QtQuick.Layouts 1.0

MouseArea {
    id: roundButton
    implicitWidth: height
    cursorShape: Qt.PointingHandCursor
    hoverEnabled: true

    property alias text: label.text
    property alias color: background.color

    Rectangle {
        id: background
        anchors.fill: parent
        radius: height * 0.45
        color: colors.canvas
        border.color: colors.divider
    }

    Text {
        id: label
        anchors.centerIn: parent
        font.pixelSize: roundButton.height - 8
        opacity: roundButton.containsMouse ? 1 : 0.625
    }
}
