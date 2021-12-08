#include <QDebug>

#include "motors.h"

Motors::Motors(QObject *parent)
    : QObject(parent)
    , m_waterLevel("Inicializando")
    , m_temperature("0")
{
//    QTimer *timer = new QTimer(this);
//    connect(timer, SIGNAL(timeout()), this, SLOT(leerHtml()));
//    timer->start(1000); //time specified in ms
}


           
//void Motors::setWaterLevel(QString str)
//{
//    msg = str;
//    emit waterLevelChanged();
//}

QString Motors::qWaterLevel()
{
    return m_waterLevel;
}

QString Motors::qTemperature()
{
    return m_temperature;
}

QString Motors::qHumidity()
{
    return m_humidity;
}

QString Motors::qYaw()
{
    return m_yaw;
}

QString Motors::qPos_X()
{
    return m_pos_X;
}

QString Motors::qPos_Y()
{
    return m_pos_Y;
}

QString Motors::qPos_Z()
{
    return m_pos_Z;
}

QString Motors::qAcc_X()
{
    return m_acc_X;
}

QString Motors::qAcc_Y()
{
    return m_acc_Y;
}

QString Motors::qAcc_Z()
{
    return m_acc_Z;
}

QString Motors::qVel_X()
{
    return m_vel_X;
}

QString Motors::qVel_Y()
{
    return m_vel_Y;
}

QString Motors::qVel_Z()
{
    return m_vel_Z;
}

QString Motors::qMag_X()
{
    return m_mag_X;
}

QString Motors::qMag_Y()
{
    return m_mag_Y;
}

QString Motors::qMag_Z()
{
    return m_mag_Z;
}

QString Motors::qLatitud()
{
    return m_latitud;
}

QString Motors::qLongitud()
{
    return m_longitud;
}

QString Motors::qCurrent()
{
    return m_current;
}

void Motors::setWaterLevel(QString newWaterLevel)
{
    if ( m_waterLevel != newWaterLevel)
    {
        m_waterLevel = newWaterLevel;
        emit waterLevelChanged();
    }
}

void Motors::setTemperature(QString newTemperature)
{
    if ( m_temperature != newTemperature)
    {
        m_temperature = newTemperature;
        emit temperatureChanged();
    }
}

void Motors::setHumidity(QString newHumidity)
{
    if ( m_humidity != newHumidity)
    {
        m_humidity = newHumidity;
        emit humidityChanged();
    }
}

void Motors::setYaw(QString newYaw)
{
    if ( m_yaw != newYaw)
    {
        m_yaw = newYaw;
        emit yawChanged();
    }
}

void Motors::setPos_X(QString newPos_X)
{
    if ( m_pos_X != newPos_X)
    {
        m_pos_X = newPos_X;
        emit pos_XChanged();
    }
}

void Motors::setPos_Y(QString newPos_Y)
{
    if ( m_pos_Y != newPos_Y)
    {
        m_pos_Y = newPos_Y;
        emit pos_YChanged();
    }
}

void Motors::setPos_Z(QString newPos_Z)
{
    if ( m_pos_Z != newPos_Z)
    {
        m_pos_Z = newPos_Z;
        emit pos_ZChanged();
    }
}

void Motors::setAcc_X(QString newAcc_X)
{
    if ( m_acc_X != newAcc_X)
    {
        m_acc_X = newAcc_X;
        emit acc_XChanged();
    }
}

void Motors::setAcc_Y(QString newAcc_Y)
{
    if ( m_acc_Y != newAcc_Y)
    {
        m_acc_Y = newAcc_Y;
        emit acc_YChanged();
    }
}

void Motors::setAcc_Z(QString newAcc_Z)
{
    if ( m_acc_Z != newAcc_Z)
    {
        m_acc_Z = newAcc_Z;
        emit acc_ZChanged();
    }
}

void Motors::setVel_X(QString newVel_X)
{
    if ( m_vel_X != newVel_X)
    {
        m_vel_X = newVel_X;
        emit vel_XChanged();
    }
}

void Motors::setVel_Y(QString newVel_Y)
{
    if ( m_vel_Y != newVel_Y)
    {
        m_vel_Y = newVel_Y;
        emit vel_YChanged();
    }
}

void Motors::setVel_Z(QString newVel_Z)
{
    if ( m_vel_Z != newVel_Z)
    {
        m_vel_Z = newVel_Z;
        emit vel_ZChanged();
    }
}

void Motors::setMag_X(QString newMag_X)
{
    if ( m_mag_X != newMag_X)
    {
        m_mag_X = newMag_X;
        emit mag_XChanged();
    }
}

void Motors::setMag_Y(QString newMag_Y)
{
    if ( m_mag_Y != newMag_Y)
    {
        m_mag_Y = newMag_Y;
        emit mag_YChanged();
    }
}

void Motors::setMag_Z(QString newMag_Z)
{
    if ( m_mag_Z != newMag_Z)
    {
        m_mag_Z = newMag_Z;
        emit mag_ZChanged();
    }
}

void Motors::setLatitud(QString newLatitud)
{
    if ( m_latitud != newLatitud)
    {
        m_latitud = newLatitud;
        emit latitudChanged();
    }
}

void Motors::setLongitud(QString newLongitud)
{
    if ( m_longitud != newLongitud)
    {
        m_longitud = newLongitud;
        emit longitudChanged();
    }
}

void Motors::setCurrent(QString newCurrent)
{
    if ( m_current != newCurrent)
    {
        m_current= newCurrent;
        emit currentChanged();
    }
}
