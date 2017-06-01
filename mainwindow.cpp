#include "mainwindow.h"
#include "ui_mainwindow.h"

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    db = QSqlDatabase::addDatabase("QMYSQL");
    db.setHostName("localhost");
    db.setUserName("root");
    db.setPassword("");
    db.setDatabaseName("association");
    db.open();
    this->model=new QSqlQueryModel();
    model->setQuery("SELECT NumMembre as Matricule,NomMembre as Nom,PrenomMembre as Prenom FROM membre");
    ui->tableView->setModel(model);
    ui->tableView->horizontalHeader()->setSectionResizeMode(QHeaderView::Stretch);
    ui->tableView->verticalHeader()->setVisible(false);
    this->modelsollicit=new QSqlQueryModel();
    modelsollicit->setQuery("SELECT NomMembre as Nom,PrenomMembre as Prenom,AnneeCampagne as 'Annee Campagne',DateSollicit as Date FROM `sollicitation`,`campagne`,`membre` WHERE (sollicitation.NumMembreSolliciteur=membre.NumMembre && sollicitation.NumCampagne=campagne.NumCampagne)");
    ui->tableView_2->setModel(modelsollicit);
    ui->tableView_2->horizontalHeader()->setSectionResizeMode(QHeaderView::Stretch);
    ui->tableView_2->verticalHeader()->setVisible(false);
}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::on_tableView_doubleClicked(const QModelIndex &index)
{
    int numIndexMembre =  index.row() +1;
    Membreinfo membreinfo(numIndexMembre);
    membreinfo.setWindowTitle("Reda Meskali");
    membreinfo.setFixedSize(559,419);
    membreinfo.setModal(true);
    membreinfo.exec();
}
