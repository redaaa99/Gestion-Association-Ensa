#include "membreinfo.h"
#include "ui_membreinfo.h"

Membreinfo::Membreinfo(QWidget *parent) :
    QDialog(parent),
    ui(new Ui::Membreinfo)
{
    ui->setupUi(this);
}

Membreinfo::~Membreinfo()
{
    delete ui;
}
