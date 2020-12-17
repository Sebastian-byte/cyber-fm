import QtQuick 2.4
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.1
import MeuiKit 1.0 as Meui

Item {
    id: item
    width: parent ? parent.width : undefined
    implicitHeight: 48

    property bool highlighted: false
    property var iconName
    property var text
    signal clicked

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true
        acceptedButtons: Qt.LeftButton
        onClicked: item.clicked()
    }

    Rectangle {
        id: rect
        anchors.fill: parent
        radius: Meui.Theme.bigRadius
        color: highlighted ? Meui.Theme.highlightColor
                           : mouseArea.containsMouse ? Qt.rgba(Meui.Theme.textColor.r,
                                                               Meui.Theme.textColor.g,
                                                               Meui.Theme.textColor.b, 0.1) : "transparent"
        Behavior on color {
            ColorAnimation {
                duration: 125
            }
        }
    }

    RowLayout {
        anchors.fill: rect
        anchors.leftMargin: Meui.Units.largeSpacing
        anchors.rightMargin: Meui.Units.largeSpacing

        spacing: Meui.Units.largeSpacing

        Label {
            id: itemTitle
            text: item.text
            color: highlighted ? Meui.Theme.highlightedTextColor : Meui.Theme.textColor
            elide: Text.ElideRight
            font.bold: highlighted

            Layout.alignment: Qt.AlignVCenter
            Layout.fillWidth: true
        }
    }
}
