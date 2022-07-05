#ifndef SXK_H
#define SXK_H

#include <QDialog>

namespace Ui {
class sXk;
}

class sXk : public QDialog
{
    Q_OBJECT

public:
    explicit sXk(QWidget *parent = nullptr);
    ~sXk();
    void refreshxKb();

private slots:
    void takeK();
    void takeK2();

private:
    Ui::sXk *ui;
};

#endif // SXK_H
