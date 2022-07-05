#include "skb.h"
#include "ui_skb.h"
#include <QtWidgets>
#include <QSqlQuery>
extern QSqlQuery query;
extern QString username;

sKb::sKb(QWidget *parent) :
    QDialog(parent),
    ui(new Ui::sKb)
{
    ui->setupUi(this);
    //ui->tableWidget->horizontalHeader()->setSectionResizeMode(QHeaderView::Stretch);
    QStringList strs = {"课程号","课程名","教师","教室","课本","选择"};
    ui->tableWidget->setHorizontalHeaderLabels(strs);
    refreshKb();
}

sKb::~sKb()
{
    delete ui;
}

void sKb::refreshKb()
{
    query.exec("select * from kb where Sid = "+username);
    int rows = query.size();
    int columns = ui->tableWidget->columnCount() - 1;
    ui->tableWidget->setRowCount(rows);

    for(int i=0;i<rows;i++){
        query.next();
        for(int j=0;j<columns;j++){
            ui->tableWidget->setItem(i, j, new QTableWidgetItem(query.value(j+1).toString()));
            if(j==0){
                ui->tableWidget->item(i,j)->setFlags(ui->tableWidget->item(i,j)->flags() ^ Qt::ItemIsEditable);//设置第0列不可编辑
            }
        }
        QPushButton *btn = new QPushButton("退课");
        ui->tableWidget->setCellWidget(i, columns, btn);
        connect(btn, SIGNAL(clicked(bool)), this, SLOT(dropK()));
    }
}
void sKb::dropK()
{
    QPushButton *btn = (QPushButton *)sender();
    int x = btn->frameGeometry().x();
    int y = btn->frameGeometry().y();
    QModelIndex index = ui->tableWidget->indexAt(QPoint(x,y));
    int row = index.row();
    //int column = index.column();
    //qDebug()<<row<<column;
    //qDebug() << ui->tableWidget->item(row,0)->text();
    query.exec("delete from SC where Sid = "+username+" and Cid = "+ui->tableWidget->item(row,0)->text());
    refreshKb();



}
