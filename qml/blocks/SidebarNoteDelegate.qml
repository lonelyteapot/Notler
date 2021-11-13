import QtQuick 2.0
import QtQuick.Layouts 1.0

Rectangle {
    id: noteCard
    anchors.left: parent?.left
    anchors.right: parent?.right
    implicitHeight: 64
    border.color: colors.divider
    radius: 8
    clip: true
    color: ListView.isCurrentItem ? colors.primary : colors.canvas

    readonly property variant modelData: model

    MouseArea {
        anchors.fill: parent
        onClicked: noteCard.ListView.view.currentIndex = model.index
    }

    GridLayout {
        anchors.fill: parent
        anchors.topMargin: 6
        anchors.bottomMargin: 6
        anchors.leftMargin: 8
        anchors.rightMargin: 8
        rowSpacing: 2
        columnSpacing: 6
        columns: 3
        rows: 3

        Text {
            id: titleText
            Layout.fillWidth: true
            Layout.preferredHeight: 20
            Layout.leftMargin: 4
            font.pixelSize: 16
            text: model.title || qsTr("Untitled note")
        }

        Text {
            id: unsavedIndicator
            text: model.isSaved ? "" : "!"
        }

        RoundButton {
            Layout.preferredHeight: 14
            color: colors.canvas
            text: "✕"
            onClicked: noteCard.ListView.view.model.removeNote(model.index)
        }

        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: 1
            Layout.columnSpan: parent.columns
            color: "#1A000000"
        }

        Text {
            id: textText
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.leftMargin: 4
            Layout.columnSpan: parent.columns
            font.pixelSize: 10
            wrapMode: Text.Wrap
            maximumLineCount: 2
            text: model.text
            opacity: 0.4
        }
    }
}
