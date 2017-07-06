set(CMAKE_INSTALL_SYSTEM_RUNTIME_DESTINATION bin COMPONENT core)
INCLUDE(InstallRequiredSystemLibraries)
set(CPACK_NSIS_COMPONENT_INSTALL ON)
set(CPACK_COMPONENTS_ALL_IN_ONE_PACKAGE 1)
set(CPACK_COMPONENTS_ALL core develop help client)
SET(CPACK_PACKAGE_DESCRIPTION_SUMMARY "Transformer")
SET(CPACK_PACKAGE_VENDOR "www.leehao.org")
SET(CPACK_PACKAGE_DESCRIPTION_FILE "${CMAKE_CURRENT_SOURCE_DIR}/README.md")
SET(CPACK_RESOURCE_FILE_LICENSE "${CMAKE_CURRENT_SOURCE_DIR}/LICENSE")
SET(CPACK_PACKAGE_VERSION_MAJOR "2")
SET(CPACK_PACKAGE_VERSION_MINOR "0")
SET(CPACK_PACKAGE_VERSION_PATCH "1")
SET(CPACK_PACKAGE_INSTALL_DIRECTORY "Transformer ${CPACK_PACKAGE_VERSION_MAJOR}.${CPACK_PACKAGE_VERSION_MINOR}.${CPACK_PACKAGE_VERSION_PATCH}")
IF(WIN32 AND NOT UNIX)
  # There is a bug in NSI that does not handle full unix paths properly. Make
  # sure there is at least one set of four (4) backlasshes.
  #SET(CPACK_PACKAGE_ICON "${CMAKE_CURRENT_SOURCE_DIR}\\\\installlogo.jpg")
  SET(CPACK_NSIS_INSTALLED_ICON_NAME "bin\\\\Transformer.exe")
  SET(CPACK_NSIS_DISPLAY_NAME "Transformer")
  SET(CPACK_NSIS_HELP_LINK "http:\\\\\\\\www.leehao.org")
  SET(CPACK_NSIS_URL_INFO_ABOUT "http:\\\\\\\\www.leehao.org")
  SET(CPACK_NSIS_CONTACT "support@leehao.org")
  SET(CPACK_NSIS_MODIFY_PATH ON)
  set(CPACK_COMPONENT_CORE_GROUP "Basic")
  set(CPACK_COMPONENT_DEVELOP_GROUP "Developer")
  set(CPACK_COMPONENT_HELP_GROUP "Basic")
  set(CPACK_ALL_INSTALL_TYPES Full Developer Client)
  set(CPACK_INSTALL_TYPE_FULL_DISPLAY_NAME "full")
  set(CPACK_COMPONENT_CORE_INSTALL_TYPES Full)
  set(CPACK_COMPONENT_DEVELOP_INSTALL_TYPES Developer Full)
  set(CPACK_COMPONENT_CLIENT_INSTALL_TYPES Client Full)
  set(CPACK_COMPONENT_HELP_INSTALL_TYPES Full)
  set(CPACK_COMPONENT_TEST_HIDDEN ON)
  set(CPACK_COMPONENT_CORE_REQUIRED ON)
ELSE(WIN32 AND NOT UNIX)
  SET(CPACK_STRIP_FILES "bin/MyExecutable")
  SET(CPACK_SOURCE_STRIP_FILES "")
ENDIF(WIN32 AND NOT UNIX)
SET(CPACK_PACKAGE_EXECUTABLES "Transformer" "Transformer.exe")
INCLUDE(CPack)
