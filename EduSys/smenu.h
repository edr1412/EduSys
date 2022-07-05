#ifndef SMENU_H
#define SMENU_H

#include <QMainWindow>
#include "chpwd.h"
#include "skb.h"
#include "scj.h"
#include "sxk.h"

namespace Ui {
class SMenu;
}

class SMenu : public QMainWindow
{
    Q_OBJECT

public:
    explicit SMenu(QWidget *parent = nullptr);
    ~SMenu();

private slots:
    void on_pushButton_clicked();

    void on_pushButton_2_clicked();

    void on_pushButton_3_clicked();

    void on_pushButton_4_clicked();

private:
    Ui::SMenu *ui;
};

#endif // SMENU_H
