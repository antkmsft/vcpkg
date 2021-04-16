vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO antkmsft/azure-sdk-for-cpp
    REF core-2.1_identity-2.1_same-major
    SHA512 5f8dafb1e7ddf62df081158da0c02e5ecf484db21a7561ae2230cdc3ca825bc2dbf1d1c0a92f5a18631fc0285559d50f0c21e7ffbe36422c45079cb2e45d3aba
)

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}/sdk/identity/azure-identity/
    PREFER_NINJA
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
)

vcpkg_install_cmake()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_fixup_cmake_targets()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
