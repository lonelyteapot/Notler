#ifndef NOTESLIST_H
#define NOTESLIST_H

#include "note.h"
#include <vector>


class NotesList
{
public:
    NotesList();

    /// Returns the number of notes in the list
    size_t size() const;
    /// Returns the note at index %idx
    Note& operator[](int idx);
    /// Inserts %count copies of &note starting from index %idx.
    /// Returns true if successful.
    bool insertNotes(int idx, int count = 1, const Note& note = {});
    /// Removes %count notes starting from index %idx.
    /// Returns true if successful.
    bool removeNotes(int idx, int count = 1);

private:
    /// Stores notes in memory
    std::vector<Note> vector {};
};

#endif // NOTESLIST_H
