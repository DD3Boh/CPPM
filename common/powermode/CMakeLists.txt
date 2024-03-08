#
#  SPDX-FileCopyrightText 2023 Davide Garberi <dade.garberi@gmail.com>
#
#  SPDX-License-Identifier: LGPL-2.1-or-later
#

set(PROJECT_SOURCES
        powermode.cpp
        powermode.h
)

add_library(powermode STATIC ${PROJECT_SOURCES})

target_link_libraries(powermode PRIVATE Qt6::Widgets)

target_include_directories(powermode PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
