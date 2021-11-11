import QtQuick 2.0
import QtQuick.Layouts 1.0
import NotlerTypes 1.0

Rectangle {
    color: "#ced4da"
    clip: true

    readonly property variant currentNotebook: notesList.model
    readonly property variant currentNote: notesList.currentItem?.modelData;

    ColumnLayout {
        anchors.fill: parent
        spacing: 0

        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: 32
            color: "#dee2e6"

            Text {
                anchors.centerIn: parent
                font.pixelSize: 18
                text: root.currentNotebook.getTitle()
            }
        }

        Item {
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.leftMargin: 8
            Layout.rightMargin: 8
            clip: true

            ListView {
                id: notesList
                anchors.fill: parent
                anchors.topMargin: 6
                spacing: 4
                model: NotebookModel {}
                delegate: SidebarNoteDelegate {}
                footer: SidebarNewNoteButton {}
                // Setting a header causes a weird bug when the ListView is empty,
                // so the outer Item is used for top padding.
            }
        }
    }
}
