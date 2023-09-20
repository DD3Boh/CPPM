#
#  SPDX-FileCopyrightText 2023 Davide Garberi <dade.garberi@gmail.com>
#
#  SPDX-License-Identifier: LGPL-2.1-or-later
#

set(PROJECT_SOURCES
        main.cpp
        mainwindow.cpp
        mainwindow.h
        mainwindow.ui
)

add_library(mainapp STATIC ${PROJECT_SOURCES})

target_link_libraries(mainapp PRIVATE Qt${QT_VERSION_MAJOR}::Widgets powermode)
