#ifndef NOTEBOOK_H
#define NOTEBOOK_H

#include "note.h"
#include <QString>
#include <vector>

class Notebook
{
public:
    Notebook() = default;
    Notebook(QString title);
    ~Notebook();
    static Notebook loadFromDirectory(QDir directory);

    /// Returns the Notebook's title.
    QString title() const;
    /// Returns the count of notes in the Notebook.
    int noteCount() const;

    /// Renames Notebook to %newTitle.
    void rename(QString newTitle);
    /// Inserts %count copies of %note starting at %idx.
    void insertNoteCopies(int idx, int count = 1, const Note& note = {});
    /// Removes %count notes starting at %idx from the Notebook.
    void removeNotes(int idx, int count = 1);
    /// Saves the Note at %idx to local storage.
    bool saveNote(int idx);

    /// Returns the Note at %idx.
    Note& operator[](int idx);

private:
    QString _title {"Untitled notebook"};
    std::vector<Note> _notes {};
};

#endif // NOTEBOOK_H
