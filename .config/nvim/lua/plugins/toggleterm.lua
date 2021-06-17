require"toggleterm".setup {
    size = 20,
    open_mapping = [[<c-\>]],
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = '3', -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
    start_in_insert = false,
    direction = 'horizontal',
    close_on_exit = true,
    shell = 'fish',
    persist_size = true,
    highlights = {
        border = "Normal",
        background = "Normal"
    }
}
