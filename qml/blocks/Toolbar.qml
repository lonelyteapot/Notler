import QtQuick 2.6
import QtQuick.Layouts 1.0

Rectangle {
    color: colors.canvas
    clip: true

    RowLayout {
        anchors.fill: parent
        anchors.topMargin: 5
        anchors.bottomMargin: 5
        anchors.leftMargin: 8
        anchors.rightMargin: 8
        spacing: 8
        visible: !!root.currentNote

        Item {
            Layout.fillWidth: true
            Layout.fillHeight: true
            clip: true

            Text {
                id: textHint
                anchors.fill: parent
                verticalAlignment: TextInput.AlignVCenter
                font.pixelSize: 16
                opacity: 0.5
                text: qsTr("Untitled note")
                visible: !textInput.text
            }

            TextInput {
                id: textInput
                anchors.fill: parent
                verticalAlignment: TextInput.AlignVCenter
                font.pixelSize: 16
                selectByMouse: true
                text: root.currentNote?.title || "";
                onTextChanged: if (root.currentNote) root.currentNote.title = text
            }
        }

        RoundButton {
            Layout.fillHeight: true
            text: "✕"
            onClicked: sidebar.currentNoteIndex = -1
        }
    }
}
