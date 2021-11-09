import QtQuick 2.6
import QtQuick.Layouts 1.0

Rectangle {
    color: "#e9ecef"

    RowLayout {
        anchors.fill: parent
        anchors.leftMargin: 6
        anchors.rightMargin: 6
        spacing: 4

        Text {
            id: unsavedIndicator
            Layout.fillHeight: true
            font.pixelSize: 22
            text: "*"
            visible: !root.currentNote?.isSaved
        }

        TextInput {
            id: textInput
            Layout.fillWidth: true
            Layout.fillHeight: true
            verticalAlignment: TextInput.AlignVCenter
            font.pixelSize: 22
            clip: true
            text: root.currentNote?.title || ""
            onTextChanged: if (root.currentNote) root.currentNote.title = text
        }
    }
}
