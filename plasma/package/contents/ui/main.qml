/*
 *   SPDX-FileCopyrightText: 2023 Davide Garberi <dade.garberi@gmail.com>
 *
 *   SPDX-License-Identifier: LGPL-2.1-or-later
 */

import QtQuick 2.15
import QtQuick.Layouts 1.15
import org.kde.plasma.core 2.1 as PlasmaCore
import org.kde.plasma.plasmoid 2.0
import org.kde.plasma.components 3.0 as PlasmaComponents3

Item {
    id: widget

    property int val: 2

    Plasmoid.icon: 'speedometer'

    Plasmoid.toolTipMainText: i18n("Custom Power Profiles Manager")
    Plasmoid.toolTipSubText: {
        return i18n("Current profile: " + Plasmoid.nativeInterface.getModeString(val))
    }

    Plasmoid.fullRepresentation: ColumnLayout {
        anchors.fill: parent
        spacing: 0

        Connections {
            Plasmoid.onExpandedChanged: {
                if (Plasmoid.expanded)
                    val = Plasmoid.nativeInterface.getPowerMode()
            }
        }

        Item {
            height: 10
        }

        RowLayout {
            Layout.leftMargin: 10
            Layout.rightMargin: 35
            PlasmaCore.IconItem {
                source: "speedometer"
                Layout.alignment: Qt.AlignTop
                Layout.preferredWidth: PlasmaCore.Units.iconSizes.medium
                Layout.preferredHeight: PlasmaCore.Units.iconSizes.medium
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
                    Plasmoid.nativeInterface.setPowerMode(val)
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
