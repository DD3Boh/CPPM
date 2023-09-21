#
#  SPDX-FileCopyrightText 2023 Davide Garberi <dade.garberi@gmail.com>
#
#  SPDX-License-Identifier: LGPL-2.1-or-later
#

install(FILES cppm.service DESTINATION lib/systemd/system)
install(FILES cppm.path DESTINATION lib/systemd/system)

install(FILES cppm
        DESTINATION lib/systemd/scripts
        PERMISSIONS OWNER_READ OWNER_WRITE OWNER_EXECUTE GROUP_READ GROUP_EXECUTE WORLD_READ WORLD_EXECUTE)
