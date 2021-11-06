#ifndef NOTE_H
#define NOTE_H

#include <string>


class Note
{
public:
    std::string title {};
    std::string text {};

    Note();
    Note(std::string title, std::string text);
};

#endif // NOTE_H
