-- luacheck: ignore 111 113 143
---@diagnostic disable: undefined-global, undefined-field
includes("packages/c/cppinsights")
add_rules("mode.debug", "mode.release")

set_languages("c++20")
add_requires("cppinsights", "llvm")

target("cppinsights")
do
    add_rules("lua.module")
    add_files("*.cpp", "*.c")
    add_packages("cppinsights", "llvm")
    add_links("LLVM-20", "clang-cpp")
    if os.getenv "CXXFLAGS" then
        add_cxxflags(os.getenv "CXXFLAGS")
    end
    if os.getenv "LDFLAGS" then
        add_ldflags(os.getenv "LDFLAGS")
    end
end
