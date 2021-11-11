import QtQuick
import QtQuick.Window
import QtQuick.Layouts

import "blocks"

Window {
    id: root
    width: 640
    height: 480
    visible: true
    title: qsTr("Notler")

    readonly property variant currentNotebook: sidebar.currentNotebook
    readonly property variant currentNote: sidebar.currentNote
    readonly property int currentNoteIndex: sidebar.currentNoteIndex

    GridLayout {
        anchors.fill: parent
        rowSpacing: 0
        columnSpacing: 0

        Sidebar {
            id: sidebar
            Layout.preferredWidth: 240
            Layout.fillHeight: true
            Layout.row: 0
            Layout.column: 0
            Layout.rowSpan: 2
        }

        Toolbar {
            id: toolbar
            Layout.fillWidth: true
            Layout.preferredHeight: 32
            Layout.row: 0
            Layout.column: 1
            enabled: !!currentNote
        }

        Editor {
            id: editor
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.row: 1
            Layout.column: 1
            enabled: !!currentNote
        }
    }
}
