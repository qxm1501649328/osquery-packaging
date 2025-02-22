#
# Copyright (c) 2014-present, The agenttool authors
#
# This source code is licensed as defined by the LICENSE file found in the
# root directory of this source tree.
#
# SPDX-License-Identifier: (Apache-2.0 OR GPL-2.0-only)
#

set(CPACK_PACKAGE_FILE_NAME "${CPACK_PACKAGE_NAME}-${CPACK_PACKAGE_VERSION}")
set(OSQUERY_BITNESS "" CACHE STRING "agenttool build bitness (32 or 64)")

if ("${OSQUERY_BITNESS}" STREQUAL "32")
  set(PROGRAM_FILES_DIR "Program Files (x86)")
else()
  set(PROGRAM_FILES_DIR "Program Files")
endif()

set(directory_name_list
  "certs"
  "packs"
  "log"
)

set(file_name_list
  "manage-agenttoold.ps1"
  "agenttool.conf"
  "agenttool.flags"
  "agenttool.man"
  "agenttool_utils.ps1"
  "agenttooli.exe"
)

foreach(directory_name ${directory_name_list})
  install(
    DIRECTORY "${OSQUERY_DATA_PATH}/${PROGRAM_FILES_DIR}/agenttool/${directory_name}"
    DESTINATION "."
    COMPONENT osquery
  )
endforeach()

foreach(file_name ${file_name_list})
  install(
    FILES "${OSQUERY_DATA_PATH}/${PROGRAM_FILES_DIR}/agenttool/${file_name}"
    DESTINATION "."
    COMPONENT osquery
  )
endforeach()

install(
  FILES "${OSQUERY_DATA_PATH}/${PROGRAM_FILES_DIR}/agenttool/agenttoold/agenttoold.exe"
  DESTINATION "agenttoold"
  COMPONENT osquery
)
