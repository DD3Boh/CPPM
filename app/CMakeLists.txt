#
#  SPDX-FileCopyrightText 2023 Davide Garberi <dade.garberi@gmail.com>
#
#  SPDX-License-Identifier: LGPL-2.1-or-later
#

cmake_minimum_required(VERSION 3.16)

project(cppm VERSION 0.1 LANGUAGES CXX)

include(common/common.cmake)

install(FILES common/cppm.desktop DESTINATION share/applications)

add_subdirectory(ts)

set(PROJECT_SOURCES
        main.cpp
        mainwindow.cpp
        mainwindow.h
        mainwindow.ui
)

if(${QT_VERSION_MAJOR} GREATER_EQUAL 6)
    qt_add_executable(cppm
        MANUAL_FINALIZATION
        ${PROJECT_SOURCES}
    )
else()
    add_executable(cppm ${PROJECT_SOURCES})
endif()

target_link_libraries(cppm PRIVATE powermode Qt${QT_VERSION_MAJOR}::Widgets)

include(GNUInstallDirs)
install(TARGETS cppm
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)

if(QT_VERSION_MAJOR EQUAL 6)
    qt_finalize_executable(cppm)
endif()

# CPack
set(CPACK_PACKAGE_NAME "CPPM")
set(CPACK_PACKAGE_DESCRIPTION "Custom Power Profiles Manager (CPPM)")
set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "Custom Power Profiles Manager")

include(CPack)
