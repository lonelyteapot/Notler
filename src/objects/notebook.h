#ifndef NOTEBOOK_H
#define NOTEBOOK_H

#include "note.h"
#include <QString>
#include <vector>

class Notebook
{
public:
    Notebook();
    Notebook(QString title);

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

    /// Returns the Note at %idx.
    Note& operator[](int idx);

private:
    QString _title;
    std::vector<Note> _notes {};
};

#endif // NOTEBOOK_H
