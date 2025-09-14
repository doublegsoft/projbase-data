QT       += core gui widgets

CONFIG += c++17

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

INCLUDEPATH += lib

SOURCES += \
  lib/gux/widget/GXSidebar.cpp              \
  lib/gux/widget/GXToolbar.cpp              \
  lib/gux/gux.cpp                           \
  src/main.cpp
  
HEADERS += \
  lib/gux/widget/GXSidebar.hpp              \
  lib/gux/widget/GXToolbar.hpp              \
  lib/gux/gux.hpp                           \
  src/main.cpp  

# Default rules for deployment.
qnx: target.path = /tmp/$${r"${"}TARGET${r"}"}/bin
else: unix:!android: target.path = /opt/$${r"${"}TAsRGET${r"}"}/bin
!isEmpty(target.path): INSTALLS += target
