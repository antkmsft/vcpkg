vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO antkmsft/azure-sdk-for-cpp
    REF core-1.0.b13_identity-1.0.b10_exact
    SHA512 3b2f60ff14499a2ce735168204397d04d790e4c2ca8625870809edbcf642fcb59a45fbf41c2945fe82cf0aa7bd892f9f4481c61a7b7d4d9219bf850c967d4fa5
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
