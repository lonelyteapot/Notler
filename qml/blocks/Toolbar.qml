import QtQuick 2.6

Rectangle {
    color: "#e9ecef"

    property alias noteTitle: textInput.text

    TextInput {
        id: textInput
        anchors.fill: parent
        verticalAlignment: TextInput.AlignVCenter
        font.pixelSize: 22
        leftPadding: 6
        rightPadding: 6
        clip: true
    }
}
