/*
 *  SPDX-FileCopyrightText 2023 Davide Garberi <dade.garberi@gmail.com>
 *
 *  SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <QMenu>
#include <QMessageBox>
#include <QDialog>
#include <QCloseEvent>

#include "mainwindow.h"
#include "ui_mainwindow.h"

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);

    sliderVal = powermode.getPowerMode();
    createTrayIcon();

    ui->horizontalSlider->setSliderPosition(sliderVal);

    connect(trayIcon, &QSystemTrayIcon::activated, this, &MainWindow::iconActivated);
    connect(ui->horizontalSlider, &QAbstractSlider::valueChanged, this, &MainWindow::sliderChanged);
    connect(qApp, &QGuiApplication::applicationStateChanged, this, &MainWindow::minimizeWindow);

    trayIcon->show();

    this->move(QCursor::pos());
    this->setWindowFlag(Qt::Tool);
    this->setWindowFlag(Qt::FramelessWindowHint);
    this->setWindowIcon(QIcon::fromTheme("speedometer"));

    QMessageBox::information(this, tr("Custom Power Profiles Manager"),
                                tr("The program will keep running in the "
                                "system tray. To terminate the program, "
                                "choose <b>Quit</b> in the context menu "
                                "of the system tray entry."));
}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::iconActivated(QSystemTrayIcon::ActivationReason)
{
    if (!this->isVisible()) {
        this->show();
        this->move(QCursor::pos());
        this->activateWindow();
    } else
        this->hide();
}

void MainWindow::minimizeWindow(Qt::ApplicationState state)
{
    if (state == Qt::ApplicationInactive)
        this->hide();
}

void MainWindow::sliderChanged(int value)
{
    sliderVal = value;

    powermode.setPowerMode(sliderVal);

    trayIcon->setToolTip(QString("CPPM profile: %1")
                        .arg(powermode.getModeString(sliderVal)));
}

void MainWindow::createTrayIcon()
{
    quitAction = new QAction(tr("&Quit"), this);
    connect(quitAction, &QAction::triggered, qApp, &QCoreApplication::quit);

    trayIconMenu = new QMenu(this);
    trayIconMenu->addAction(quitAction);

    trayIcon = new QSystemTrayIcon(this);
    trayIcon->setIcon(QIcon::fromTheme("speedometer"));
    trayIcon->setContextMenu(trayIconMenu);
    trayIcon->setToolTip(QString("CPPM profile: %1")
                        .arg(powermode.getModeString(sliderVal)));
}
