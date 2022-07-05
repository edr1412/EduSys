#include "mainwindow.h"
#include "ui_mainwindow.h"
#include <QDebug>
#include <QSqlDatabase>
#include <QMessageBox>
#include <QSqlQuery>
#include <QCryptographicHash>



QSqlQuery  query;
QString username;
QString grp;

QString _encrypt(QString raw,QString salt){
    QString raw2 = QString(QCryptographicHash::hash(raw.toUtf8(),QCryptographicHash::Sha256).toHex());
    raw2 = raw2 + "beatbyc0n";
    QString raw3 = QString(QCryptographicHash::hash(raw2.toUtf8(),QCryptographicHash::Sha256).toHex());
    raw3 = raw3 + salt;
    QString raw4 = QString(QCryptographicHash::hash(raw3.toUtf8(),QCryptographicHash::Sha256).toHex());
    return raw4;

}

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    QSqlDatabase db = QSqlDatabase::addDatabase("QMYSQL");
    db.setHostName("127.0.0.1");
    db.setPort(3306);
    db.setDatabaseName("Edu");
    db.setUserName("root");
    //请在引号内补充数据库密码
    db.setPassword("");
        while(true){
        if(db.open())
        {
            //qDebug() << "open sucess";
            QSqlQuery query1(db);
            query = query1;
        }
        else
        {
            //qDebug() << "open fail";
            //QMessageBox::warning(NULL, "错误", "连接数据库失败");
            QMessageBox box(QMessageBox::Warning, "错误","连接数据库失败");
            box.setStandardButtons(QMessageBox::Cancel | QMessageBox::Ok);
            box.setButtonText(QMessageBox::Ok, QString("Retry"));
            box.setButtonText(QMessageBox::Cancel, QString("Cancel"));
            int button = box.exec();
            if (button == QMessageBox::Ok)
                continue;
            else if(button == QMessageBox::Cancel){
                qApp->exit(0);
            }

        }
        break;
    }
}

MainWindow::~MainWindow()
{
    delete ui;
}




void MainWindow::on_loginButton_clicked()
{
    username = ui->ulineEdit->text();
        QString pwd = ui->plineEdit->text();
        if(username.length() < 1 )
        {
            QMessageBox::warning(NULL, "错误", "请输入正确账号");
        }
        else if(pwd.length() < 1 )
        {
            QMessageBox::warning(NULL, "错误", "请输入正确密码");
        }
        else
        {

            grp = "";
            QString failMessage = "帐号或密码不正确";
            bool allow = false;

            if(username!=pwd){
//                qDebug()<<"not same";
                QString encryptedpwd = _encrypt(pwd,username);
                query.exec("SELECT * FROM U WHERE Uid = \'"+username+"\'and pword = \'"+encryptedpwd+"\'");
                if(query.size()>0){
                    query.next();
                    grp = query.value("grp").toString();
                    allow = true;
                }
                else{
                    query.exec("SELECT * FROM U WHERE Uid = \'"+username+"\'");
                    if(query.size()==0){
                        failMessage += "\n默认密码为学号/教工号";
                    }
                }
            }
            else{
//                qDebug()<<"same";
                query.exec("SELECT * FROM U WHERE Uid = \'"+username+"\'");
                if(query.size()==0){
                    query.exec("SELECT * FROM S WHERE Sid = \'"+username+"\'");

                    if(query.size()>0){
                        grp = "S";
                        allow = true;
                    }
                    else
                    {
                        query.exec("SELECT * FROM T WHERE Tid = \'"+username+"\'");
                        if(query.size()>0){
                            grp = "T";
                            allow = true;
                        }
                    }
                }
            }


            if(allow == false)
            {
                QMessageBox::warning(this, "错误", failMessage);
            }
            else
            {
                if(grp=="S"){
                    SMenu *sm = new SMenu();
                    sm->show();

                    this->hide();
                }
                else if(grp=="T"){
                        TMenu *tm = new TMenu();
                        tm->show();

                        this->hide();
                }
                //QMessageBox::warning(this, "错误", "success!");
//    //点击才会新建 管理界面
//                home = new systemhome;
//                home->setAttribute(Qt::WA_DeleteOnClose);
//                home->setWindowTitle("管理界面");
//                home->sqlconnect("courseInfo");

//                this->hide();
//                home->exec();
//                this->show();

            }
        }

}

void MainWindow::on_pushButton_clicked()
{
    qApp->exit(0);
}

