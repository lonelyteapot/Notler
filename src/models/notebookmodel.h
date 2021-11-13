#ifndef NOTESLISTMODEL_H
#define NOTESLISTMODEL_H

#include <QAbstractListModel>
#include <src/objects/notebook.h>
#include <src/globals.h>

class NotebookModel : public QAbstractListModel
{
    Q_OBJECT

public:
    /// Defines Notes' properties accessible through the model.
    enum NoteRoles {
        TitleRole = Qt::UserRole,
        TextRole,
        IsSavedRole,
    };

    explicit NotebookModel(QObject *parent = nullptr);

    /// Returns a mapping from NoteRoles to role names used by QML.
    QHash<int, QByteArray> roleNames() const override;
    /// Returns flags of the model used by QML.
    Qt::ItemFlags flags(const QModelIndex& index) const override;
    /// Returns the count of Notes in the Notebook.
    int rowCount(const QModelIndex &parent = QModelIndex()) const override;
    /// Returns the property %role of the Note at %index in the Notebook.
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;

    /// Sets the property %role of the Note at %index in the Notebook to %value.
    bool setData(const QModelIndex &index, const QVariant &value, int role = Qt::EditRole) override;
    /// Inserts %count empty Notes starting at index %row into the Notebook.
    bool insertRows(int row, int count, const QModelIndex &parent = QModelIndex()) override;
    /// Removes %count Notes starting at index %row from the Notebook.
    bool removeRows(int row, int count, const QModelIndex &parent = QModelIndex()) override;

    /// Returns the title of the Notebook
    Q_INVOKABLE QString getTitle() const;
    /// Creates a Note at %idx into the Notebook.
    Q_INVOKABLE bool createNote(int idx);
    /// Removes the Note at %idx from the Notebook.
    Q_INVOKABLE bool removeNote(int idx);
    /// Saves the Note at %idx to local storage.
    Q_INVOKABLE bool saveNote(int idx);

private:
    Notebook _notebook = Notebook::loadFromDirectory({ROOT_STORAGE_PATH + "/Default notebook"});
};

#endif // NOTESLISTMODEL_H
