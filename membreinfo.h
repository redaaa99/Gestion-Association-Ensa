#ifndef MEMBREINFO_H
#define MEMBREINFO_H

#include <QDialog>
#include <QtGui>
#include <QtSql>
#include <QDebug>
#include <QtCore>

namespace Ui {
class Membreinfo;
}

class Membreinfo : public QDialog
{
    Q_OBJECT

public:
    explicit Membreinfo(QWidget *parent = 0);
    explicit Membreinfo(int indexm);
    QSqlQueryModel *modelpersonne;
    QSqlQueryModel *modelvers;

    ~Membreinfo();

private:
    Ui::Membreinfo *ui;
};

#endif // MEMBREINFO_H
