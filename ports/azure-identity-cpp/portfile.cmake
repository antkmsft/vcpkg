vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO antkmsft/azure-sdk-for-cpp
    REF core-1.2_identity-1.2_same-major
    SHA512 ad8753998f2a88b6a3cee33e3ec71fe239a953cf17553d292947f985a029e8806fdc6913c47ba3045a29d988defc05a86e46991032e3728d99ed8a578a78cd36
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
