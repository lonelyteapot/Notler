#ifndef NOTESLISTMODEL_H
#define NOTESLISTMODEL_H

#include <QAbstractListModel>
#include <src/objects/noteslist.h>


class NotesListModel : public QAbstractListModel
{
    Q_OBJECT

public:
    enum NoteRoles {
        TitleRole = Qt::UserRole,
        TextRole,
    };
    QHash<int, QByteArray> roleNames() const override;
    Qt::ItemFlags flags(const QModelIndex& index) const override;

    explicit NotesListModel(QObject *parent = nullptr);

    int rowCount(const QModelIndex &parent = QModelIndex()) const override;
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;
    bool setData(const QModelIndex &index, const QVariant &value, int role = Qt::EditRole) override;
    bool insertRows(int row, int count, const QModelIndex &parent = QModelIndex()) override;
    bool removeRows(int row, int count, const QModelIndex &parent = QModelIndex()) override;

    Q_INVOKABLE bool insertNote(int idx);
    Q_INVOKABLE bool removeNote(int idx);

private:
    NotesList notesList {};
};

#endif // NOTESLISTMODEL_H
