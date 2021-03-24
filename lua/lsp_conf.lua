local DATA_PATH = vim.fn.stdpath('data')
local CACHE_PATH = vim.fn.stdpath('cache')
local prettier = {formatCommand = "./node_modules/.bin/prettier --stdin-filepath ${INPUT}", formatStdin = true}

local prettier_global = {formatCommand = "prettier --stdin-filepath ${INPUT}", formatStdin = true}

require"lspconfig".efm.setup {
    -- init_options = {initializationOptions},
    init_options = {documentFormatting = true, codeAction = false},
    filetypes = {"lua", "python", "javascriptreact", "javascript", "sh", "html", "css", "json", "yaml", "markdown"},
    settings = {
        rootMarkers = {".git/"},
        languages = {
            lua = {luaFormat},
            python = {isort, yapf},
            -- javascriptreact = {prettier, eslint},
            -- javascript = {prettier, eslint},
            javascriptreact = {prettier},
            javascript = {prettier},
            typescript = {prettier},
            javascriptreact = {prettier},
            sh = {shellcheck, shfmt},
            html = {prettier_global},
            css = {prettier_global},
            json = {prettier_global},
            yaml = {prettier_global},
            -- markdown = {markdownPandocFormat, markdownlint},
            markdown = {markdownPandocFormat}
        }
    }
}

-- Also find way to toggle format on save
-- maybe this will help: https://superuser.com/questions/439078/how-to-disable-autocmd-or-augroup-in-vim

-- npm install -g typescript typescript-language-server
-- require'snippets'.use_suggested_mappings()
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities.textDocument.completion.completionItem.snippetSupport = true;
-- local on_attach_common = function(client)
-- print("LSP Initialized")
-- require'completion'.on_attach(client)
-- require'illuminate'.on_attach(client)
-- end
require'lspconfig'.tsserver.setup {
    cmd = {DATA_PATH .. "/lspinstall/typescript/node_modules/.bin/typescript-language-server", "--stdio"},
    on_attach = require'lsp'.tsserver_on_attach,
    -- This makes sure tsserver is not used for formatting (I prefer prettier)
    -- on_attach = require'lsp'.common_on_attach,
    settings = {documentFormatting = false}
}

