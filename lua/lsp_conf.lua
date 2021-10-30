local lspconfig = require 'lspconfig'
local configs = require 'lspconfig/configs'

local lsp_spinner = require('lsp_spinner')
local coq = require "coq" -- add this

local function documentHighlight(client, bufnr)
    -- Set autocommands conditional on server_capabilities
    if client.resolved_capabilities.document_highlight then
        vim.api.nvim_exec([[
      hi LspReferenceRead cterm=bold ctermbg=red guibg=#464646
      hi LspReferenceText cterm=bold ctermbg=red guibg=#464646
      hi LspReferenceWrite cterm=bold ctermbg=red guibg=#464646
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]], false)

    end
end

local lsp_config = {}

vim.lsp.handlers["textDocument/formatting"] = function(err, _, result, _, bufnr)
    if err ~= nil or result == nil then return end
    if not vim.api.nvim_buf_get_option(bufnr, "modified") then
        local view = vim.fn.winsaveview()
        vim.lsp.util.apply_text_edits(result, bufnr)
        vim.fn.winrestview(view)
        if bufnr == vim.api.nvim_get_current_buf() then vim.api.nvim_command("noautocmd :update") end
    end
end

function lsp_config.common_on_attach(client, bufnr)
    lsp_spinner.on_attach(client, bufnr)
    if client.resolved_capabilities.document_formatting then
        vim.api.nvim_command [[augroup Format]]
        vim.api.nvim_command [[autocmd! * <buffer>]]
        vim.api.nvim_command [[autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting()]]
        vim.api.nvim_command [[augroup END]]
    end
    documentHighlight(client, bufnr)
end

function lsp_config.tsserver_on_attach(client, bufnr)
    require("nvim-lsp-ts-utils").setup {
        -- defaults
        disable_commands = false,
        enable_import_on_completion = true
    }
    client.resolved_capabilities.document_formatting = false
    lsp_config.common_on_attach(client, bufnr)
end

-- Use a loop to conveniently both setup defined servers
-- and map buffer local keybindings when the language server attaches
-- local servers = {"pyright", "tsserver"}
-- for _, lsp in ipairs(servers) do nvim_lsp[lsp].setup {on_attach = on_attach} end

local DATA_PATH = vim.fn.stdpath('data')
local CACHE_PATH = vim.fn.stdpath('cache')
-- formatter
local flake8 = {
    LintCommand = "flake8 --ignore=E501 --stdin-display-name ${INPUT} -",
    lintStdin = true,
    lintFormats = {"%f:%l:%c: %m"}
}

local prettier = {formatCommand = "./node_modules/.bin/prettier --stdin-filepath ${INPUT}", formatStdin = true}

local prettier_global = {
    formatCommand = 'prettier_d_slim prefer-file --stdin --stdin-filepath ${INPUT}',
    formatStdin = true
}
-- local black = {formatCommand = "black --quiet -", formatStdin = true}
local isort = {formatCommand = "/home/dim/Desktop/blackd-client/target/debug/blackd-client", formatStdin = true}
local eslint = {
    lintCommand = "eslint_d -f visualstudio --stdin --stdin-filename ${INPUT}",
    lintStdin = true,
    lintFormats = {"%f(%l,%c): %trror %m", "%f(%l,%c): %tarning %m"},
    lintIgnoreExitCode = true,
    formatStdin = false
}

local luaFormat = {
    formatCommand = "lua-format -i --no-keep-simple-function-one-line --column-limit=120",
    formatStdin = true
}

require"lspconfig".efm.setup {
    -- init_options = {initializationOptions},
    cmd = {"/home/dim/go/bin/efm-langserver"},
    init_options = {documentFormatting = true, codeAction = false},
    filetypes = {
        "lua", "python", "javascriptreact", "javascript", "typescript", "typescriptreact", "sh", "html", "css", "json",
        "yaml", "markdown"
    },
    settings = {
        rootMarkers = {".git/"},
        languages = {
            lua = {luaFormat},
            python = {isort},
            -- javascriptreact = {prettier, eslint},
            -- javascript = {prettier, eslint},
            javascriptreact = {eslint, prettier_global},
            javascript = {eslint, prettier_global},
            typescriptreact = {eslint, prettier_global},
            typescript = {eslint, prettier_global},
            sh = {shellcheck, shfmt},
            html = {prettier_global},
            css = {prettier_global},
            json = {prettier},
            yaml = {prettier_global},
            -- markdown = {markdownPandocFormat, markdownlint},
            markdown = {markdownPandocFormat}
        }
    }
}

require'lspconfig'.tsserver.setup({
    cmd = {DATA_PATH .. "/lspinstall/typescript/node_modules/.bin/typescript-language-server", "--stdio"},
    on_attach = lsp_config.tsserver_on_attach,
    capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
    settings = {documentFormatting = false}
})

-- https://github.com/sumneko/lua-language-server/wiki/Build-and-Run-(Standalone)
local sumneko_root_path = DATA_PATH .. "/lspinstall/lua"
local sumneko_binary = sumneko_root_path .. "/sumneko-lua-language-server"

require'lspconfig'.sumneko_lua.setup({
    cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
    on_attach = lsp_config.common_on_attach,
    capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
                -- Setup your lua path
                path = vim.split(package.path, ';')
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {'vim'}
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = {[vim.fn.expand('$VIMRUNTIME/lua')] = true, [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true}
            }
        }
    }
})

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = false,
    underline = true,
    signs = true
})
vim.cmd [[autocmd CursorHold * lua require'lspsaga.diagnostic'.show_line_diagnostics()]]
-- vim.cmd [[autocmd CursorHoldI * silent! lua vim.lsp.buf.signature_help()]]

-- Python
require'lspconfig'.pyright.setup({
    cmd = {DATA_PATH .. "/lspinstall/python/node_modules/.bin/pyright-langserver", "--stdio"},
    capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
    on_attach = lsp_config.common_on_attach,
    flags = {debounce_text_changes = 150},
    settings = {
        python = {
            analysis = {autoSearchPaths = false, useLibraryCodeForTypes = false, diagnosticMode = 'openFilesOnly'}
        }
    }
    -- settings = {python = {analysis = {autoSearchPaths = true, diagnosticMode = 'openFilesOnly'}}}
})

local diagnostic_signs = {Error = '', Warn = '', Hint = '', Info = ''}
for type, icon in pairs(diagnostic_signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = ""})
end

-- Format Options
vim.cmd("autocmd BufWritePre *.tsx lua vim.lsp.buf.formatting_sync(nil, 1200)")
vim.cmd("autocmd BufWritePre *.ts lua vim.lsp.buf.formatting_sync(nil, 1200)")
vim.cmd("autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 1200)")
vim.cmd("autocmd BufWritePre *.jsx lua vim.lsp.buf.formatting_sync(nil, 1200)")
vim.cmd("autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync(nil, 1200)")
vim.cmd("autocmd BufWritePre *.lua lua vim.lsp.buf.formatting_sync(nil, 1200)")
vim.cmd("autocmd BufWritePre *.json lua vim.lsp.buf.formatting_sync(nil, 1200)")
vim.cmd("nnoremap <silent><leader>bf :lua vim.lsp.buf.formatting()<cr>")
