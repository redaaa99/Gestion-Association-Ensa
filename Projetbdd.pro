#-------------------------------------------------
#
# Project created by QtCreator 2017-05-31T15:51:42
#
#-------------------------------------------------

QT       += core gui
QT       += sql

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = Projetbdd
TEMPLATE = app


SOURCES += main.cpp\
        mainwindow.cpp \
    membreinfo.cpp \
    sollicitinfo.cpp

HEADERS  += mainwindow.h \
    membreinfo.h \
    sollicitinfo.h

FORMS    += mainwindow.ui \
    membreinfo.ui \
    sollicitinfo.ui

RESOURCES += \
    ressources.qrc

