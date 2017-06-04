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
    modelsollicit->setQuery("SELECT NomMembre as 'Nom Solliciteur',PrenomMembre as 'Prenom Solliciteur',AnneeCampagne as 'Annee Campagne',NumFicheSollicit as 'N° Fiche' FROM `sollicitation`,`campagne`,`membre` WHERE (sollicitation.NumMembreSolliciteur=membre.NumMembre && sollicitation.NumCampagne=campagne.NumCampagne)");
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
    membreinfo.setWindowTitle("Membre");
    membreinfo.setFixedSize(559,419);
    membreinfo.setWindowIcon(QIcon("C:/path/to/icon/marrakech.png"));
    membreinfo.setModal(true);
    membreinfo.exec();
}

void MainWindow::on_tableView_2_doubleClicked(const QModelIndex &index)
{
    int numIndexSolli = index.row()+1;

    QString indannecompagne = ui->tableView_2->model()->data(ui->tableView_2->model()->index(index.row(),2)).toString();
    QString indnumfiche = ui->tableView_2->model()->data(ui->tableView_2->model()->index(index.row(),3)).toString();
    sollicitinfo solliwin(indannecompagne,indnumfiche);
    solliwin.setWindowTitle("Sollicitation");
    solliwin.setFixedSize(601,429);
    solliwin.setWindowIcon(QIcon("C:/path/to/icon/marrakech.png"));
    solliwin.setModal(true);
    solliwin.exec();
}
