import QtQuick 2.6
import QtQuick.Layouts 1.0

Rectangle {
    color: "#e9ecef"
    clip: true

    RowLayout {
        anchors.fill: parent
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
                font.pixelSize: 20
                opacity: 0.5
                text: qsTr("Untitled note")
                visible: textInput.text == ""
            }

            TextInput {
                id: textInput
                anchors.fill: parent
                verticalAlignment: TextInput.AlignVCenter
                font.pixelSize: 20
                text: root.currentNote?.title || "";
                onTextChanged: if (root.currentNote) root.currentNote.title = text
            }
        }

        Rectangle {
            Layout.preferredWidth: 22
            Layout.preferredHeight: width
            radius: height * 0.5

            Text {
                anchors.centerIn: parent
                font.pixelSize: 14
                text: "✕"
            }

            MouseArea {
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                onClicked: sidebar.currentNoteIndex = -1
            }
        }
    }
}
