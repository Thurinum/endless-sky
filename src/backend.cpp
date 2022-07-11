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

QPoint Backend::getRange(const QString& key) {
	QString base  = "Limits/" + key.split('/')[0] + "_" + key.split('/')[1] + "_";
	QPoint  range = {config(base + "Min").toInt(), config(base + "Max").toInt()};

	if (range.x() == range.y())
		qWarning() << "Slider " << key << " may have an invalid range. Is it specified in INI file?";

	return range;
}
