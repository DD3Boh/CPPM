/*
 *  SPDX-FileCopyrightText 2023 Davide Garberi <dade.garberi@gmail.com>
 *
 *  SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include "mainwindow.h"
#include "ui_mainwindow.h"

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);

    ui->horizontalSlider->setSliderPosition(powermode.getPowerMode());

    connect(ui->horizontalSlider, &QAbstractSlider::valueChanged, &powermode, &PowerMode::setPowerMode);
}

MainWindow::~MainWindow()
{
    delete ui;
}
