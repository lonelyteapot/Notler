import QtQuick 2.0
import QtQuick.Layouts 1.0

Item {
    anchors.left: parent.left
    anchors.right: parent.right
    implicitHeight: 46

    Rectangle {
        anchors.centerIn: parent
        implicitWidth: label.width + 26
        implicitHeight: 32
        color: "#f8f9fa"
        border.color: colors.divider
        radius: 18

        Text {
            id: label
            anchors.centerIn: parent
            font.pixelSize: 14
            text: "new note"
        }

        MouseArea {
            id: mouseArea
            anchors.fill: parent
            hoverEnabled: true
            onClicked: {
                notesList.model.createNote(notesList.model.rowCount())
                notesList.currentIndex = notesList.model.rowCount() - 1
            }
        }

        CustomToolTip {
            visible: mouseArea.containsMouse
            text: qsTr("Create a new note")
        }
    }
}
