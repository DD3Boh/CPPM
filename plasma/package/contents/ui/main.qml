/*
 *   SPDX-FileCopyrightText: 2023-2024 Davide Garberi <dade.garberi@gmail.com>
 *
 *   SPDX-License-Identifier: LGPL-2.1-or-later
 */

import QtQuick 2.15
import QtQuick.Layouts 1.15
import org.kde.plasma.core as PlasmaCore
import org.kde.plasma.plasmoid
import org.kde.plasma.components as PlasmaComponents3
import org.kde.kirigami as Kirigami

PlasmoidItem {
    id: widget

    property int val: 2

    Plasmoid.icon: 'speedometer'

    toolTipMainText: i18n("Custom Power Profiles Manager")
    toolTipSubText: {
        return i18n("Current profile: " + Plasmoid.getModeString(val))
    }

    fullRepresentation: ColumnLayout {
        anchors.fill: parent
        spacing: 0

        Connections {
            onExpandedChanged: {
                if (Plasmoid.expanded)
                    val = Plasmoid.getPowerMode()
            }
        }

        Item {
            height: 10
        }

        RowLayout {
            Layout.leftMargin: 10
            Layout.rightMargin: 35
            Kirigami.Icon {
                source: "speedometer"
                Layout.alignment: Qt.AlignTop
                Layout.preferredWidth: Kirigami.Units.iconSizes.medium
                Layout.preferredHeight: Kirigami.Units.iconSizes.medium
            }

            Item {
                width: 5
            }

            PlasmaComponents3.Slider {
                id: slider
                Layout.fillWidth: true
                from: 1
                to: 3
                value: val
                stepSize: 1

                onMoved: {
                    val = slider.value
                    Plasmoid.setPowerMode(val)
                }
            }
        }

        RowLayout {
            Layout.leftMargin: 40
            Layout.rightMargin: 10

            PlasmaComponents3.Label {
                id: powersaveLevel
                text: "Powersave"
            }

            Item {
                Layout.fillWidth: true
            }

            PlasmaComponents3.Label {
                id: balancedLabel
                text: "Balanced"
            }

            Item {
                Layout.fillWidth: true
            }

            PlasmaComponents3.Label {
                id: performanceLabel
                text: "Performance"
            }
        }

        Item {
            Layout.fillWidth: true
            Layout.fillHeight: true
        }
    }
}
