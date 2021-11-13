import QtQuick 2.6
import QtQuick.Layouts 1.0
import QtQuick.Controls 2.0

MouseArea {
    id: roundButton
    implicitWidth: height
    cursorShape: Qt.PointingHandCursor
    hoverEnabled: true

    property alias text: label.text
    property alias color: background.color
    property alias hint: tooltip.text

    Rectangle {
        id: background
        anchors.fill: parent
        radius: height * 0.45
        color: colors.canvas
        border.color: colors.divider
    }

    Text {
        id: label
        anchors.fill: parent
        anchors.margins: 1
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.pixelSize: height - 4
        minimumPixelSize: 1
        fontSizeMode: Text.VerticalFit
        opacity: roundButton.containsMouse ? 1 : 0.625
    }

    CustomToolTip {
        id: tooltip
        visible: !!text && roundButton.containsMouse
    }
}
