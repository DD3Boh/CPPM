set(QT_MIN_VERSION "5.15.2")
set(KF5_MIN_VERSION "5.93.0")

find_package(ECM ${KF5_MIN_VERSION} REQUIRED NO_MODULE)
set(CMAKE_MODULE_PATH ${ECM_MODULE_PATH})

include(KDEInstallDirs)
include(KDECMakeSettings)
include(KDECompilerSettings NO_POLICY_SCOPE)
include(FeatureSummary)

find_package(KF5 ${KF5_MIN_VERSION} REQUIRED COMPONENTS
    Plasma
    I18n
)

find_package(Qt5 ${QT_MIN_VERSION} CONFIG REQUIRED COMPONENTS
    Quick
    Core
)

add_definitions(-DTRANSLATION_DOMAIN=\"plasma_applet_org.dd3boh.cppm\")

plasma_install_package(package org.dd3boh.cppm)

set(plasmaPowermodes_SRCS
    plasmaPowermodes.cpp
    plasmaPowermodes.h
)

kcoreaddons_add_plugin(org.dd3boh.cppm SOURCES ${plasmaPowermodes_SRCS} INSTALL_NAMESPACE "plasma/applets")

target_link_libraries(org.dd3boh.cppm
                      Qt5::Gui
                      KF5::Plasma
                      KF5::I18n
                      powermode)
