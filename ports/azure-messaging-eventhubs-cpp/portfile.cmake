vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF azure-messaging-eventhubs_1.0.0-beta.2
    SHA512 3677edf50218c39e378a968661c0ec0600b8760d3af33f204f3267e104449c0aef42b9520cb63b5e5810b89bf91f06979d009ffdd6d6d04d2c14e1a21f0e111f
    PATCHES
        00100-shorten_paths.patch
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}/sdk/eventhubs/azure-messaging-eventhubs/"
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
        -DBUILD_TESTING=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
