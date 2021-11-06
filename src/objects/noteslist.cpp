#include "noteslist.h"
#include <cassert>


NotesList::NotesList()
{
    // TODO Remove placeholder notes
    this->vector.push_back({"First note", "Lorem ipsum dolor sit amet, consectetur adipiscing elit."});
    this->vector.push_back({"Second note", "Curabitur at porttitor velit. Nulla sodales sodales est quis sagittis."});
    this->vector.push_back({"Third note", "Nunc condimentum leo ac velit elementum aliquet. Nullam lobortis ullamcorper arcu, sit amet lobortis mi sagittis in."});
}

size_t NotesList::size() const
{
    return vector.size();
}

Note &NotesList::operator[](int idx)
{
    assert(idx >= 0 && idx < vector.size() && "index out of bounds");
    return vector[idx];
}

bool NotesList::insertNotes(int idx, int count, const Note& note)
{
    if (idx < 0 || idx > vector.size() || count <= 0)
        return false;
    vector.insert(vector.begin() + idx, count, note);
    return true;
}

bool NotesList::removeNotes(int idx, int count)
{
    if (idx < 0 || count <= 0 || idx + count > vector.size())
        return false;
    vector.erase(vector.begin() + idx, vector.begin() + idx + count);
    return true;
}
