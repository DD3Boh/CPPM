#include "powermode.h"
#include <QFile>

#define filePath "/opt/powermodes/mode"

PowerMode::PowerMode()
{
    p_mode = readFileValue();
}

void PowerMode::setPowerMode(int value)
{
    QFile modeFile = QFile(filePath);
    bool ok;
    p_mode = value;
    char const *pchar = std::to_string(p_mode).c_str();

    modeFile.open(QIODevice::WriteOnly);
    modeFile.setPermissions(QFileDevice::ReadOwner | QFileDevice::WriteOwner |
                QFileDevice::ReadUser | QFileDevice::WriteUser |
                QFileDevice::ReadGroup | QFileDevice::WriteGroup |
                QFileDevice::ReadOther | QFileDevice::WriteOther);

    modeFile.write(pchar, qstrlen(pchar));
    modeFile.close();
}

const int PowerMode::getMode()
{
    return p_mode;
}

int PowerMode::readFileValue()
{
    QFile modeFile = QFile(filePath);
    bool ok;
    int rc = 0;

    if (modeFile.exists()) {
        if (!modeFile.open(QIODevice::ReadOnly | QIODevice::Text))
            return rc;

        QByteArray line = modeFile.readLine();
        rc = line.toInt(&ok, 10);
    }

    return rc;
}
