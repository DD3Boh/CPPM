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

find_package(QT NAMES Qt5 REQUIRED COMPONENTS Widgets LinguistTools)
find_package(Qt5 REQUIRED COMPONENTS Widgets LinguistTools)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fPIC")

add_subdirectory(src)
add_subdirectory(systemd)
add_subdirectory(ts)

# CPack
set(CPACK_GENERATOR "TGZ")
set(CPACK_PACKAGE_NAME "CPPM")
set(CPACK_PACKAGE_VERSION "0.1")
set(CPACK_PACKAGE_VENDOR "DD3Boh")
set(CPACK_PACKAGE_DESCRIPTION "Custom Power Profiles Manager (CPPM)")
set(CPACK_PACKAGE_CONTACT "dade.garberi@gmail.com")
set(CPACK_RESOURCE_FILE_LICENSE "${CMAKE_CURRENT_SOURCE_DIR}/LICENSE")

include(CPack)
