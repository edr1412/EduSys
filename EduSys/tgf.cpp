#include "tgf.h"
#include "ui_tgf.h"
#include <QSqlQuery>
extern QSqlQuery query;
extern QString username;

int gfrows;
tGf::tGf(QWidget *parent) :
    QDialog(parent),
    ui(new Ui::tGf)
{
    ui->setupUi(this);
    QStringList strs = {"课程号","课程名","学生学号","学生姓名","分数"};
    ui->tableWidget->setHorizontalHeaderLabels(strs);
    query.exec("select * from df where Tid = "+username+" order by Cid");
    int rows = query.size();
    gfrows = rows;
    int columns = ui->tableWidget->columnCount();
    ui->tableWidget->setRowCount(rows);
    for(int i=0;i<rows;i++){
        query.next();
        for(int j=0;j<columns;j++){
            ui->tableWidget->setItem(i, j, new QTableWidgetItem(query.value(j+1).toString()));
            if(j<4){
                ui->tableWidget->item(i,j)->setFlags(ui->tableWidget->item(i,j)->flags() ^ Qt::ItemIsEditable);//设置第0,1,2,3列不可编辑
            }
        }
    }
}

tGf::~tGf()
{
    delete ui;
}

void tGf::on_buttonBox_accepted()
{
    for(int i=0;i<gfrows;i++){
        query.exec("update SC set score = \'"+ui->tableWidget->item(i,4)->text()+"\' where Sid = "+ui->tableWidget->item(i,2)->text()+" and Cid = "+ui->tableWidget->item(i,0)->text());
    }
}

