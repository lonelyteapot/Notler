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
    color: colors.background

    readonly property variant currentNotebook: sidebar.currentNotebook
    readonly property variant currentNote: sidebar.currentNote
    readonly property int currentNoteIndex: sidebar.currentNoteIndex
    property int previousNoteIndex: -1
    onCurrentNoteIndexChanged: {
        currentNotebook.saveNote(previousNoteIndex)
        previousNoteIndex = currentNoteIndex
    }

    Item {
        id: colors
        readonly property color background: "#FFFFFF"
        readonly property color canvas: "#F8F9FA"
        readonly property color primary: "#BDE0FE"
        readonly property color sidebar: "#F5F6F8"
        readonly property color divider: "#1E000000"
    }

    Rectangle {
        anchors.fill: parent
        color: colors.divider

        GridLayout {
            anchors.fill: parent
            anchors.topMargin: 1
            rowSpacing: 1
            columnSpacing: 1

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
                Layout.preferredHeight: 30
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
}
