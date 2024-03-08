#
#  SPDX-FileCopyrightText 2023 Davide Garberi <dade.garberi@gmail.com>
#
#  SPDX-License-Identifier: LGPL-2.1-or-later
#

cmake_minimum_required(VERSION 3.16)

project(org.dd3boh.cppm VERSION 1.0 LANGUAGES CXX)

include(common/common.cmake)

set(QT_MIN_VERSION "6.6.0")
set(KF6_MIN_VERSION "6.0.0")

find_package(ECM ${KF6_MIN_VERSION} REQUIRED NO_MODULE)
set(CMAKE_MODULE_PATH ${ECM_MODULE_PATH})

include(KDEInstallDirs)
include(KDECMakeSettings)
include(KDECompilerSettings NO_POLICY_SCOPE)
include(FeatureSummary)

find_package(Qt6 ${QT_MIN_VERSION} CONFIG REQUIRED COMPONENTS
    Quick
)

find_package(KF6 ${KF6_MIN_VERSION} REQUIRED COMPONENTS
    Config
    I18n
)

find_package(Plasma ${PROJECT_DEP_VERSION} REQUIRED)
find_package(PlasmaQuick ${PROJECT_DEP_VERSION} REQUIRED)

add_definitions(-DTRANSLATION_DOMAIN=\"plasma_applet_org.dd3boh.cppm\")

plasma_install_package(package org.dd3boh.cppm)

set(plasmaPowermodes_SRCS
    plasmaPowermodes.cpp
    plasmaPowermodes.h
)

kcoreaddons_add_plugin(org.dd3boh.cppm SOURCES ${plasmaPowermodes_SRCS} INSTALL_NAMESPACE "plasma/applets")

target_link_libraries(org.dd3boh.cppm
                      powermode
                      Qt::Core
                      Qt::Gui
                      KF6::ConfigCore
                      KF6::I18n
                      Plasma::Plasma)

# CPack
set(CPACK_PACKAGE_NAME "CPPM-Plasma")
set(CPACK_PACKAGE_DESCRIPTION "Custom Power Profiles Manager - Plasmoid version")
set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "Custom Power Profiles Manager (Plasma)")

include(CPack)
