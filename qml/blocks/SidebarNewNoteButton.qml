import QtQuick 2.0
import QtQuick.Layouts 1.0

Item {
    anchors.left: parent.left
    anchors.right: parent.right
    implicitHeight: 64

    Rectangle {
        anchors.centerIn: parent
        implicitWidth: txt.width + 26
        implicitHeight: 32
        color: "#f8f9fa"
        radius: 18

        Text {
            id: txt
            anchors.centerIn: parent
            font.pixelSize: 14
            text: "new note"
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                notesList.model.createNote(notesList.model.rowCount())
                notesList.currentIndex = notesList.model.rowCount() - 1
            }
        }
    }
}
