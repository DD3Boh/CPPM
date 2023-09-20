/*
 *  SPDX-FileCopyrightText 2023 Davide Garberi <dade.garberi@gmail.com>
 *
 *  SPDX-License-Identifier: LGPL-2.1-or-later
 */

#ifndef POWERMODE_H
#define POWERMODE_H

#include <QObject>
#include <QDebug>

class PowerMode : public QObject
{
    Q_OBJECT

public:
    PowerMode() { };
    int getPowerMode();
    void setPowerMode(int value);
};

#endif // POWERMODE_H
