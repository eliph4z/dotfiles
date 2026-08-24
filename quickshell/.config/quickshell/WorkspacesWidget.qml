import Quickshell
import Quickshell.Hyprland
import QtQuick

Row {
    id: root
    // Inherit global bar font from shell.qml - set via barFontFamily property
    property string barFontFamily: "Ioskeley Mono"
    spacing: 6

    Repeater {
        model: Hyprland.workspaces

        delegate: Rectangle {
            required property HyprlandWorkspace modelData

            // Hide special workspaces (e.g. scratchpad) - they have negative id or name like "special:..."
            visible: modelData.id > 0 && !modelData.name.startsWith("special:")
            width: visible ? 28 : 0
            height: 20
            radius: 6
            // Colors: focused = bright, active = muted, inactive = dark
            color: modelData.focused ? "#89b4fa" : modelData.active ? "#45475a" : "#313244"
            border.color: modelData.urgent ? "#f38ba8" : "transparent"
            border.width: modelData.urgent ? 1 : 0

            Text {
                anchors.centerIn: parent
                // Show name - for numbered workspaces name == id, for named ones show name
                text: modelData.name
                font.family: root.barFontFamily
                font.pixelSize: 12
                font.bold: modelData.focused || modelData.active
                color: modelData.focused ? "#1e1e2e" : modelData.active ? "#cdd6f4" : "#a6adc8"
            }

            MouseArea {
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                hoverEnabled: true
                onClicked: modelData.activate()
                // Optional hover highlight
                onEntered: parent.opacity = 0.8
                onExited: parent.opacity = 1.0
            }
        }
    }
}
