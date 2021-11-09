import QtQuick 2.6

Rectangle {
    color: "#e9ecef"

    TextInput {
        id: textInput
        anchors.fill: parent
        verticalAlignment: TextInput.AlignVCenter
        font.pixelSize: 22
        leftPadding: 6
        rightPadding: 6
        clip: true
        text: root.currentNote?.title || ""
        onTextChanged: if (root.currentNote) root.currentNote.title = text
    }
}
