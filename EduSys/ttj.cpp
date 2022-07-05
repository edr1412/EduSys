#include "ttj.h"
#include "ui_ttj.h"
#include <QSqlQuery>
#include <QMessageBox>

extern QSqlQuery query;
extern QString username;

tTj::tTj(QWidget *parent) :
    QDialog(parent),
    ui(new Ui::tTj)
{
    ui->setupUi(this);
    QStringList strs = {"课程号", "课程名","平均分","及格率(％)"};
    ui->tableWidget->setHorizontalHeaderLabels(strs);
    query.exec("select * from mfrs where Tid = "+username);
    if(query.size()>0){
        QString wmsg = "以下课程您尚未全部给学生打分，数据将不准确\n";
        for(int i=0;i<query.size();i++){
            query.next();
            wmsg += query.value("Cname").toString();
            wmsg += "未给分学生数:";
            wmsg += query.value("mfrs").toString();
            wmsg += " \n";
        }
        QMessageBox::warning(this, "请注意", wmsg);
    }
    query.exec("select * from jstj where Tid = "+username);
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

tTj::~tTj()
{
    delete ui;
}
