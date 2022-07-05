#include "sxk.h"
#include "ui_sxk.h"
#include <QtWidgets>
#include <QSqlQuery>
extern QSqlQuery query;
extern QString username;
QString Mid = "";

sXk::sXk(QWidget *parent) :
    QDialog(parent),
    ui(new Ui::sXk)
{
    ui->setupUi(this);
    QStringList strs = {"课程号","课程名","教工号","教师","教室","课本","选择"};
    ui->tableWidget->setHorizontalHeaderLabels(strs);
    ui->tableWidget_2->setHorizontalHeaderLabels(strs);
    query.exec("select * from S where Sid = "+username);
    query.next();
    Mid = query.value("Mid").toString();
    refreshxKb();
}

sXk::~sXk()
{
    delete ui;
}

void sXk::refreshxKb()
{
    query.exec("select * from kxk where Sid = "+username+" order by cid");
    int rows = query.size();
    int columns = ui->tableWidget->columnCount() - 1;
    int row1 = 0;
    int row2 = 0;
    //ui->tableWidget->setRowCount(rows);
    ui->tableWidget->setRowCount(0);
    ui->tableWidget_2->setRowCount(0);
    for(int i=0;i<rows;i++){
        query.next();
        if(query.value("Ctype").toString().contains(Mid)){
            ui->tableWidget->setRowCount(row1+1);
            for(int j=0;j<columns;j++){
                ui->tableWidget->setItem(row1, j, new QTableWidgetItem(query.value(j+1).toString()));
                ui->tableWidget->item(row1,j)->setFlags(ui->tableWidget->item(row1,j)->flags() ^ Qt::ItemIsEditable);
            }
            QPushButton *btn = new QPushButton("选课");
            ui->tableWidget->setCellWidget(row1, columns, btn);
            connect(btn, SIGNAL(clicked(bool)), this, SLOT(takeK()));

            row1++;
        }
        else{
            ui->tableWidget_2->setRowCount(row2+1);
            for(int j=0;j<columns;j++){
                ui->tableWidget_2->setItem(row2, j, new QTableWidgetItem(query.value(j+1).toString()));
                ui->tableWidget_2->item(row2,j)->setFlags(ui->tableWidget_2->item(row2,j)->flags() ^ Qt::ItemIsEditable);
            }
            QPushButton *btn = new QPushButton("选课");
            ui->tableWidget_2->setCellWidget(row2, columns, btn);
            connect(btn, SIGNAL(clicked(bool)), this, SLOT(takeK2()));

            row2++;
        }


    }
}
void sXk::takeK()
{
    QPushButton *btn = (QPushButton *)sender();
    int x = btn->frameGeometry().x();
    int y = btn->frameGeometry().y();
    QModelIndex index = ui->tableWidget->indexAt(QPoint(x,y));
    int row = index.row();
    query.exec("insert into SC(Sid,Cid,score,Tid) values (\'"+username+"\',\'"+ui->tableWidget->item(row,0)->text()+"\', 0 ,\'"+ui->tableWidget->item(row,2)->text()+"\')");
    refreshxKb();

}

void sXk::takeK2()
{
    QPushButton *btn = (QPushButton *)sender();
    int x = btn->frameGeometry().x();
    int y = btn->frameGeometry().y();
    QModelIndex index = ui->tableWidget_2->indexAt(QPoint(x,y));
    int row = index.row();
    query.exec("insert into SC(Sid,Cid,score,Tid) values (\'"+username+"\',\'"+ui->tableWidget_2->item(row,0)->text()+"\', 0 ,\'"+ui->tableWidget_2->item(row,2)->text()+"\')");
    refreshxKb();

}
