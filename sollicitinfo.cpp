#include "sollicitinfo.h"
#include "ui_sollicitinfo.h"
#include "mainwindow.h"

sollicitinfo::sollicitinfo(QWidget *parent) :
    QDialog(parent),
    ui(new Ui::sollicitinfo)
{
    ui->setupUi(this);
}

sollicitinfo::sollicitinfo(QString indanneecompagne,QString indnumfich) :
    ui(new Ui::sollicitinfo)
{

    ui->setupUi(this);
    this->modeldiplom=  new QSqlQueryModel();
    this->modelorganism=  new QSqlQueryModel();
    modeldiplom->setQuery("SELECT NumFicheSollicit,NomMembre,PrenomMembre,AnneeCampagne,DateDeb,DateFin,NumMembre FROM `sollicitation`,`campagne`,`membre` WHERE (sollicitation.NumMembreSolliciteur=membre.NumMembre && sollicitation.NumCampagne=campagne.NumCampagne && campagne.AnneeCampagne = "+indanneecompagne+" && NumFicheSollicit = "+indnumfich+")");
    QString numfich =  modeldiplom->record(0).value(0).toString();
    QString nomsollicit =  modeldiplom->record(0).value(1).toString();
    QString prenomsollicit =  modeldiplom->record(0).value(2).toString();
    QString AnneeCampagne =  modeldiplom->record(0).value(3).toString();
    QString  datedeb=  modeldiplom->record(0).value(4).toString();
    QString  datefin=  modeldiplom->record(0).value(5).toString();
    QString nummembresollciteur = modeldiplom->record(0).value(6).toString();
    ui->label->setText("N° Fiche: "+numfich);
    ui->label_3->setText("Solliciteur: "+nomsollicit+" "+prenomsollicit);
    ui->label_2->setText("Annnée Campagne:"+AnneeCampagne);
    ui->label_5->setText("Debut: "+datedeb);
    ui->label_6->setText("Fin: "+datefin);
    modeldiplom->setQuery("SELECT NomMembre as Nom,DateSollicit as DateSol,TelMembre as Telephone,MontantVersement as 'Montant(DHS)',DateVersement as 'Date Versement' FROM `sollicitation`,`campagne`,`membre`,`versement` WHERE (sollicitation.NumMembreSolliciteur="+nummembresollciteur+"&& sollicitation.NumMembreSollicitee=membre.NumMembre && versement.NumMembre = sollicitation.NumMembreSollicitee) GROUP BY NomMembre ");
    ui->tableView->setModel(modeldiplom);
    ui->tableView->horizontalHeader()->setSectionResizeMode(QHeaderView::Stretch);
    ui->tableView->verticalHeader()->setVisible(false);
    modelorganism->setQuery("SELECT NomOrganisme as Organisme,DateSollicit as DateSol,TelMembre as Telephone,MontantVersement as 'Montant(DHS)' ,DateVersement as 'Date Versement' FROM `sollicitation`,`campagne`,`membre`,`versement`,`organisme` WHERE (sollicitation.NumMembreSolliciteur="+nummembresollciteur+" && sollicitation.Numorganisme = organisme.NumOrganisme) GROUP BY NomOrganisme");
    ui->tableView_2->setModel(modelorganism);
    ui->tableView_2->horizontalHeader()->setSectionResizeMode(QHeaderView::Stretch);
    ui->tableView_2->verticalHeader()->setVisible(false);
}

sollicitinfo::~sollicitinfo()
{
    delete ui;
}
