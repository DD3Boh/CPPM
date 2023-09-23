#
#  SPDX-FileCopyrightText 2023 Davide Garberi <dade.garberi@gmail.com>
#
#  SPDX-License-Identifier: LGPL-2.1-or-later
#

add_subdirectory(powermode)
add_subdirectory(app)
add_subdirectory(plasma)

qt_add_resources(RESOURCES icons.qrc)

if(${QT_VERSION_MAJOR} GREATER_EQUAL 6)
    qt_add_executable(cppm
        MANUAL_FINALIZATION
    )
else()
    add_executable(cppm ${RESOURCES})
endif()

target_link_libraries(cppm PRIVATE mainapp powermode)

include(GNUInstallDirs)
install(TARGETS cppm
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)

if(QT_VERSION_MAJOR EQUAL 6)
    qt_finalize_executable(cppm)
endif()
