#include "ajoutmembre.h"
#include "ui_ajoutmembre.h"
#include "mainwindow.h"
#include <QMessageBox>

ajoutmembre::ajoutmembre(QWidget *parent) :
    QDialog(parent),
    ui(new Ui::ajoutmembre)
{
    ui->setupUi(this);
    ui->textEdit_4->setPlaceholderText("AAAA-MM-JJ");
}

ajoutmembre::~ajoutmembre()
{
    delete ui;
}

void ajoutmembre::on_pushButton_clicked()
{
    QString nom,prenom,tel,date,adresse;
    int mCa,mEx;
    nom =  ui->textEdit->toPlainText();
    prenom =  ui->textEdit_2->toPlainText();
    tel =  ui->textEdit_3->toPlainText();
    date = ui->textEdit_4->toPlainText();
    adresse =  ui->textEdit_5->toPlainText();
    mCa = ui->checkBox->isChecked();
    mEx = ui->checkBox_2->isChecked();
    if(nom.isEmpty() || prenom.isEmpty() || tel.isEmpty() || date.isEmpty()  || adresse.isEmpty())
    {
        QMessageBox msgBox;
        msgBox.setText("Erreur Champs invalides");
        msgBox.exec();
    }
    else
    {
        QSqlQuery query;
        query.prepare("INSERT INTO `membre`(`NomMembre`, `PrenomMembre`, `TelMembre`, `DateNaiss`, `Adresse`, `membreCA`, `membreex`) VALUES (:nom,:prenom,:tel,:date,:adresse,:mCa,:mEx)");
        query.bindValue(":nom", nom);
        query.bindValue(":prenom", prenom);
        query.bindValue(":tel", tel);
        query.bindValue(":date", date);
        query.bindValue(":adresse", adresse);
        query.bindValue(":mCa", mCa);
        query.bindValue(":mEx", mEx);

        if (!query.exec()) {
            qDebug() << query.lastError();
        } else {
            qDebug() << query.executedQuery();
        }
        //modelmembre->setQuery("INSERT INTO `membre`(`NomMembre`, `PrenomMembre`, `TelMembre`, `DateNaiss`, `Adresse`, `membreCA`, `membreex`) VALUES ('"+nom+"','"+prenom+"','"+tel+"','"+date+"','"+adresse+"',"+mCa+","+mEx+")");
        //qDebug() << modelmembre->lastError();
        QMessageBox msgBox;

        msgBox.setText("Bien!");
        msgBox.exec();
        this->close();
    }

}
