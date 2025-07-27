-- luacheck: ignore 111 113 143
---@diagnostic disable: undefined-global, undefined-field
includes("packages/c/cppinsights")
add_rules("mode.debug", "mode.release")

set_languages("c++20")
local profiles = os.getenv "NIX_PROFILES" or ""
-- static link for Nix
add_requires("cppinsights", { configs = { shared = profiles == "" } })
-- warning: configs.shared is readonly in package(llvm), it's always false
add_requires("llvm")

target("cppinsights")
do
    add_rules("lua.module")
    add_files("*.cpp", "*.c")
    add_packages("cppinsights", "llvm")
    if profiles == "" then
        add_links("clang-cpp")
    end

    for profile in profiles:gmatch("%S+") do
        local dir = path.join(profile, "include")
        if os.isdir(dir) then
            add_includedirs(dir)
        end
        dir = path.join(profile, "lib")
        if os.isdir(dir) then
            add_linkdirs(dir)
        end
    end
end
