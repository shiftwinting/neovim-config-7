local vim_g = vim.g
vim_g.coq_settings = {
    ["auto_start"] = true,
    ["display.icons.mode"] = "short",
    ["clients.lsp.weight_adjust"] = 1.5,
    ["clients.buffers.enabled"] = true,
    ["clients.buffers.weight_adjust"] = 0.3,
    ["clients.tree_sitter.enabled"] = false,
    ["clients.snippets.enabled"] = false,
    ["clients.lsp.resolve_timeout"] = 3,
    ["clients.tabnine.enabled"] = true,
    ["clients.tabnine.weight_adjust"] = 1,
    ["display.pum.fast_close"] = false
}
