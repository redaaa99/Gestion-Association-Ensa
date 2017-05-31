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
    this->model= new QSqlQueryModel();
    model->setQuery("SELECT NumMembre as Matricule,NomMembre as Nom,PrenomMembre as Prenom FROM membre");
    ui->tableView->setModel(model);
}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::on_tableView_doubleClicked(const QModelIndex &index)
{
    int numIndexMembre =  index.row() +1;
    QString nom="Reda";
    QString prenom="Meskali";
    QString telephone;
    QString naissance;
    QString adresse;
    bool membreca;
    bool membreex;
    QSqlQueryModel *modeldiplome;
    QSqlQueryModel *modelversement;
    Membreinfo membreinfo;
    membreinfo.setWindowTitle(nom+" "+prenom);
    membreinfo.setFixedSize(513,419);
    membreinfo.setModal(true);
    membreinfo.exec();
}
