/*
 *   SPDX-FileCopyrightText: 2023 Davide Garberi <dade.garberi@gmail.com>
 *
 *   SPDX-License-Identifier: LGPL-2.1-or-later
 */

#ifndef PLASMA_POWERMODES_H
#define PLASMA_POWERMODES_H

#include <Plasma/Applet>
#include "powermode.h"

class plasmaPowermodes : public Plasma::Applet
{
    Q_OBJECT

public:
    explicit plasmaPowermodes(QObject *parent, const KPluginMetaData &data, const QVariantList &args);
    ~plasmaPowermodes();
    Q_INVOKABLE int getPowerMode();

private:
    PowerMode powermode;
};

#endif
