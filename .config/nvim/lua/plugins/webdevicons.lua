local colors = {
    nordbg = "#323846",
    nord1 = "#3B4252",
    nord0 = "#2E3440",
    nord2 = "#434C5E",
    nord3 = "#4C566A",
    nord3_bright = "#616E88",
    nord4 = "#D8DEE9",
    nord5 = "#E5E9F0",
    nord6 = "#ECEFF4",
    nord7 = "#8FBCBB",
    nord8 = "#88C0D0",
    nord9 = "#81A1C1",
    nord10 = "#5E81AC",
    nord11 = "#BF616A",
    nord12 = "#D08770",
    nord13 = "#EBCB8B",
    nord14 = "#A3BE8C",
    nord15 = "#B48EAD"
}

require'nvim-web-devicons'.setup {
    -- your personnal icons can go here (to override)
    -- DevIcon will be appended to `name`
    override = {
        ['.browserslistrc'] = {icon = "", color = colors.nord13, name = "browserslistrc" },
        ['.gitattributes'] = {icon = "", color = colors.nord11, name = "gitattributes" },
        ['.gitignore'] = {icon = "", color = colors.nord11, name = "configru" },
        ['.ruby-version'] = {icon = "", color = colors.nord3_bright, name = "rubyversion" },
        ['babel.config.js'] = {icon = "", color = colors.nord13, name = "babelconfigjs"},
        ['config.ru'] = {icon = "", color = colors.nord11, name = "configru" },
        ['yarn.lock'] = {icon = "", color = colors.nord9, name = "yarnlock" },
        lua = {icon = "", color = colors.nord9, name = "lua"},
        vim = {icon = "", color = colors.nord14, name = "vim"},
        css = {icon = "", color = colors.nord8, name = "css"},
        scss = {icon = "", color = colors.nord15, name = "scss"},
        html = {icon = "", color = colors.nord12, name = "html"},
        haml = {icon = "", color = colors.nord12, name = "haml"},
        erb = {icon = "", color = colors.nord11, name = "eruby"},
        js = {icon = "", color = colors.nord13, name = "js"},
        jsx = {icon = "", color = colors.nord8, name = "jsx"},
        json = {icon = "", color = colors.nord13, name = "json"},
        bundle = {icon = "", color = colors.nord11, name = "bundle"},
        rails = {icon = "", color = colors.nord11, name = "rails"},
        rake = {icon = "", color = colors.nord11, name = "rake"},
        setup = {icon = "", color = colors.nord11, name = "setup"},
        spring = {icon = "", color = colors.nord11, name = "spring"},
        yarn = {icon = "", color = colors.nord9, name = "yarn"},
        webpack = {icon = "", color = colors.nord8, name = "webpack"},
        ['webpack-dev-server'] = {icon = "", color = colors.nord8, name = "webpackdevserver"},
        Gemfile = {icon = "", color = colors.nord11, name = "Gemfile"},
        ['Gemfile.lock'] = {icon = "", color = colors.nord3_bright, name = "Gemfilelock"},
        Rakefile = {icon = "", color = colors.nord11, name = "configru" },
        rb = {icon = "", color = colors.nord11, name = "ruby"},
        ['README.md'] = {icon = "", color = colors.nord8, name = "readmemd"},
        NeogitStatus = {icon = "", color = colors.nord4, name = "NeogitStatus"}
    },
    -- globally enable default icons (default to false)
    -- will get overriden by `get_icons` option
    default = true
}
