import Quickshell
import QtQuick

Text {
    id: root
    color: "white"
    // font.family is set globally in shell.qml (barFontFamily) - inherits from parent bar
    font.pixelSize: 14
    font.bold: true

    // Live system clock - updates every second
    SystemClock {
        id: clock
        precision: SystemClock.Seconds
    }

    // Format: Wed 24 Aug 2026 • 02:34:56 PM
    // Change format string to customize: https://doc.qt.io/qt-6/qml-qtqml-qt.html#formatDateTime-method
    text: Qt.formatDateTime(clock.date, "ddd d MMM yyyy  •  hh:mm:ss AP")

    // Alternative formats (uncomment one):
    // text: Qt.formatDateTime(clock.date, "dddd, MMMM d, yyyy - hh:mm:ss AP")
    // text: Qt.formatDateTime(clock.date, "yyyy-MM-dd hh:mm:ss")
    // text: Qt.formatDateTime(clock.date, "hh:mm AP • ddd MMM d")
}
