#include "chpwd.h"
#include "ui_chpwd.h"
#include <QSqlQuery>
#include <QDebug>
#include <QMessageBox>


extern QSqlQuery query;
extern QString username;
extern QString grp;

extern QString _encrypt(QString,QString);

QString oldpwd = "";
chPwd::chPwd(QWidget *parent) :
    QDialog(parent),
    ui(new Ui::chPwd)
{
    ui->setupUi(this);
    query.exec("select * from U where Uid = "+username);
    if(query.size()>0){
        query.next();
        oldpwd = query.value("pword").toString();
    }
}

chPwd::~chPwd()
{
    delete ui;
}

void chPwd::on_buttonBox_accepted()
{
    bool allowch=true;
//    qDebug() << ui->lineEdit->text();
//    qDebug() << ui->lineEdit_2->text();
//    qDebug() << ui->lineEdit_3->text();
    if(oldpwd==""){
        if(ui->lineEdit->text()!=username){
            QMessageBox::warning(NULL, "错误", "旧密码输入错误");
            allowch = false;
        }
    }
    else{
        if(_encrypt(ui->lineEdit->text(),username)!=oldpwd){
            QMessageBox::warning(NULL, "错误", "旧密码输入错误");
            allowch = false;
        }
    }
    if(ui->lineEdit_2->text() != ui->lineEdit_3->text()){
        QMessageBox::warning(NULL, "错误", "新密码两次不一致");
    }
    else{
        if(allowch == true){
            if(oldpwd=="")
                query.exec("insert into U(Uid,pword,grp) values(\'"+username+"\',\'"+_encrypt(ui->lineEdit_2->text(),username)+"\',\'"+grp+"\')");
            else
                query.exec("update U set pword = \'"+_encrypt(ui->lineEdit_2->text(),username)+"\' where Uid = \'"+username+"\'");
            QMessageBox::warning(NULL, "成功", "修改成功");
        }
    }
}

