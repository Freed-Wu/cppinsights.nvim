-- luacheck: ignore 111 113 143
---@diagnostic disable: undefined-global, undefined-field
-- will upload to
-- https://github.com/xmake-io/xmake-repo
package("cppinsights")
do
    set_homepage("https://github.com/andreasfertig/cppinsights")
    set_description("C++ Insights - See your source code with the eyes of a compiler")

    set_urls("https://github.com/andreasfertig/cppinsights/archive/v_$(version).tar.gz",
        "https://github.com/andreasfertig/cppinsights.git")
    add_versions("20.1", "672ecc237bc0231510025c9662c0f4880feebb076af46d16840adfb16e8fc4e8")

    add_deps("cmake", "ninja", "llvm")

    on_install(function(package)
        io.replace("CMakeLists.txt", "add_executable", "add_library", { plain = true })
        io.replace("CMakeLists.txt", "Insights.cpp", "", { plain = true })
        io.replace("CMakeLists.txt", "install( TARGETS insights RUNTIME DESTINATION bin )",
            [[install( TARGETS insights RUNTIME )
include(GNUInstallDirs)
file(GLOB HEADER_FILES "*.h" "*.def")
install( FILES ${HEADER_FILES} ${CMAKE_BINARY_DIR}/generated/version.h
    DESTINATION ${CMAKE_INSTALL_INCLUDEDIR} )]], { plain = true })
        import("package.tools.cmake").install(package, { '-GNinja', '-DINSIGHTS_STRIP=OFF' })
    end)
end
package_end()
