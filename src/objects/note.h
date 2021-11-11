#ifndef NOTE_H
#define NOTE_H

#include <QDir>
#include <QFileInfo>
#include <QString>
#include <QUuid>

class Note
{
public:
    Note(QString title = {}, QString text = {});
    /// Constructs a Note from a file described by %fileInfo.
    /// If the load fails, returns a Note where uuid().isNull
    static Note loadFromFile(QFileInfo fileInfo);

    QUuid uuid() const;
    QString title() const;
    QString text() const;

    /// Renames the Note to %newTitle.
    void rename(QString newTitle);
    /// Sets the Note's text to %newText.
    void setText(QString newText);
    /// Saves the Note to a local file in the %directory.
    bool saveToFile(QDir directory) const;
    /// Deletes the Note from local storage.
    bool deleteFile(QDir directory) const;

private:
    QUuid _uuid = QUuid::createUuid();
    QString _title {};
    QString _text {};
};

#endif // NOTE_H
