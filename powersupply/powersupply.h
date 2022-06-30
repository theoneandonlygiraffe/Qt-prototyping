#ifndef POWERSUPPLY_H
#define POWERSUPPLY_H

#include <QObject>
#include <iostream>
#include <QtCore/qmath.h>
#include <stdlib.h>

class PowerSupply : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int power READ power WRITE setPower NOTIFY powerChanged)
    Q_PROPERTY(int maxpower READ maxpower WRITE setMaxpower NOTIFY maxpowerChanged)
    Q_PROPERTY(int voltage READ voltage WRITE setVoltage NOTIFY voltageChanged)
    Q_PROPERTY(int current READ current WRITE setCurrent NOTIFY currentChanged)

    int m_power;
    int m_maxpower;
    int m_voltage;
    int m_current;


public:
    explicit PowerSupply(QObject *parent = nullptr);
    // get
    int power(){return m_power/1000000;}; //selbe wie unten. hier nur in Ausgabe
    int maxpower(){return m_maxpower/1000000;}; //Ausgabe uns setzen in W (rechen in mW) hinweis: 10^-3*10^-3=10^-6
    int voltage(){return m_voltage;};
    int current(){return m_current;};

    //set
    void setVoltage(int v){
        if(v==m_voltage){return;}

        if((m_current*v)>m_maxpower){
            int needed_current=m_maxpower/v;

            if (needed_current<=0){emit voltageChanged(); return;};

            setCurrent(needed_current);

        }

        m_voltage = v;
        setPower(voltage()*current());
        emit voltageChanged();
        std::cout<<"voltage:"<<m_voltage<<std::endl;
    };
    void setCurrent(int i){
        if(i==m_current){return;}

        if((m_voltage*i)>m_maxpower){
            int needed_voltage=m_maxpower/i;

            if (needed_voltage<=0){emit currentChanged();return;};

            setVoltage(needed_voltage);

        }

        m_current = i;
        setPower(voltage()*current());
        emit currentChanged();
        std::cout<<"current:"<<m_current<<std::endl;
    };

    void setPower(int p){
        if(p==m_power){return;}



        m_power = p;
        emit powerChanged();
        std::cout<<"power:"<<m_power<<std::endl;
    };
    void setMaxpower(int mp){
        if(mp==m_maxpower/1000000){return;}

        if(m_current*m_voltage>mp*1000000){
            int v=m_voltage;
            int i=m_current;

            while(v*i>mp*1000000){
                v=v-1;
                i=i-1;
            }

            setVoltage(v);
            setCurrent(i);
        }

        m_maxpower = mp*1000000;
        emit maxpowerChanged();
        std::cout<<"maxpower:"<<m_maxpower<<std::endl;
    };



signals:
    // changing
    void powerChanged();
    void voltageChanged();
    void currentChanged();
    void maxpowerChanged();

};

#endif // POWERSUPPLY_H
