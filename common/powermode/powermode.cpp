/*
 *  SPDX-FileCopyrightText 2023 Davide Garberi <dade.garberi@gmail.com>
 *
 *  SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include "powermode.h"
#include <QFile>

#define filePath "/opt/cppm/mode"

enum {
    MODE_POWERSAVE = 1,
    MODE_BALANCED,
    MODE_PERFORMANCE
};

QString PowerMode::getModeString(int value)
{
    QString profile;

    switch (value) {
    case MODE_POWERSAVE:
        profile = QString("Powersave");
        break;

    case MODE_BALANCED:
        profile = QString("Balanced");
        break;

    case MODE_PERFORMANCE:
        profile = QString("Performance");
        break;

    default:
        break;
    }

    return profile;
}

void PowerMode::setPowerMode(int value)
{
    QFile modeFile = QFile(filePath);
    bool ok;
    std::string s = std::to_string(value);
    char const *pchar = s.c_str();

    modeFile.open(QIODevice::WriteOnly);
    modeFile.setPermissions(QFileDevice::ReadOwner | QFileDevice::WriteOwner |
                QFileDevice::ReadUser | QFileDevice::WriteUser |
                QFileDevice::ReadGroup | QFileDevice::WriteGroup |
                QFileDevice::ReadOther | QFileDevice::WriteOther);

    modeFile.write(pchar, qstrlen(pchar));
    modeFile.close();
}

int PowerMode::getPowerMode()
{
    QFile modeFile = QFile(filePath);
    bool ok;
    int rc = MODE_BALANCED;

    if (modeFile.exists()) {
        if (!modeFile.open(QIODevice::ReadOnly | QIODevice::Text))
            return rc;

        QByteArray line = modeFile.readLine();
        rc = line.toInt(&ok, 10);
    }

    if (rc > MODE_PERFORMANCE || rc < MODE_POWERSAVE)
        rc = MODE_BALANCED;

    return rc;
}
