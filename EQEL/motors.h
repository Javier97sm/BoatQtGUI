#ifndef MOTORS_H
#define MOTORS_H

#include <QObject>
#include <QDebug>
#include <QNetworkAccessManager>
#include <QNetworkRequest>

#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include <QQuickStyle>
#include <QQmlContext>
#include <QtQuickControls2>




class Motors : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString qWaterLevel READ qWaterLevel WRITE setWaterLevel NOTIFY waterLevelChanged)
    Q_PROPERTY(QString qTemperature READ qTemperature WRITE setTemperature NOTIFY temperatureChanged)
    Q_PROPERTY(QString qHumidity READ qHumidity WRITE setHumidity NOTIFY humidityChanged)
    Q_PROPERTY(QString qYaw READ qYaw WRITE setYaw NOTIFY yawChanged)
    Q_PROPERTY(QString qPos_X READ qPos_X WRITE setPos_X NOTIFY pos_XChanged)
    Q_PROPERTY(QString qPos_Y READ qPos_Y WRITE setPos_Y NOTIFY pos_YChanged)
    Q_PROPERTY(QString qPos_Z READ qPos_Z WRITE setPos_Z NOTIFY pos_ZChanged)
    Q_PROPERTY(QString qAcc_X READ qAcc_X WRITE setAcc_X NOTIFY acc_XChanged)
    Q_PROPERTY(QString qAcc_Y READ qAcc_Y WRITE setAcc_Y NOTIFY acc_YChanged)
    Q_PROPERTY(QString qAcc_Z READ qAcc_Z WRITE setAcc_Z NOTIFY acc_ZChanged)
    Q_PROPERTY(QString qVel_X READ qVel_X WRITE setVel_X NOTIFY vel_XChanged)
    Q_PROPERTY(QString qVel_Y READ qVel_Y WRITE setVel_Y NOTIFY vel_YChanged)
    Q_PROPERTY(QString qVel_Z READ qVel_Z WRITE setVel_Z NOTIFY vel_ZChanged)
    Q_PROPERTY(QString qMag_X READ qMag_X WRITE setMag_X NOTIFY mag_XChanged)
    Q_PROPERTY(QString qMag_Y READ qMag_Y WRITE setMag_Y NOTIFY mag_YChanged)
    Q_PROPERTY(QString qMag_Z READ qMag_Z WRITE setMag_Z NOTIFY mag_ZChanged)
    Q_PROPERTY(QString qLatitud READ qLatitud WRITE setLatitud NOTIFY latitudChanged)
    Q_PROPERTY(QString qLongitud READ qLongitud WRITE setLongitud NOTIFY longitudChanged)
    Q_PROPERTY(QString qCurrent READ qCurrent WRITE setCurrent NOTIFY currentChanged)


public:
    explicit Motors(QObject *parent = nullptr);


    //Variables
    QString message = "";
    QString waterLevel = "0";
    QString temperature = "0";
    QString humidity = "0";
    QString yaw = "0";
    QString pos_X = "0";
    QString pos_Y = "0";
    QString pos_Z = "0";
    QString acc_X = "0";
    QString acc_Y = "0";
    QString acc_Z = "0";
    QString vel_X = "0";
    QString vel_Y = "0";
    QString vel_Z = "0";
    QString mag_X = "0";
    QString mag_Y = "0";
    QString mag_Z = "0";
    QString latitud = "0";
    QString longitud = "0";
    QString current = "0";

//    QString getWaterLevel() const;

    QString qWaterLevel();
    QString qTemperature();
    QString qHumidity();
    QString qYaw();
    QString qPos_X();
    QString qPos_Y();
    QString qPos_Z();
    QString qAcc_X();
    QString qAcc_Y();
    QString qAcc_Z();
    QString qVel_X();
    QString qVel_Y();
    QString qVel_Z();
    QString qMag_X();
    QString qMag_Y();
    QString qMag_Z();
    QString qLatitud();
    QString qLongitud();
    QString qCurrent();

    QString ip = "192.168.1.100";
    int i = 0;


