#include "smenu.h"
#include "ui_smenu.h"
#include <QSqlQuery>

extern QSqlQuery query;
extern QString username;

SMenu::SMenu(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::SMenu)
{
    ui->setupUi(this);
    QStringList strs = {"学号", "姓名","性别","年龄","学分","专业","学院"};
    ui->tableWidget->setHorizontalHeaderLabels(strs);
    query.exec("select * from xsxx where Sid = "+username);
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

SMenu::~SMenu()
{
    delete ui;
}

void SMenu::on_pushButton_clicked()
{
    chPwd *cp = new chPwd();
    cp->show();
}


void SMenu::on_pushButton_2_clicked()
{
    sKb * sk = new sKb();
    sk->show();
}


void SMenu::on_pushButton_3_clicked()
{
    sCj * sc = new sCj();
    sc->show();
}


void SMenu::on_pushButton_4_clicked()
{
    sXk * sx = new sXk();
    sx->show();
}

