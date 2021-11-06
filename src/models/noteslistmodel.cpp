#include "noteslistmodel.h"


QHash<int, QByteArray> NotesListModel::roleNames() const
{
    QHash<int, QByteArray> roleNames;
    roleNames[TitleRole] = "title";
    roleNames[TextRole] = "text";
    return roleNames;
}

Qt::ItemFlags NotesListModel::flags(const QModelIndex &index) const
{
    if (!index.isValid())
        return Qt::NoItemFlags;
    return Qt::ItemIsEditable;
}

NotesListModel::NotesListModel(QObject *parent)
    : QAbstractListModel(parent)
{
}

int NotesListModel::rowCount(const QModelIndex &parent) const
{
    if (parent.isValid())
        return 0;
    return notesList.size();
}

QVariant NotesListModel::data(const QModelIndex &index, int role) const
{
    if (!index.isValid())
        return QVariant();
    // TODO Better const support
    NotesList& constNotesList = *const_cast<NotesList*>(&notesList);
    Note& note = constNotesList[index.row()];
    if (role == TitleRole) {
        return QString::fromStdString(note.title);
    }
    if (role == TextRole) {
        return QString::fromStdString(note.text);
    }
    return QVariant();
}

bool NotesListModel::setData(const QModelIndex &index, const QVariant &value, int role)
{
    if (data(index, role) != value) {
        Note& note = notesList[index.row()];
        if (role == TitleRole) {
            note.title = value.toString().toStdString();
        }
        if (role == TextRole) {
            note.text = value.toString().toStdString();
        }
        emit dataChanged(index, index, QVector<int>() << role);
        return true;
    }
    return false;
}

bool NotesListModel::insertRows(int row, int count, const QModelIndex &parent)
{
    beginInsertRows(parent, row, row + count - 1);
    bool succ = notesList.insertNotes(row, count);
    endInsertRows();
    return succ;
}

bool NotesListModel::removeRows(int row, int count, const QModelIndex &parent)
{
    beginRemoveRows(parent, row, row + count - 1);
    bool succ = notesList.removeNotes(row, count);
    endRemoveRows();
    return succ;
}

bool NotesListModel::insertNote(int idx)
{
    return insertRows(idx, 1);
}

bool NotesListModel::removeNote(int idx)
{
    return removeRows(idx, 1);
}
