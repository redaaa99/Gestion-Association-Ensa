#include "membreinfo.h"
#include "ui_membreinfo.h"
#include "mainwindow.h"



Membreinfo::Membreinfo(QWidget *parent) :
    QDialog(parent),
    ui(new Ui::Membreinfo)
{
    ui->setupUi(this);
}

Membreinfo::Membreinfo(int indexm):ui(new Ui::Membreinfo)
{
    ui->setupUi(this);
    this->modelpersonne=  new QSqlQueryModel();
    modelpersonne->setQuery("SELECT NumMembre,NomMembre,PrenomMembre,TelMembre,DateNaiss,Adresse,membreCA,membreex FROM `membre` WHERE NumMembre = "+QString::number(indexm));
    QString Nom = modelpersonne->record(0).value(1).toString();
    QString Prenom = modelpersonne->record(0).value(2).toString();
    QString Tel = modelpersonne->record(0).value(3).toString();
    QString DateNaiss = modelpersonne->record(0).value(4).toString();
    QString Adresse = modelpersonne->record(0).value(5).toString();
    bool membreCA = modelpersonne->record(0).value(6).toBool();
    bool membreEx = modelpersonne->record(0).value(7).toBool();
    ui->label->setText("N° Diplomé: "+QString::number(indexm));
    ui->label_2->setText("Nom Prenom: "+Nom+" "+Prenom);
    ui->label_3->setText("Numéro Telephone: "+Tel);
    ui->label_4->setText("Date de Naissance: "+DateNaiss);
    ui->label_5->setText("Adresse : "+Adresse);
    ui->checkBox->setEnabled(false);
    ui->checkBox_2->setEnabled(false);
    if(membreCA)
    {
        ui->checkBox->setChecked(1);
    }
    if(membreEx)
    {
        ui->checkBox_2->setChecked(1);
    }
    modelpersonne->setQuery("SELECT Type as Diplome,AnneeObtention as 'Année Obtention',NomFac as 'Faculté',NomDepartement as 'Département' FROM `membre`,`obtention`,`diplome`,`departement`,`faculte` WHERE (membre.NumMembre=obtention.NumMembre && diplome.Numdiplome = obtention.Numdiplome && diplome.Numdepartement=departement.Numdepartement && departement.NumFac=faculte.NumFac && membre.NumMembre= "+QString::number(indexm)+")");
    ui->tableView->setModel(modelpersonne);
    ui->tableView->resizeColumnsToContents();
    ui->tableView->resizeRowsToContents();
    ui->tableView->horizontalHeader()->setSectionResizeMode(QHeaderView::Stretch);
    ui->tableView->verticalHeader()->setVisible(false);
    this->modelvers=  new QSqlQueryModel();
    modelvers->setQuery("SELECT AnneeVersement as 'Annee Versement',MontantAnn as 'Montant annuel',MontantVersement as 'Montant Versement',DateVersement as Date FROM `membre`,`obtention`,`diplome`,`departement`,`faculte`,`versement`,`cotisations` WHERE (membre.NumMembre=obtention.NumMembre && diplome.Numdiplome = obtention.Numdiplome && diplome.Numdepartement=departement.Numdepartement && departement.NumFac=faculte.NumFac && membre.NumMembre=versement.NumMembre && diplome.NumCotisation=cotisations.NumCotisation && membre.NumMembre ="+QString::number(indexm)+") GROUP BY AnneeVersement");
    ui->tableView_2->setModel(modelvers);
    ui->tableView_2->resizeColumnsToContents();
    ui->tableView_2->resizeRowsToContents();
    ui->tableView_2->horizontalHeader()->setSectionResizeMode(QHeaderView::Stretch);
    ui->tableView_2->verticalHeader()->setVisible(false);
}

Membreinfo::~Membreinfo()
{
    delete ui;
}
