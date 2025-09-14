<#if license??>
${cpp.license(license)}
</#if>
#include <QApplication>
#include <QPushButton>
#include <QVBoxLayout>
#include <QLabel>
#include <QMainWindow>

#include "gux/gux.hpp"

int main(int argc, char* argv[])
{
  QApplication app(argc, argv);

  QMainWindow mainWindow;
  mainWindow.setWindowTitle("${app.name}");
  mainWindow.setWindowFlags(Qt::Window | Qt::WindowCloseButtonHint | Qt::WindowMinimizeButtonHint);
  mainWindow.setFixedSize(1280, 720);

  // Central widget for the main window
  QWidget* centralWidget = new QWidget(&mainWindow);
  mainWindow.setCentralWidget(centralWidget);

  // Main content layout
  QVBoxLayout *layout = new QVBoxLayout(centralWidget);
  QLabel *label = new QLabel("Main Content Area", centralWidget);
  label->setAlignment(Qt::AlignCenter);
  layout->addWidget(label);

  // Button to open the drawer
  QPushButton *openDrawerButton = new QPushButton("Open Drawer", centralWidget);
  layout->addWidget(openDrawerButton);

  // Connect the button to show the drawer
  QObject::connect(openDrawerButton, &QPushButton::clicked, [centralWidget]() {
    QLabel* content = new QLabel("this is sidebar");
    gux::sidebar(content, centralWidget);
  });

  mainWindow.show();

  return app.exec();
}