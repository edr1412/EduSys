#ifndef TGF_H
#define TGF_H

#include <QDialog>

namespace Ui {
class tGf;
}

class tGf : public QDialog
{
    Q_OBJECT

public:
    explicit tGf(QWidget *parent = nullptr);
    ~tGf();

private slots:
    void on_buttonBox_accepted();

private:
    Ui::tGf *ui;
};

#endif // TGF_H
