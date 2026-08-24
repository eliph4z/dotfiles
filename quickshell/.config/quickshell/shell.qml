import Quickshell
import QtQuick

// Simple bar - global font is Ioskeley Mono
ShellRoot {
    id: root
    // Global font for the entire bar - change here to update all widgets
    property string barFontFamily: "Ioskeley Mono"
    Variants {
        model: Quickshell.screens

        PanelWindow {
            required property var modelData
            screen: modelData

            anchors {
                top: true
                left: true
                right: true
            }

            implicitHeight: 30
            color: "#1e1e2e"
            // reserve space (exclusive zone) so windows don't overlap
            exclusiveZone: 30

            // Bar layout: workspaces left, datetime center
            Item {
                anchors.fill: parent

                WorkspacesWidget {
                    anchors.left: parent.left
                    anchors.leftMargin: 12
                    anchors.verticalCenter: parent.verticalCenter
                    barFontFamily: root.barFontFamily
                }

                DateTimeWidget {
                    anchors.centerIn: parent
                    font.family: root.barFontFamily
                }
            }
        }
    }
}
