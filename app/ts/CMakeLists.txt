#
#  SPDX-FileCopyrightText 2023-2024 Davide Garberi <dade.garberi@gmail.com>
#
#  SPDX-License-Identifier: LGPL-2.1-or-later
#

set(TS_FILES cppm_en_US.ts)

set(PROJECT_SOURCES
    ${TS_FILES}
)

qt_create_translation(QM_FILES ${CMAKE_SOURCE_DIR} ${TS_FILES})
