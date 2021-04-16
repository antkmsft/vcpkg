vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO antkmsft/azure-sdk-for-cpp
    REF core-1.1_identity-1.1_same-major
    SHA512 184f3ec802e3663b8a17d7893309b84e9de7c071509bc5f0a970e6b7562e510a22137e82aed20d6077d1dcae169218559f83539bbb6f4451c7ea61879a20a063
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
