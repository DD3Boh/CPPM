#
#  SPDX-FileCopyrightText 2023 Davide Garberi <dade.garberi@gmail.com>
#
#  SPDX-License-Identifier: LGPL-2.1-or-later
#

cmake_minimum_required(VERSION 3.16)

project(cppm VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(QT NAMES Qt5)
find_package(Qt5 REQUIRED COMPONENTS Widgets LinguistTools)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fPIC")

add_subdirectory(common)

add_subdirectory(ts)

install(DIRECTORY DESTINATION share/cppm/)
install(DIRECTORY DESTINATION /opt/cppm/)

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
set(CPACK_GENERATOR "TGZ;DEB;RPM")
set(CPACK_PACKAGE_NAME "CPPM")
set(CPACK_PACKAGE_VERSION "0.1")
set(CPACK_PACKAGE_VENDOR "DD3Boh")
set(CPACK_PACKAGE_DESCRIPTION "Custom Power Profiles Manager (CPPM)")
set(CPACK_PACKAGE_CONTACT "dade.garberi@gmail.com")
set(CPACK_RESOURCE_FILE_LICENSE "${CMAKE_SOURCE_DIR}/../LICENSE")
set(CPACK_SET_DESTDIR ON)

set(CPACK_RPM_PACKAGE_NAME "CPPM")
set(CPACK_RPM_PACKAGE_DESCRIPTION "Custom Power Profiles Manager (CPPM)")
set(CPACK_RPM_PACKAGE_LICENSE "LGPL-2.1-or-later")
set(CPACK_RPM_PACKAGE_GROUP "System Tools")
set(CPACK_RPM_PACKAGE_URL "https://github.com/DD3Boh/CPPM")

include(CPack)
