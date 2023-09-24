#
#  SPDX-FileCopyrightText 2023 Davide Garberi <dade.garberi@gmail.com>
#
#  SPDX-License-Identifier: LGPL-2.1-or-later
#

cmake_minimum_required(VERSION 3.16)

project(org.dd3boh.cppm VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(QT NAMES Qt5)
find_package(Qt5 REQUIRED COMPONENTS Widgets LinguistTools)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fPIC")

add_subdirectory(common)

install(DIRECTORY DESTINATION share/cppm/)
install(DIRECTORY DESTINATION /opt/cppm/)

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

# CPack
set(CPACK_GENERATOR "TGZ;DEB;RPM")
set(CPACK_PACKAGE_NAME "CPPM-Plasma")
set(CPACK_PACKAGE_VERSION "0.1")
set(CPACK_PACKAGE_VENDOR "DD3Boh")
set(CPACK_PACKAGE_DESCRIPTION "Custom Power Profiles Manager Plasmoid")
set(CPACK_PACKAGE_CONTACT "dade.garberi@gmail.com")
set(CPACK_RESOURCE_FILE_LICENSE "${CMAKE_SOURCE_DIR}/../LICENSE")
set(CPACK_SET_DESTDIR ON)

set(CPACK_RPM_PACKAGE_NAME "CPPM-Plasma")
set(CPACK_RPM_PACKAGE_DESCRIPTION "Custom Power Profiles Manager Plasmoid")
set(CPACK_RPM_PACKAGE_LICENSE "LGPL-2.1-or-later")
set(CPACK_RPM_PACKAGE_GROUP "System Tools")
set(CPACK_RPM_PACKAGE_URL "https://github.com/DD3Boh/CPPM")

include(CPack)
