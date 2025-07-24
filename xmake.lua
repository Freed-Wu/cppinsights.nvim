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
    add_links("clang-cpp")

    local profile = os.getenv "NIX_PROFILES"
    if profile then
        profile = profile:gsub(".* ", "")
        add_includedirs(path.join(profile, "include"))
        add_linkdirs(path.join(profile, "lib"))
    end
end
