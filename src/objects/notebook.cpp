#include "notebook.h"
#include <cassert>

Notebook::Notebook():
    _title("Untitled notebook")
{
    // TODO Remove placeholder notes
    _notes.push_back({"First note", "Lorem ipsum dolor sit amet, consectetur adipiscing elit."});
    _notes.push_back({"Second note", "Curabitur at porttitor velit. Nulla sodales sodales est quis sagittis."});
    _notes.push_back({"Third note", "Nunc condimentum leo ac velit elementum aliquet. Nullam lobortis ullamcorper arcu, sit amet lobortis mi sagittis in."});
}

Notebook::Notebook(QString title):
    _title(title)
{
}

QString Notebook::title() const
{
    return _title;
}

int Notebook::noteCount() const
{
    return _notes.size();
}

void Notebook::rename(QString newTitle)
{
    _title = newTitle;
}

void Notebook::insertNoteCopies(int idx, int count, const Note &note)
{
    assert(idx >= 0 && idx <= _notes.size());
    assert(count >= 1);
    _notes.insert(_notes.begin() + idx, count, note);
}

void Notebook::removeNotes(int idx, int count)
{
    assert(idx >= 0 && idx < _notes.size());
    assert(count >= 1 && idx + count <= _notes.size());
    _notes.erase(_notes.begin() + idx, _notes.begin() + idx + count);
}

Note& Notebook::operator[](int idx)
{
    assert(idx >= 0 && idx < _notes.size());
    return _notes[idx];
}
