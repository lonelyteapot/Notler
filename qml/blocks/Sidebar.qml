import QtQuick 2.15
import QtQuick.Layouts 1.0
import NotlerTypes 1.0

Rectangle {
    color: "#ced4da"
    clip: true

    readonly property variant currentNotebook: notesList.model
    readonly property variant currentNote: notesList.currentItem?.modelData;
    property alias currentNoteIndex: notesList.currentIndex

    ColumnLayout {
        anchors.fill: parent
        spacing: 0

        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: 32 + radius
            Layout.topMargin: -radius
            Layout.leftMargin: 6
            Layout.rightMargin: 6
            color: "#e9ecef"
            radius: 10
            z: 1

            Item {
                anchors.fill: parent
                anchors.topMargin: parent.radius

                Text {
                    anchors.centerIn: parent
                    font.pixelSize: 16
                    text: root.currentNotebook.getTitle()
                }
            }
        }

        Item {
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.leftMargin: 8
            Layout.rightMargin: 8

            ListView {
                id: notesList
                anchors.fill: parent
                anchors.topMargin: 6
                displayMarginBeginning: 6
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
