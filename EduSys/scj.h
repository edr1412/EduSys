#ifndef SCJ_H
#define SCJ_H

#include <QDialog>

namespace Ui {
class sCj;
}

class sCj : public QDialog
{
    Q_OBJECT

public:
    explicit sCj(QWidget *parent = nullptr);
    ~sCj();

private:
    Ui::sCj *ui;
};

#endif // SCJ_H
