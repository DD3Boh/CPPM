#
#  SPDX-FileCopyrightText 2023 Davide Garberi <dade.garberi@gmail.com>
#
#  SPDX-License-Identifier: LGPL-2.1-or-later
#

install(FILES cppm.service DESTINATION /usr/lib/systemd/system)
install(FILES cppm.path DESTINATION /usr/lib/systemd/system)

install(FILES cppm
        DESTINATION /usr/lib/systemd/scripts
        PERMISSIONS OWNER_READ OWNER_WRITE OWNER_EXECUTE GROUP_READ GROUP_EXECUTE WORLD_READ WORLD_EXECUTE)
