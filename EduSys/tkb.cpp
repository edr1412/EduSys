#include "tkb.h"
#include "ui_tkb.h"
#include <QSqlQuery>
extern QSqlQuery query;
extern QString username;

int nrows;
tKb::tKb(QWidget *parent) :
    QDialog(parent),
    ui(new Ui::tKb)
{
    ui->setupUi(this);
    QStringList strs = {"课程号","课程名","教室","课本","选课人数"};
    ui->tableWidget->setHorizontalHeaderLabels(strs);
    query.exec("select * from skb where Tid = "+username);
    int rows = query.size();
    nrows = rows;
    int columns = ui->tableWidget->columnCount();
    ui->tableWidget->setRowCount(rows);
    for(int i=0;i<rows;i++){
        query.next();
        for(int j=0;j<columns;j++){
            ui->tableWidget->setItem(i, j, new QTableWidgetItem(query.value(j+1).toString()));
            if(j==0||j==1||j==4){
                ui->tableWidget->item(i,j)->setFlags(ui->tableWidget->item(i,j)->flags() ^ Qt::ItemIsEditable);//设置第0,1,4列不可编辑
            }
        }
    }
}

tKb::~tKb()
{
    delete ui;
}

void tKb::on_buttonBox_accepted()
{
    for(int i=0;i<nrows;i++){
        query.exec("update TC set Croom = \'"+ui->tableWidget->item(i,2)->text()+"\' where Tid = "+username+" and Cid = "+ui->tableWidget->item(i,0)->text());
        query.exec("update TC set book = \'"+ui->tableWidget->item(i,3)->text()+"\' where Tid = "+username+" and Cid = "+ui->tableWidget->item(i,0)->text());
    }
}

