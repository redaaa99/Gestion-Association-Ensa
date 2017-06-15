#ifndef AJOUTDIPLOME_H
#define AJOUTDIPLOME_H

#include <QDialog>
#include <QtGui>
#include <QtSql>
#include <QDebug>
#include <QtCore>

namespace Ui {
class ajoutdiplome;
}

class ajoutdiplome : public QDialog
{
    Q_OBJECT

public:
    explicit ajoutdiplome(QWidget *parent = 0);
    explicit ajoutdiplome(QString id);
    QString m_id;
    ~ajoutdiplome();

private slots:
    void on_pushButton_clicked();

private:
    Ui::ajoutdiplome *ui;
};

#endif // AJOUTDIPLOME_H
