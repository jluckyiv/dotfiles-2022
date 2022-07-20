local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  return
end

local snip_status_ok, ls = pcall(require, "luasnip")
if not snip_status_ok then
  return
end

local cmp_autopairs_ok, autopairs = pcall(require, 'nvim-autopairs.completion.cmp')
if not cmp_autopairs_ok then
  return
end

require("luasnip.loaders.from_vscode").lazy_load()
-- require("luasnip.loaders.from_lua").lazy_load({ paths = "~/.config/nvim/snippets/" })
require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/snippets/" })


local check_backspace = function()
  local col = vim.fn.col "." - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

--   פּ ﯟ   some other good icons
local kind_icons = {
  Text = "",
  Method = "m",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "",
  Interface = "",
  Module = "",
  Property = "",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = "",
}
-- find more here: https://www.nerdfonts.com/cheat-sheet

cmp.event:on('confirm_done', autopairs.on_confirm_done({ map_char = { tex = '' } }))

cmp.setup {
  snippet = {
    expand = function(args)
      ls.lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  mapping = cmp.mapping.preset.insert {
    -- Accept currently selected item. If none selected, `select` first item.
    -- ["<C-y]"] = cmp.mapping.confirm({ select = true }),
    -- Set `select` to `false` to only confirm explicitly selected items.
    ["<CR>"] = cmp.mapping.confirm { select = false },
    ["<C-n>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
    ["<C-p>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
    ["<C-u>"] = cmp.mapping.scroll_docs(-4),
    ["<C-d>"] = cmp.mapping.scroll_docs(1),
    ["<c-y>"] = cmp.mapping(
      cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Insert,
        select = true,
      },
      { "i", "c" }
    ),

    ["<c-space>"] = cmp.mapping {
      i = cmp.mapping.complete(),
      c = function(
        _ --[[fallback]]
      )
        if cmp.visible() then
          if not cmp.confirm { select = true } then
            return
          end
        else
          cmp.complete()
        end
      end,
    },

    -- ["<C-Space>"] = cmp.mapping.complete(),
    -- ["<C-e>"] = cmp.mapping {
    --   i = cmp.mapping.abort(),
    --   c = cmp.mapping.close(),
    -- },
    --   local copilot_keys = vim.fn["copilot#Accept"]("")
    --
    --   if cmp.visible() then
    --     cmp.select_next_item()
    --   elseif copilot_keys ~= "" then
    --     vim.api.nvim_feedkeys(copilot_keys, "i", false)
    --   elseif luasnip.expandable() then
    --     luasnip.expand()
    --   elseif luasnip.expand_or_jumpable() then
    --     luasnip.expand_or_jump()
    --   elseif check_backspace() then
    --     fallback()
    --   else
    --     fallback()
    --   end
    -- if ls.expand_or_jumpable() then
    --   ls.expand()
    -- elseif check_backspace() then
    --   fallback()
    -- else
    --   fallback()
    -- end
    -- end, {
    --   "i",
    --   "s",
    -- }),
    -- ["<S-Tab>"] = cmp.mapping(function(fallback)
    -- if cmp.visible() then
    -- cmp.select_prev_item()
    -- elseif luasnip.jumpable(-1) then
    --   luasnip.jump(-1)
    -- else
    --   fallback()
    -- end
    --   if ls.jumpable(-1) then
    --     ls.jump(-1)
    --   else
    --     fallback()
    --   end
    -- end, {
    --   "i",
    --   "s",
    -- }),
  },
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      -- Kind icons
      vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
      -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
      vim_item.menu = ({
        nvim_lsp = "[LSP]",
        luasnip = "[Snippet]",
        buffer = "[Buffer]",
        path = "[Path]",
      })[entry.source.name]
      return vim_item
    end,
  },
  sources = {
    { name = "nvim_lua" },
    { name = "copilot" },
    { name = "nvim_lsp" },
    { name = "nvim_lsp_document_symbol" },
    { name = "luasnip" },
    { name = "git" },
    { name = "zsh" },

    { name = "buffer" },
    { name = "path" },


  },
  confirm_opts = {
    -- behavior = cmp.ConfirmBehavior.Replace,
    behavior = cmp.ConfirmBehavior.Insert,
    -- select = false,
    select = true,
  },
  window = {
    documentation = {
      border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
    },
  },
  experimental = {
    ghost_text = true,
    native_menu = false,
  },
}

require("cmp_git").setup()

require("cmp_zsh").setup {
  zshrc = true, -- Source the zshrc (adding all custom completions). default: false
  filetypes = { "deoledit", "zsh" } -- Filetypes to enable cmp_zsh source. default: {"*"}
}
