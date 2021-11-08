#ifndef NOTE_H
#define NOTE_H

#include <QString>

class Note
{
public:
    Note(QString title = {}, QString text = {});

    /// Returns the Note's title.
    QString title() const;
    /// Returns the Note's text.
    QString text() const;

    /// Renames the Note to %newTitle.
    void rename(QString newTitle);
    /// Sets the Note's text to %newText.
    void setText(QString newText);

private:
    QString _title {};
    QString _text {};
};

#endif // NOTE_H
