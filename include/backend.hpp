#ifndef VISIHAUT_BACKEND
#define VISIHAUT_BACKEND

#include <iostream>
#include <string>

#include <QDebug>
#include <QObject>
#include <QSettings>

// Backend class used for interacting with qml
class Backend : public QObject
{
	Q_OBJECT
public:
	explicit Backend(QObject* parent = nullptr) : QObject(parent) {
		m_settings		    = new QSettings("Visihaut.ini", QSettings::IniFormat);
		m_shouldPrintSettings = config("Debug/bPrintSettings").toBool();
	}

	// Get INI setting from QML
	Q_INVOKABLE QVariant config(const QString& key);
	Q_INVOKABLE void	   setConfig(const QString& key, const QVariant& value);

private:
	QSettings* m_settings;
	bool	     m_shouldPrintSettings = false;
};

#endif // VISIHAUT_BACKEND
