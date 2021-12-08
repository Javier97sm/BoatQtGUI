#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QSerialPort>
#include <QSerialPortInfo>
#include <QDebug>
#include <QQuickStyle>
#include <QQmlContext>
#include <QtQuickControls2>

#include <QNetworkAccessManager>
#include <QNetworkRequest>

#include <QtNetwork>
#include <functional>

#include <QGeoRoute>

#include "motors.h"

QQmlApplicationEngine *m_engine = nullptr;

/*void htmlGet(const QUrl &url, const std::function<void(const QString&)> &fun) {
   QScopedPointer<QNetworkAccessManager> manager(new QNetworkAccessManager);
   QNetworkReply *response = manager->get(QNetworkRequest(QUrl(url)));
   QObject::connect(response, &QNetworkReply::finished, [response, fun]{
      response->deleteLater();
      response->manager()->deleteLater();
      if (response->error() != QNetworkReply::NoError) return;
      auto const contentType =
            response->header(QNetworkRequest::ContentTypeHeader).toString();
      static QRegularExpression re("charset=([!-~]+)");
      auto const match = re.match(contentType);
      if (!match.hasMatch() || 0 != match.captured(1).compare("utf-8", Qt::CaseInsensitive)) {
         qWarning() << "Content charsets other than utf-8 are not implemented yet:" << contentType;
         return;
      }
      auto const html = QString::fromUtf8(response->readAll());
      fun(html); // do something with the data
   }) && manager.take();
}*/


int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);


    QQuickStyle::setStyle("Material"); //Style

    QQmlApplicationEngine engine;

    m_engine = &engine;

    //QQmlComponent component(&engine, "qrc:/main.qml");
    //QObject *object = component.create();

    //Motors
    Motors m_motors;
    engine.rootContext()->setContextProperty("dataClassQML", &m_motors);     //'engine.rootContext()' returns a pointer 'QQmlContext'. --setContextProperty("name of the qml variable","")   // NOTE: Inside a Class, the variables we have are called 'members', and the functions are called 'metods'.



    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);


//    QObject::connect(&m_motors, &Motors::readWaterLevel, [](const QString& line){     //Cuando se emite la signal 'readLineScript' de 'RunPrinterCreator::handleScriptOutput()', busca 'logObject' en los hijos (findChild) del main.qml
//        QMetaObject::invokeMethod(m_engine->rootObjects().value(0)->findChild<QObject*>("logObject"), "myQmlFunction", Q_ARG(QVariant,line)); //cast a QVariant: Q_ARG(QVariant,QVariant(line))
//        qDebug() << "mierdaa" + line;


//        //static QString outputLogs;
//        //outputLogs = line + "\n" + outputLogs;
//        //qDebug() << "OutputLogs: \n" + outputLogs;
//    });

//    QMetaObject::invokeMethod(m_engine->rootObjects().value(0)->findChild<QObject*>("logObject"), "myQmlFunction",
//            Q_ARG(QString, "msg"));


    //QQmlProperty::write(object, "waterLevel", 5000);

    engine.load(url);


    /*QNetworkAccessManager *manager = new QNetworkAccessManager();

    QUrl enlase = QUrl("http://192.168.1.154/=b?");
    qDebug() << "holeeeke; " << enlase;
    manager->get(QNetworkRequest(enlase));*/

    //htmlGet({enlase}, [](const QString &body){ qDebug() << body; qApp->quit(); });



    return app.exec();
}


