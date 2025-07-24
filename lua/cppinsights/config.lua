--- default config. See `lua vim.print(require"cppinsights.config")`.

return {
    --- opened window should be vertical/horizontal
    vertical = true,
    --- name of window
    window_name = "%:r-insights.cpp",
    --- extra command line arguments, such as {"--", "-std=c++17"}
    extra_args = {}
}
