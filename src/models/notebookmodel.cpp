#include "notebookmodel.h"

NotebookModel::NotebookModel(QObject *parent)
    : QAbstractListModel(parent)
{
}

QHash<int, QByteArray> NotebookModel::roleNames() const
{
    QHash<int, QByteArray> roleNames;
    roleNames[TitleRole] = "title";
    roleNames[TextRole] = "text";
    return roleNames;
}

Qt::ItemFlags NotebookModel::flags(const QModelIndex &index) const
{
    if (!index.isValid())
        return Qt::NoItemFlags;
    return Qt::ItemIsEditable;
}

int NotebookModel::rowCount(const QModelIndex &parent) const
{
    if (parent.isValid())
        return 0;
    return _notebook.noteCount();
}

QVariant NotebookModel::data(const QModelIndex &index, int role) const
{
    if (!index.isValid())
        return QVariant();

    // TODO Better const support
    Notebook& constNotebook = *const_cast<Notebook*>(&_notebook);
    Note& note = constNotebook[index.row()];

    if (role == TitleRole) {
        return note.title();
    }
    if (role == TextRole) {
        return note.text();
    }

    return QVariant();
}

bool NotebookModel::setData(const QModelIndex &index, const QVariant &value, int role)
{
    if (data(index, role) == value)
        return false;

    Note& note = _notebook[index.row()];

    if (role == TitleRole) {
        note.rename(value.toString());
    } else if (role == TextRole) {
        note.setText(value.toString());
    } else {
        return false;
    }

    emit dataChanged(index, index, QVector<int>() << role);
    return true;
}

bool NotebookModel::insertRows(int row, int count, const QModelIndex &parent)
{
    if (row < 0 || row > _notebook.noteCount() || count < 1)
        return false;

    beginInsertRows(parent, row, row + count - 1);
    _notebook.insertNoteCopies(row, count);
    endInsertRows();
    return true;
}

bool NotebookModel::removeRows(int row, int count, const QModelIndex &parent)
{
    if (row < 0 || count < 1 || row + count > _notebook.noteCount())
        return false;

    beginRemoveRows(parent, row, row + count - 1);
    _notebook.removeNotes(row, count);
    endRemoveRows();
    return true;
}

bool NotebookModel::createNote(int idx)
{
    return insertRows(idx, 1);
}

bool NotebookModel::removeNote(int idx)
{
    return removeRows(idx, 1);
}
