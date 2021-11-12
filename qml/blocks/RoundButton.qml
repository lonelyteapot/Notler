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
        radius: height * 0.5
    }

    Text {
        id: label
        anchors.centerIn: parent
        font.pixelSize: roundButton.height - 6
        opacity: roundButton.containsMouse ? 1 : 0.625
    }
}
