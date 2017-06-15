#include "ajoutdiplome.h"
#include "ui_ajoutdiplome.h"
#include <QDialog>
#include <QtGui>
#include <QtSql>
#include <QDebug>
#include <QMessageBox>
#include <QtCore>

ajoutdiplome::ajoutdiplome(QWidget *parent) :
    QDialog(parent),
    ui(new Ui::ajoutdiplome)
{
    ui->setupUi(this);

}

ajoutdiplome::ajoutdiplome(QString id) :
    ui(new Ui::ajoutdiplome)
{
    ui->setupUi(this);
    m_id = id;
    qDebug() << m_id;
}

ajoutdiplome::~ajoutdiplome()
{
    delete ui;
}

void ajoutdiplome::on_pushButton_clicked()
{
  QString diplome,depart,faculte,type,annee;
  diplome = ui->textEdit->toPlainText();
  depart = ui->textEdit_2->toPlainText();
  faculte = ui->textEdit_3->toPlainText();
  type = QString::number(ui->comboBox->currentIndex()+1);
  annee = ui->textEdit_4->toPlainText();

  if(diplome.isEmpty() || depart.isEmpty() || faculte.isEmpty() || type == "0")
  {
      QMessageBox msgBox;
      msgBox.setText("Erreur Champs invalides");
      msgBox.exec();
  }
  else
  {
      QSqlQuery queryfac;
      queryfac.prepare("INSERT INTO `faculte`(`NomFac`) VALUES (:faculte);");
      //INSERT INTO `faculte`(`NomFac`) VALUES ("test");
      //SELECT LAST_INSERT_ID();
      queryfac.bindValue(":faculte", faculte);
      if (!queryfac.exec()) {
          qDebug() << queryfac.lastError();
      } else {
          qDebug() << queryfac.executedQuery();
      }
      QSqlQueryModel querylastfac;
      querylastfac.setQuery("SELECT MAX(NumFac) FROM `faculte`;");
      QString lastidfac =  querylastfac.record(0).value(0).toString();
      qDebug() << lastidfac;


      QSqlQuery querydep;
      querydep.prepare("INSERT INTO `departement`(`NomDepartement`,`NumFac`) VALUES (:depart,:numfac);");
      querydep.bindValue(":depart", depart);
      querydep.bindValue(":numfac", lastidfac);
      if (!querydep.exec()) {
          qDebug() << querydep.lastError();
      } else {
          qDebug() << querydep.executedQuery();
      }
      QSqlQueryModel querylastdep;
      querylastdep.setQuery("SELECT MAX(NumDepartement) FROM `departement`;");
      QString lastiddep =  querylastdep.record(0).value(0).toString();

      QSqlQuery querydip;
      querydip.prepare("INSERT INTO `diplome`(`Type`,`NumCotisation`,`NumDepartement`) VALUES (:diplome,:numcoti,:numdep)");
      querydip.bindValue(":diplome", diplome);
      querydip.bindValue(":numcoti", type);
      querydip.bindValue(":numdep", lastiddep);
      if (!querydip.exec()) {
          qDebug() << querydip.lastError();
      } else {
          qDebug() << querydip.executedQuery();
      }
      QSqlQueryModel querylastdip;
      querylastdip.setQuery("SELECT MAX(NumDiplome) FROM `diplome`;");
      QString lastiddip =  querylastdip.record(0).value(0).toString();


      QSqlQuery queryobt;
      queryobt.prepare("INSERT INTO `obtention`(`NumMembre`,`NumDiplome`,`AnneeObtention`) VALUES (:NumMembre,:NumDiplome,:AnneeObtention)");
      queryobt.bindValue(":NumMembre", m_id);
      queryobt.bindValue(":NumDiplome", lastiddip);
      queryobt.bindValue(":AnneeObtention",annee);
      if (!queryobt.exec()) {
          qDebug() << queryobt.lastError();
      } else {
          qDebug() << queryobt.executedQuery();
      }


      QMessageBox msgBox;

      msgBox.setText("Bien!");
      msgBox.exec();
      this->close();
  }

}
