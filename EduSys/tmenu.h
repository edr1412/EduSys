#ifndef TMENU_H
#define TMENU_H

#include <QMainWindow>
#include "chpwd.h"
#include "tkb.h"
#include "tgf.h"
#include "ttj.h"

namespace Ui {
class TMenu;
}

class TMenu : public QMainWindow
{
    Q_OBJECT

public:
    explicit TMenu(QWidget *parent = nullptr);
    ~TMenu();

private slots:
    void on_pushButton_clicked();

    void on_pushButton_2_clicked();

    void on_pushButton_3_clicked();

    void on_pushButton_4_clicked();

private:
    Ui::TMenu *ui;
};

#endif // TMENU_H
