/*
 *   SPDX-FileCopyrightText: 2023 Davide Garberi <dade.garberi@gmail.com>
 *
 *   SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include "plasmaPowermodes.h"

#include <KLocalizedString>

plasmaPowermodes::plasmaPowermodes(QObject *parent, const KPluginMetaData &data, const QVariantList &args)
    : Plasma::Applet(parent, data, args)
{
}

plasmaPowermodes::~plasmaPowermodes()
{
}

int plasmaPowermodes::getPowerMode()
{
    return powermode.getPowerMode();
}

void plasmaPowermodes::setPowerMode(int value)
{
    powermode.setPowerMode(value);
}

QString plasmaPowermodes::getModeString(int value)
{
    return powermode.getModeString(value);
}

K_PLUGIN_CLASS(plasmaPowermodes)

#include "plasmaPowermodes.moc"
#include "moc_plasmaPowermodes.cpp"
