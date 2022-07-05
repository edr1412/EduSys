#ifndef TKB_H
#define TKB_H

#include <QDialog>

namespace Ui {
class tKb;
}

class tKb : public QDialog
{
    Q_OBJECT

public:
    explicit tKb(QWidget *parent = nullptr);
    ~tKb();

private slots:
    void on_buttonBox_accepted();

private:
    Ui::tKb *ui;
};

#endif // TKB_H
