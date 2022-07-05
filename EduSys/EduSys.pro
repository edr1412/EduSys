QT       += core gui sql

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

CONFIG += c++11

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
    chpwd.cpp \
    main.cpp \
    mainwindow.cpp \
    scj.cpp \
    skb.cpp \
    smenu.cpp \
    sxk.cpp \
    tgf.cpp \
    tkb.cpp \
    tmenu.cpp \
    ttj.cpp

HEADERS += \
    chpwd.h \
    mainwindow.h \
    scj.h \
    skb.h \
    smenu.h \
    sxk.h \
    tgf.h \
    tkb.h \
    tmenu.h \
    ttj.h

FORMS += \
    chpwd.ui \
    mainwindow.ui \
    scj.ui \
    skb.ui \
    smenu.ui \
    sxk.ui \
    tgf.ui \
    tkb.ui \
    tmenu.ui \
    ttj.ui

TRANSLATIONS += \
    EduSys_zh_CN.ts
CONFIG += lrelease
CONFIG += embed_translations

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target
