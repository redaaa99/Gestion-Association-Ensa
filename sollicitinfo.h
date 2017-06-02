#ifndef SOLLICITINFO_H
#define SOLLICITINFO_H

#include <QDialog>
#include <QtGui>
#include <QtSql>
#include <QDebug>
#include <QtCore>

namespace Ui {
class sollicitinfo;
}

class sollicitinfo : public QDialog
{
    Q_OBJECT

public:
    explicit sollicitinfo(QWidget *parent = 0);
    explicit sollicitinfo(QString indanneecompagne,QString indnumfich);
    QSqlQueryModel *modeldiplom;
    QSqlQueryModel *modelorganism;
    ~sollicitinfo();

private:
    Ui::sollicitinfo *ui;
};

#endif // SOLLICITINFO_H
