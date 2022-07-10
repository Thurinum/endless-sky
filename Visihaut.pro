QT = core quick quickcontrols2 qml xml

SOURCES += $$files("src/*.cpp", true)
HEADERS += $$files("include/*.hpp", true)
INCLUDEPATH += $$PWD/include

CONFIG += c++17 warn_on
DEFINES += QT_MESSAGELOGCONTEXT

TARGET = Visihaut
