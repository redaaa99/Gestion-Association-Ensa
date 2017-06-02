#include "mainwindow.h"
#include <QApplication>

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);
    MainWindow w;
    w.setWindowTitle("Association Ensa Marrakech");
    w.setWindowIcon(QIcon("C:/Users/mohammed/Desktop/Projetbdd/marrakech.png"));
    w.setFixedSize(502,358);
    w.show();

    return a.exec();
}
