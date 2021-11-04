import QtQuick 2.0
import QtQuick.Layouts 1.0

Rectangle {
    id: noteCard
    anchors.left: parent.left
    anchors.right: parent.right
    implicitHeight: 64
    border.width: 2
    border.color: "#ced4da"
    radius: 8
    clip: true
    color: ListView.isCurrentItem ? "#e2eafc" : "#f8f9fa"

    readonly property variant modelData: model

    MouseArea {
        anchors.fill: parent
        onClicked: noteCard.ListView.view.currentIndex = model.index
    }

    GridLayout {
        anchors.fill: parent
        anchors.topMargin: 6
        anchors.bottomMargin: 6
        anchors.leftMargin: 16
        anchors.rightMargin: 16
        rowSpacing: 0
        columnSpacing: 0
        columns: 2
        rows: 2

        Text {
            id: titleText
            Layout.fillWidth: true
            Layout.preferredHeight: 20
            font.pixelSize: 16
            text: model.title || qsTr("Untitled note")
        }

        Text {
            id: deleteText
            font.pixelSize: 12
            font.underline: deleteMouseArea.containsMouse
            color: deleteMouseArea.containsMouse ? "#495057" : "#adb5bd"
            text: "x"

            MouseArea {
                id: deleteMouseArea
                anchors.fill: parent
                anchors.margins: -4
                hoverEnabled: true
                cursorShape: Qt.PointingHandCursor
                onClicked: noteCard.ListView.view.model.remove(model.index)
            }
        }

        Text {
            id: textText
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.leftMargin: 1
            Layout.columnSpan: 2
            color: "#6c757d"
            font.pixelSize: 12
            wrapMode: Text.Wrap
            maximumLineCount: 2
            text: model.text
        }
    }
}
