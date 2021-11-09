#include "note.h"
#include <QFile>
#include <iostream>

Note::Note(QString title, QString text):
    _title(title), _text(text)
{
}

QUuid Note::uuid() const
{
    return _uuid;
}

QString Note::title() const
{
    return _title;
}

QString Note::text() const
{
    return _text;
}

void Note::rename(QString newTitle)
{
    _title = newTitle;
}

void Note::setText(QString newText)
{
    _text = newText;
}

bool Note::saveToFile(QDir directory) const
{
    QString fileName = uuid().toString();
    QFile file {directory.path() + "/" + fileName};

    bool fileDidOpen = file.open(QFile::Text | QFile::WriteOnly);
    if (!fileDidOpen) {
        std::cerr << "Unable to open file \"" << fileName.toStdString() << "\"" << std::endl;
        return false;
    }

    QTextStream fileStream {&file};
    fileStream << "# " << title() << "\n\n";
    fileStream << text();

    file.close();
    return true;
}

Note Note::loadFromFile(QFileInfo fileInfo)
{
    Note note {};
    // TODO Refactor nullability
    // Reset uuid to null
    note._uuid = QUuid();

    QString fileName = fileInfo.fileName();
    QUuid uuid = QUuid::fromString(fileName);
    if (uuid.isNull()) {
        std::cerr << "Unable to parse file name \"" << fileName.toStdString() << "\"" << std::endl;
        return note;
    }

    QFile file {fileInfo.filePath()};
    bool fileDidOpen = file.open(QFile::Text | QFile::ReadOnly);
    if (!fileDidOpen) {
        std::cerr << "Unable to open file \"" << fileName.toStdString() << "\"" << fileInfo.filePath().toStdString() << std::endl;
        return note;
    }

    QTextStream fileStream {&file};

    QString titlePrefix = fileStream.read(2);
    if (titlePrefix != "# ") {
        std::cerr << "Unable to parse note title of \"" << fileName.toStdString() << "\"" << std::endl;
        file.close();
        return note;
    }

    note._title = fileStream.readLine();
    fileStream.readLine();
    note._text = fileStream.readAll();

    file.close();
    // TODO Refactor nullability
    note._uuid = uuid;
    return note;
}
