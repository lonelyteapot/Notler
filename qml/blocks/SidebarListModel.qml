import QtQuick 2.0
import QtQuick.Layouts 1.0

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
