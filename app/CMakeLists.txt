#
#  SPDX-FileCopyrightText 2023 Davide Garberi <dade.garberi@gmail.com>
#
#  SPDX-License-Identifier: LGPL-2.1-or-later
#

cmake_minimum_required(VERSION 3.16)

project(cppm VERSION 1.0 LANGUAGES CXX)

include(common/common.cmake)

install(FILES common/cppm.desktop DESTINATION share/applications)

add_subdirectory(ts)

set(PROJECT_SOURCES
        main.cpp
        mainwindow.cpp
        mainwindow.h
        mainwindow.ui
)

qt_add_executable(cppm
    MANUAL_FINALIZATION
    ${PROJECT_SOURCES}
)

target_link_libraries(cppm PRIVATE powermode Qt6::Widgets)

include(GNUInstallDirs)
install(TARGETS cppm
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)

qt_finalize_executable(cppm)

# CPack
set(CPACK_PACKAGE_NAME "CPPM")
set(CPACK_PACKAGE_DESCRIPTION "Custom Power Profiles Manager (CPPM)")
set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "Custom Power Profiles Manager")

include(CPack)
