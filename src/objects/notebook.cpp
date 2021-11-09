#include "notebook.h"
#include <QDir>
#include <cassert>
#include <iostream>
#include <src/globals.h>

Notebook::Notebook(QString title):
    _title(title)
{
}

Notebook::~Notebook()
{
    for (int i = 0; i < _notes.size(); ++i) {
        saveNote(i);
    }
}

Notebook Notebook::loadFromDirectory(QDir directory)
{
    Notebook notebook {};

    QFileInfoList fileInfoList = directory.entryInfoList(QDir::Readable | QDir::Files);

    if (fileInfoList.isEmpty()) {
        std::cerr << "Couldn't read notebook \"" << directory.dirName().toStdString() << "\"" << std::endl;
        return notebook;
    }

    notebook._title = directory.dirName();

    notebook._notes.reserve(fileInfoList.size());
    for (QFileInfo& fileInfo : fileInfoList) {
        Note note = Note::loadFromFile(fileInfo);
        notebook._notes.push_back(note);
    }

    return notebook;
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

bool Notebook::saveNote(int idx)
{
    assert(idx >= 0 && idx < _notes.size());

    const QDir notebookDir {ROOT_STORAGE_PATH + "/" + title()};

    bool notebookDirAvailable = notebookDir.mkpath(".");
    if (!notebookDirAvailable) {
        std::cerr << "Unable to create directory \"" << notebookDir.path().toStdString() << "\"" << std::endl;
        return false;
    }

    _notes[idx].saveToFile(notebookDir);

    return true;
}

Note& Notebook::operator[](int idx)
{
    assert(idx >= 0 && idx < _notes.size());
    return _notes[idx];
}
