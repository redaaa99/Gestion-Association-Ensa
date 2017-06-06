#ifndef AJOUTMEMBRE_H
#define AJOUTMEMBRE_H

#include <QDialog>
#include <QtGui>
#include <QtSql>
#include <QDebug>
#include <QtCore>

namespace Ui {
class ajoutmembre;
}

class ajoutmembre : public QDialog
{
    Q_OBJECT

public:
    explicit ajoutmembre(QWidget *parent = 0);
    QSqlQueryModel *modelmembre;
    ~ajoutmembre();

private slots:
    void on_pushButton_clicked();

private:
    Ui::ajoutmembre *ui;
};

#endif // AJOUTMEMBRE_H
