#
#  SPDX-FileCopyrightText 2023-2024 Davide Garberi <dade.garberi@gmail.com>
#
#  SPDX-License-Identifier: LGPL-2.1-or-later
#

set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(QT NAMES Qt6 REQUIRED COMPONENTS Widgets)
find_package(Qt6 REQUIRED COMPONENTS Widgets LinguistTools)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fPIC")

add_subdirectory(common)

install(DIRECTORY DESTINATION share/cppm/)
install(DIRECTORY DESTINATION /opt/cppm/)

set(CMAKE_INSTALL_PREFIX "/usr")

# CPack
set(CPACK_GENERATOR "TGZ;DEB;RPM")
set(CPACK_PACKAGE_VERSION ${CMAKE_PROJECT_VERSION})
set(CPACK_PACKAGE_VENDOR "DD3Boh")
set(CPACK_PACKAGE_CONTACT "dade.garberi@gmail.com")
set(CPACK_RESOURCE_FILE_LICENSE "${CMAKE_SOURCE_DIR}/../LICENSE")
set(CPACK_PACKAGE_RELOCATABLE FALSE)
set(CPACK_SET_DESTDIR ON)
set(CPACK_MONOLITHIC_INSTALL TRUE)

set(CPACK_RPM_PACKAGE_RELOCATABLE FALSE)
set(CPACK_RPM_PACKAGE_LICENSE "LGPL-2.1-or-later")
set(CPACK_RPM_PACKAGE_GROUP "System Tools")
set(CPACK_RPM_PACKAGE_URL "https://github.com/DD3Boh/CPPM")

set(CPACK_DEBIAN_PACKAGE_SECTION "utils")
set(CPACK_DEBIAN_PACKAGE_ARCHITECTURE "amd64")

set(CPACK_SOURCE_GENERATOR "ZIP")
