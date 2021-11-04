import QtQuick 2.6

Rectangle {
    color: "#f8f9fa"

    TextEdit {
        id: textEdit
        anchors.fill: parent
        topPadding: 6
        bottomPadding: 6
        leftPadding: 6
        rightPadding: 6
        font.pixelSize: 16
        focus: true
        wrapMode: TextEdit.Wrap
        selectByMouse: true
        selectByKeyboard: true
        clip: true
        text: root.currentNote?.text || ""
        onTextChanged: if (root.currentNote) root.currentNote.text = text
    }
}
