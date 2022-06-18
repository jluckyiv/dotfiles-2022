local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics
local completion = null_ls.builtins.completion
local sources = {
  -- check https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
  -- completion.luasnip -- seems like this would be redundant, but I included it as a reminder
  -- diagnostics.alex, -- insensitive language, but warns on every gender-specific pronoun
  -- diagnostics.proselint, -- regular writing, but throws errors with format on save and non-curly quotes
  -- formatting.stylua, -- lua, but sumneko_lua server conflicts
  completion.spell,
  diagnostics.eslint,
  formatting.black.with({ extra_args = { "--fast" } }), -- python
  formatting.elm_format, -- elm
  formatting.gofumpt, -- go (stricter than gofmt)
  formatting.prettierd, -- js, ts, json, css, scss, less, html, vue, yaml, md, graphql, handlebars
}


null_ls.setup({
  debug = false,
  sources = sources,
})
