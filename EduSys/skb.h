#ifndef SKB_H
#define SKB_H

#include <QDialog>

namespace Ui {
class sKb;
}

class sKb : public QDialog
{
    Q_OBJECT

public:
    explicit sKb(QWidget *parent = nullptr);
    ~sKb();
    void refreshKb();

private slots:

    void dropK();

private:
    Ui::sKb *ui;
};

#endif // SKB_H
