#ifndef VISIHAUT_BACKEND
#define VISIHAUT_BACKEND

#include <iostream>
#include <string>

#include <QObject>
#include <QSettings>
#include <QDebug>

// Backend class used for interacting with qml
class Backend : public QObject {
	Q_OBJECT
public:
	explicit Backend (QObject* parent = nullptr) : QObject(parent) {}
	
	// Get INI setting from QML
	Q_INVOKABLE QVariant config(QString key, QVariant fallback="");
	Q_INVOKABLE void setConfig(QString key, QVariant value);
};

#endif // AGENDUM_BACKEND
