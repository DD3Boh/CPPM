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
    PowerMode();
    const int getMode();

public slots:
    void setPowerMode(int value);

private:
    int p_mode;
    int readFileValue();
};

#endif // POWERMODE_H
