#include "mainwindow.h"
#include "ui_mainwindow.h"

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);

    ui->horizontalSlider->setSliderPosition(powermode.getMode());

    connect(ui->horizontalSlider, &QAbstractSlider::valueChanged, &powermode, &PowerMode::setPowerMode);
}

MainWindow::~MainWindow()
{
    delete ui;
}
