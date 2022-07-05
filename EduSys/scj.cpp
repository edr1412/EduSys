#include "scj.h"
#include "ui_scj.h"
#include <QSqlQuery>

extern QSqlQuery query;
extern QString username;
sCj::sCj(QWidget *parent) :
    QDialog(parent),
    ui(new Ui::sCj)
{
    ui->setupUi(this);
    QStringList strs = {"课程", "分数"};
    ui->tableWidget->setHorizontalHeaderLabels(strs);
    query.exec("select * from ccj where Sid = "+username);
    int rows = query.size();
    int columns = ui->tableWidget->columnCount();
    ui->tableWidget->setRowCount(rows);
    for(int i=0;i<rows;i++){
        query.next();
        for(int j=0;j<columns;j++){
            ui->tableWidget->setItem(i, j, new QTableWidgetItem(query.value(j+1).toString()));
        }
    }

}

sCj::~sCj()
{
    delete ui;
}
