#ifndef MEMBREINFO_H
#define MEMBREINFO_H

#include <QDialog>

namespace Ui {
class Membreinfo;
}

class Membreinfo : public QDialog
{
    Q_OBJECT

public:
    explicit Membreinfo(QWidget *parent = 0);
    ~Membreinfo();

private:
    Ui::Membreinfo *ui;
};

#endif // MEMBREINFO_H
