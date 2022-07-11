#include "backend.hpp"

QVariant Backend::config(const QString& key) {
	if (m_shouldPrintSettings)
		qDebug() << key << ":" << m_settings->value(key);

	QVariant val = m_settings->contains(key) ? m_settings->value(key) : QVariant("INVALID");

	// qml cannot implicitly convert string to bool
	if (val.toString() == "false")
		val = QVariant(false);

	return val;
}

void Backend::setConfig(const QString& key, const QVariant& value) {
	m_settings->setValue(key, value);
}
