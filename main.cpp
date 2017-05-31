#include "mainwindow.h"
#include <QApplication>

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);
    MainWindow w;
    w.setWindowTitle("Association Ensa Marrakech");
    w.setFixedSize(368,388);
    w.show();

    return a.exec();
}
