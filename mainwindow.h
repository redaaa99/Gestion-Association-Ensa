#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <QtGui>
#include <QtSql>
#include <QDebug>
#include <QtCore>
#include "membreinfo.h"

namespace Ui {
class MainWindow;
}

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    explicit MainWindow(QWidget *parent = 0);
    QSqlQueryModel *model;
    QSqlQueryModel *modelsollicit;
    QSqlDatabase db;
    ~MainWindow();

private slots:

    void on_tableView_doubleClicked(const QModelIndex &index);

private:
    Ui::MainWindow *ui;

};

#endif // MAINWINDOW_H
