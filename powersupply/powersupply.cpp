#include "powersupply.h"

PowerSupply::PowerSupply(QObject *parent)
    : QObject{parent}
{
m_voltage=111;
m_power=222;
}
