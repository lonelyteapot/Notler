import QtQuick 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls 2.0

ToolTip {
    id: tooltip
    delay: 250

    // Fixes right padding bug
    contentItem: Text {
        text: tooltip.text
        font: tooltip.font
    }

    background: Rectangle {
        color: colors.canvas
        border.color: colors.primary
        radius: 8
    }
}
