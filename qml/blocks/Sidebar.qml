import QtQuick 2.0
import QtQuick.Layouts 1.0

Rectangle {
    color: "#dee2e6"

    readonly property variant currentModelData: notesList.currentItem.modelData

    ListModel {
        id: notesListModel
        ListElement {
            title: "First note"
            text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
        }
        ListElement {
            title: "Second note"
            text: "Curabitur at porttitor velit. Nulla sodales sodales est quis sagittis."
        }
        ListElement {
            title: "Third note"
            text: "Nunc condimentum leo ac velit elementum aliquet. Nullam lobortis ullamcorper arcu, sit amet lobortis mi sagittis in."
        }
    }

    Component {
        id: noteDelegate

        Rectangle {
            id: noteCard
            anchors.left: parent.left
            anchors.right: parent.right
            implicitHeight: 64
            border.width: 2
            border.color: "#ced4da"
            radius: 8
            color: ListView.isCurrentItem ? "#e2eafc" : "#f8f9fa"

            readonly property variant modelData: model

            MouseArea {
                anchors.fill: parent
                onClicked: noteCard.ListView.view.currentIndex = model.index
            }

            ColumnLayout {
                anchors.fill: parent
                anchors.topMargin: 6
                anchors.bottomMargin: 6
                anchors.leftMargin: 16
                anchors.rightMargin: 16
                spacing: 0
                clip: true

                Text {
                    id: titleText
                    Layout.fillWidth: true
                    Layout.preferredHeight: 20
                    font.pixelSize: 16
                    text: model.title || qsTr("Untitled note")
                }

                Text {
                    id: textText
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    Layout.leftMargin: 1
                    color: "#6c757d"
                    font.pixelSize: 12
                    wrapMode: Text.Wrap
                    text: model.text
                }
            }
        }
    }

    Component {
        id: notesListFooter

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
                        notesList.model.append({title: "", text: ""})
                        notesList.currentIndex = notesList.model.count - 1
                    }
                }
            }
        }
    }

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
            model: notesListModel
            delegate: noteDelegate
            footer: notesListFooter
        }
    }
}
