import QtQuick 2.0
import QtQuick.Layouts 1.0

Rectangle {
    color: "#dee2e6"

    readonly property variant currentModelData: notesList.currentItem.modelData

    ColumnLayout {
        anchors.fill: parent
        anchors.topMargin: 0
        anchors.bottomMargin: 8
        anchors.leftMargin: 8
        anchors.rightMargin: 8
        spacing: 4

        Item {
            Layout.preferredHeight: 32
        }

        ListView {
            id: notesList
            Layout.fillWidth: true
            Layout.fillHeight: true
            spacing: 4
            clip: true
            model: SidebarListModel {}
            delegate: SidebarNoteDelegate {}
            footer: SidebarNewNoteButton {}
        }
    }
}
