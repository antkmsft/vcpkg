vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO antkmsft/azure-sdk-for-cpp
    REF core-1.3.b1_identity-1.3.b1_exact
    SHA512 08616a0788e3d5ce3dd06fab5aa83c58c5024260e6e7cc397a6efbfbe9e62cc156b0fe1050b0e0bd8545825b6bf495a1145b3a87d3ee60c241283e643a891da6
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
