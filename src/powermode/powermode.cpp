/*
 *  SPDX-FileCopyrightText 2023 Davide Garberi <dade.garberi@gmail.com>
 *
 *  SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include "powermode.h"
#include <QFile>

#define filePath "/opt/powermodes/mode"

enum {
    MODE_INVALID = 0,
    MODE_POWERSAVE,
    MODE_BALANCED,
    MODE_PERFORMANCE
};

PowerMode::PowerMode()
{
    p_mode = readFileValue();
}

void PowerMode::setPowerMode(int value)
{
    QFile modeFile = QFile(filePath);
    bool ok;
    p_mode = value;
    std::string s = std::to_string(p_mode);
    char const *pchar = s.c_str();

    modeFile.open(QIODevice::WriteOnly);
    modeFile.setPermissions(QFileDevice::ReadOwner | QFileDevice::WriteOwner |
                QFileDevice::ReadUser | QFileDevice::WriteUser |
                QFileDevice::ReadGroup | QFileDevice::WriteGroup |
                QFileDevice::ReadOther | QFileDevice::WriteOther);

    modeFile.write(pchar, qstrlen(pchar));
    modeFile.close();
}

int PowerMode::getMode() const
{
    return p_mode;
}

int PowerMode::readFileValue()
{
    QFile modeFile = QFile(filePath);
    bool ok;
    int rc = MODE_INVALID;

    if (modeFile.exists()) {
        if (!modeFile.open(QIODevice::ReadOnly | QIODevice::Text))
            return MODE_BALANCED;

        QByteArray line = modeFile.readLine();
        rc = line.toInt(&ok, 10);
    }

    if (rc > MODE_PERFORMANCE || rc < MODE_POWERSAVE)
        rc = MODE_INVALID;

    return rc;
}
