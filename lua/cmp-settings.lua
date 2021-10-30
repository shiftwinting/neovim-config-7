-- Setup nvim-cmp.
local cmp = require 'cmp'

cmp.setup({
    enabled = true,
    mapping = {
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<Tab>'] = cmp.mapping.select_next_item(),
        ['<S-Tab>'] = cmp.mapping.select_prev_item(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({select = true})
    },
    sources = {{name = 'cmp_tabnine'}, {name = 'nvim_lsp'}, {name = 'luasnip'}, {name = 'buffer'}},
    snippet = {
        expand = function(args)
            -- -- For `vsnip` user.
            -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` user.

            -- For `luasnip` user.
            require('luasnip').lsp_expand(args.body)

            -- For `ultisnips` user.
            -- vim.fn["UltiSnips#Anon"](args.body)
        end
    },
    formatting = {
        format = function(entry, vim_item)
            -- fancy icons and a name of kind
            vim_item.kind = require("lspkind").presets.default[vim_item.kind] .. " " .. vim_item.kind

            -- set a name for each source
            vim_item.menu = ({
                buffer = "Buf",
                nvim_lsp = "LSP",
                cmp_tabnine = "T9",
                luasnip = "LuaSnip",
                nvim_lua = "Lua",
                latex_symbols = "Latex"
            })[entry.source.name]
            return vim_item
        end
    },
    sorting = {
        comparators = {
            cmp.config.compare.offset, cmp.config.compare.exact, cmp.config.compare.score,
            require"cmp-under-comparator".under, cmp.config.compare.kind, cmp.config.compare.sort_text,
            cmp.config.compare.length, cmp.config.compare.order
        }
    }
})

-- autocmd FileType norg lua require'cmp'.setup.buffer {
-- \   enabled= true,
-- \   sources = {
-- \     { name = 'nvim_lua' },
-- \     {name = 'neorg'},
-- \     { name = 'buffer' },
-- \   },
-- \ }

-- autocmd FileType org lua require'cmp'.setup.buffer {
-- \   enabled= true,
-- \   sources = {
-- \     { name = 'nvim_lua' },
-- \     {name = 'orgmode'},
-- \     { name = 'buffer' },
-- \   },
-- \ }