public slots:
    //void setMotorCode(const QString& motorCode) { m_motorCode = motorCode; emit motorCodeChanged(); }


    void setIP(QString ipText)
    {
        ip = ipText;
        qDebug() << "IP is: " << ip;
    }

    void buttonClicked(QString in)
    {
        qDebug() << "buttonClicked" << in;



        QNetworkAccessManager *manager = new QNetworkAccessManager();
        QUrl enlase;

        if (in == "a") {
            enlase = QUrl("http://" + ip + "/=a?");
            manager->get(QNetworkRequest(enlase));
            qDebug() << "La ip es: " << enlase;
        }

        if (in == "b") {
            enlase = QUrl("http://" + ip + "/=b?");
            manager->get(QNetworkRequest(enlase));
            qDebug() << "La ip es: " << enlase;
        }

        if (in == "l") {
            enlase = QUrl("http://" + ip + "/=l?");
            manager->get(QNetworkRequest(enlase));
            qDebug() << "La ip es: " << enlase;
        }

        if (in == "r") {
            enlase = QUrl("http://" + ip + "/=r?");
            manager->get(QNetworkRequest(enlase));
            qDebug() << "La ip es: " << enlase;
        }

        if (in == "s") {
            enlase = QUrl("http://" + ip + "/=s?");
            manager->get(QNetworkRequest(enlase));
            qDebug() << "La ip es: " << enlase;
        }
    }

    void leerHtml() {
        QNetworkAccessManager manager;
        //QNetworkRequest request(QUrl("http://192.168.1.100"));
        QNetworkRequest request(QUrl("http://" + ip));
        QNetworkReply *reply(manager.get(request));
        QEventLoop loop;
        QObject::connect(reply, SIGNAL(finished()), &loop, SLOT(quit()));
        loop.exec();
        //qDebug(reply->readAll());
        message = reply->readAll();
        messageParser(message);
    }

    void messageParser(QString message) {
        qDebug() << message;
        i++;

        //Regex expressions
        QRegularExpression waterLevelExp("((?<=Level: )(.*)(?=Temp))");
        QRegularExpression temperatureExp("((?<=Temperature: )(.*)(?=Hum))");
        QRegularExpression humidityExp("((?<=Humidity: )(.*)(?=yaw))");
        QRegularExpression yawExp("((?<=yaw: )(.*)(?=pos_X))");
        QRegularExpression pos_XExp("((?<=pos_X: )(.*)(?=pos_Y))");
        QRegularExpression pos_YExp("((?<=pos_Y: )(.*)(?=pos_Z))");
        QRegularExpression pos_ZExp("((?<=pos_Z: )(.*)(?=acc_X))");
        QRegularExpression acc_XExp("((?<=acc_X: )(.*)(?=acc_Y))");
        QRegularExpression acc_YExp("((?<=acc_Y: )(.*)(?=acc_Z))");
        QRegularExpression acc_ZExp("((?<=acc_Z: )(.*)(?=vel_X))");
        QRegularExpression vel_XExp("((?<=vel_X: )(.*)(?=vel_Y))");
        QRegularExpression vel_YExp("((?<=vel_Y: )(.*)(?=vel_Z))");
        QRegularExpression vel_ZExp("((?<=vel_Z: )(.*)(?=mag_x))");
        QRegularExpression mag_XExp("((?<=mag_x: )(.*)(?=mag_y))");
        QRegularExpression mag_YExp("((?<=mag_y: )(.*)(?=mag_z))");
        QRegularExpression mag_ZExp("((?<=mag_z: )(.*)(?=Latit))");
        QRegularExpression latitudExp("((?<=Latitud: )(.*)(?=Long))");
        QRegularExpression longitudExp("((?<=Longitud: )(.*)(?=Curre))");
        QRegularExpression currentExp("((?<=Current: )(.*)(?=A))");

        //Regex matches
        QRegularExpressionMatch waterLevelMatch = waterLevelExp.match(message);
        waterLevel = waterLevelMatch.captured(0);

        QRegularExpressionMatch temperatureMatch = temperatureExp.match(message);
        temperature = temperatureMatch.captured(0);

        QRegularExpressionMatch humidityMatch = humidityExp.match(message);
        humidity = humidityMatch.captured(0);

        QRegularExpressionMatch yawMatch = yawExp.match(message);
        yaw = yawMatch.captured(0);

        QRegularExpressionMatch pos_XMatch = pos_XExp.match(message);
        pos_X = pos_XMatch.captured(0);

        QRegularExpressionMatch pos_YMatch = pos_YExp.match(message);
        pos_Y = pos_YMatch.captured(0);

        QRegularExpressionMatch pos_ZMatch = pos_ZExp.match(message);
        pos_Z = pos_ZMatch.captured(0);

        QRegularExpressionMatch acc_XMatch = acc_XExp.match(message);
        acc_X = acc_XMatch.captured(0);

        QRegularExpressionMatch acc_YMatch = acc_YExp.match(message);
        acc_Y = acc_YMatch.captured(0);

        QRegularExpressionMatch acc_ZMatch = acc_ZExp.match(message);
        acc_Z = acc_ZMatch.captured(0);

        QRegularExpressionMatch vel_XMatch = vel_XExp.match(message);
        vel_X = vel_XMatch.captured(0);

        QRegularExpressionMatch vel_YMatch = vel_YExp.match(message);
        vel_Y = vel_YMatch.captured(0);

        QRegularExpressionMatch vel_ZMatch = vel_ZExp.match(message);
        vel_Z = vel_ZMatch.captured(0);

        QRegularExpressionMatch mag_XMatch = mag_XExp.match(message);
        mag_X = mag_XMatch.captured(0);

        QRegularExpressionMatch mag_YMatch = mag_YExp.match(message);
        mag_Y = mag_YMatch.captured(0);

        QRegularExpressionMatch mag_ZMatch = mag_ZExp.match(message);
        mag_Z = mag_ZMatch.captured(0);

        QRegularExpressionMatch latitudMatch = latitudExp.match(message);
        latitud = latitudMatch.captured(0);

        QRegularExpressionMatch longitudMatch = longitudExp.match(message);
        longitud = longitudMatch.captured(0);

        QRegularExpressionMatch currentMatch = currentExp.match(message);
        current = currentMatch.captured(0);


        qDebug() << "\n\n/////////";

        qDebug() << waterLevel;
        qDebug() << temperature;
        qDebug() << humidity;
        qDebug() << yaw;
        qDebug() << pos_X;
        qDebug() << pos_Y;
        qDebug() << pos_Z;
        qDebug() << acc_X;
        qDebug() << acc_Y;
        qDebug() << acc_Z;
        qDebug() << vel_X;
        qDebug() << vel_Y;
        qDebug() << vel_Z;
        qDebug() << mag_X;
        qDebug() << mag_Y;
        qDebug() << mag_Z;
        qDebug() << latitud;
        qDebug() << longitud;
        qDebug() << current;
        qDebug() << i;

        qDebug() << "\n\n/////////";


//        QMetaObject::invokeMethod(engine.rootObjects().value(0)->findChild<QObject*>("logObject"), "myQmlFunction",
//                Q_ARG(QString, waterLevel));
        setWaterLevel(waterLevel);
        setTemperature(temperature);
        setHumidity(humidity);
        setYaw(yaw);
        setPos_X(pos_X);
        setPos_Y(pos_Y);
        setPos_Z(pos_Z);
        setAcc_X(acc_X);
        setAcc_Y(acc_Y);
        setAcc_Z(acc_Z);
        setVel_X(vel_X);
        setVel_Y(vel_Y);
        setVel_Z(vel_Z);
        setMag_X(mag_X);
        setMag_Y(mag_Y);
        setMag_Z(mag_Z);
        setLatitud(latitud);
        setLongitud(longitud);
        setCurrent(current);

    }

    void setWaterLevel(QString);
    void setTemperature(QString);
    void setHumidity(QString);
    void setYaw(QString);
    void setPos_X(QString);
    void setPos_Y(QString);
    void setPos_Z(QString);
    void setAcc_X(QString);
    void setAcc_Y(QString);
    void setAcc_Z(QString);
    void setVel_X(QString);
    void setVel_Y(QString);
    void setVel_Z(QString);
    void setMag_X(QString);
    void setMag_Y(QString);
    void setMag_Z(QString);
    void setLatitud(QString);
    void setLongitud(QString);
    void setCurrent(QString);

signals:
    void motorCodeChanged();

    //void readWaterLevel(const QString&);
    void waterLevelChanged();
    void temperatureChanged();
    void humidityChanged();
    void yawChanged();
    void pos_XChanged();
    void pos_YChanged();
    void pos_ZChanged();
    void acc_XChanged();
    void acc_YChanged();
    void acc_ZChanged();
    void vel_XChanged();
    void vel_YChanged();
    void vel_ZChanged();
    void mag_XChanged();
    void mag_YChanged();
    void mag_ZChanged();
    void latitudChanged();
    void longitudChanged();
    void currentChanged();

private:
    QString m_motorCode;
    QString m_waterLevel;
    QString m_temperature;
    QString m_humidity;
    QString m_yaw;
    QString m_pos_X;
    QString m_pos_Y;
    QString m_pos_Z;
    QString m_acc_X;
    QString m_acc_Y;
    QString m_acc_Z;
    QString m_vel_X;
    QString m_vel_Y;
    QString m_vel_Z;
    QString m_mag_X;
    QString m_mag_Y;
    QString m_mag_Z;
    QString m_latitud;
    QString m_longitud;
    QString m_current;

};

#endif // MOTORS_H
