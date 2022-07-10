#include <QtQuick>
#include <QSettings>

#include "backend.hpp"

int main(int argc, char *argv[]) {
	QGuiApplication app(argc, argv);
	QGuiApplication::setApplicationName("Visihaut");
	QGuiApplication::setWindowIcon(QIcon("resources/graphics/favicon.png"));

	Backend backend;

	// Force enable multisampling AA
	// Causes missing stencil buffer error but we aren't drawing 3D
	// so it should be fine...
	// QSurfaceFormat format;
	// format.setSamples(16);

	QQuickView view;
	int viewSize = backend.config("Display/iSize").toInt();
	QQmlEngine* engine   = view.engine();

	engine->rootContext()->setContextProperty("vsh", &backend);
	engine->rootContext()->setContextProperty("vsh_viewSize", viewSize);

	view.setSource(QString("resources/interface/Main.qml"));
	view.setWidth(viewSize);
	view.setHeight(viewSize);
	view.setMaximumWidth(viewSize);
	view.setMaximumHeight(viewSize);
	view.setMinimumWidth(viewSize);
	view.setMinimumHeight(viewSize);
	
	// view.setFormat(format);

	view.show();

	return QGuiApplication::exec();
}
