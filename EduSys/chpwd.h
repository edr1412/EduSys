#ifndef CHPWD_H
#define CHPWD_H

#include <QDialog>

namespace Ui {
class chPwd;
}

class chPwd : public QDialog
{
    Q_OBJECT

public:
    explicit chPwd(QWidget *parent = nullptr);
    ~chPwd();

private slots:
    void on_buttonBox_accepted();

private:
    Ui::chPwd *ui;
};

#endif // CHPWD_H
