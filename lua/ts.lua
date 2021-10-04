local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()

parser_configs.norg = {
    install_info = {
        url = "https://github.com/nvim-neorg/tree-sitter-norg",
        files = {"src/parser.c", "src/scanner.cc"},
        branch = "main"
    }
}

parser_configs.org = {
    install_info = {
        url = 'https://github.com/milisims/tree-sitter-org',
        files = {'src/parser.c', 'src/scanner.cc'},
        branch = 'main'
    },
    filetype = 'org'
}

require'nvim-treesitter.configs'.setup {
    ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    highlight = {
        enable = true, -- false will disable the whole extension
        disable = {"c", "rust"}, -- list of language that will be disabled
        additional_vim_regex_highlighting = {'org'}
    }
}
