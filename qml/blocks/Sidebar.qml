import QtQuick 2.0
import QtQuick.Layouts 1.0
import NotlerTypes 1.0

Rectangle {
    color: "#dee2e6"

    readonly property variant currentModelData: notesList.currentItem?.modelData

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 8
        spacing: 4

        ListView {
            id: notesList
            Layout.fillWidth: true
            Layout.fillHeight: true
            spacing: 4
            clip: true
            model: NotesListModel {}
            delegate: SidebarNoteDelegate {}
            footer: SidebarNewNoteButton {}
        }
    }
}
