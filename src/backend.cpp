#include "backend.hpp"

QVariant Backend::config(QString key, QVariant fallback) {
	QSettings settings("Visihaut.ini", QSettings::IniFormat);
	
	// qDebug() << key << ":" << settings.value(key);
	
	if (settings.contains(key)) {
		return settings.value(key);
	}

	return fallback;
}

void Backend::setConfig(QString key, QVariant value) {
	QSettings settings("Visihaut.ini", QSettings::IniFormat);
	settings.setValue(key, value);
}
