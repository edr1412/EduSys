#include "tmenu.h"
#include "ui_tmenu.h"
#include <QSqlQuery>

extern QSqlQuery query;
extern QString username;

TMenu::TMenu(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::TMenu)
{
    ui->setupUi(this);
    QStringList strs = {"工号", "姓名","性别","年龄","职称","学院"};
    ui->tableWidget->setHorizontalHeaderLabels(strs);
    query.exec("select * from jsxx where Tid = "+username);
    int rows = query.size();
    int columns = ui->tableWidget->columnCount();
    ui->tableWidget->setRowCount(rows);
    for(int i=0;i<rows;i++){
        query.next();
        for(int j=0;j<columns;j++){
            ui->tableWidget->setItem(i, j, new QTableWidgetItem(query.value(j).toString()));
        }
    }
}

TMenu::~TMenu()
{
    delete ui;
}

void TMenu::on_pushButton_clicked()
{
    chPwd *cp = new chPwd();
    cp->show();
}


void TMenu::on_pushButton_2_clicked()
{
    tKb *tk = new tKb();
    tk->show();
}


void TMenu::on_pushButton_3_clicked()
{
    tGf *tg = new tGf();
    tg->show();
}


void TMenu::on_pushButton_4_clicked()
{
    tTj *tt = new tTj();
    tt->show();
}

