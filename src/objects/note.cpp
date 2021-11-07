#include "note.h"

Note::Note(QString title, QString text):
    _title(title), _text(text)
{
}

QString Note::title()
{
    return _title;
}

QString Note::text()
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
