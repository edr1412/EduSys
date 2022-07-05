#ifndef TTJ_H
#define TTJ_H

#include <QDialog>

namespace Ui {
class tTj;
}

class tTj : public QDialog
{
    Q_OBJECT

public:
    explicit tTj(QWidget *parent = nullptr);
    ~tTj();

private:
    Ui::tTj *ui;
};

#endif // TTJ_H
