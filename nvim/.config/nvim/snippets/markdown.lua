local ls = require("luasnip") --{{{
local s = ls.s
local i = ls.i
local t = ls.t

local d = ls.dynamic_node
local c = ls.choice_node
local f = ls.function_node
local sn = ls.snippet_node

local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

local snippets, autosnippets = {}, {} --}}}

local function cs(trigger, nodes, opts) --{{{
  local snippet = s(trigger, nodes)
  local target_table = snippets

  if opts ~= nil then
    -- if opts is a string
    if type(opts) == "string" then
      if opts == "auto" then
        target_table = autosnippets
      end

    end
  end

  table.insert(target_table, snippet) -- insert snippet into appropriate table
end --}}}

-- Start Refactoring --

cs(-- [cap] caption snippet {{{
  "cap",
  fmt(
    [[

::: {{custom-style="Case Number"}}
JAMS Arbitration No. {}
:::

::: {{custom-style="Party Name"}}
{},
:::

::: {{custom-style="Party Title"}}
{},
:::

::: {{custom-style="Party Separator"}}
and
:::

::: {{custom-style="Party Name"}}
{},
:::

::: {{custom-style="Party Title"}}
{}.
:::

::: {{custom-style="Title"}}
| {}
:::

  ]] ,
    {
      i(1, "Ref number"),
      i(2, "Claimant Name(s)"),
      c(3, { t("Claimant"), t("Claimants") }),
      i(4, "Respondent Name(s)"),
      c(5, { t("Respondent"), t("Respondents") }),
      i(0, "Scheduling Order No. 1"),
    }
  )
) --}}}

cs(-- [bt2] body text 2 snippet{{{
  "bt2",
  fmt(
    [[

::: {{custom-style="Body Text 2"}}

  {}

:::

  ]] ,
    {
      i(1, ""),
    }
  )
) --}}}

cs(-- [bt3] body text 3 snippet{{{
  "bt3",
  fmt(
    [[

::: {{custom-style="Body Text 3"}}

  {}

:::

  ]] ,
    {
      i(1, ""),
    }
  )
) --}}}

local function signature_block_fmt()
  return fmt(
    [[

::: {{custom-style="Signature Date"}} 
{} 
:::

::: {{custom-style="Signature Line"}}
\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_
:::

::: {{custom-style="Signature Name"}}
Judge Jackson Lucky (Ret.)
:::

::: {{custom-style="Signature Line"}}
Arbitrator
:::

]]
    ,
    t(os.date("%B %d, %Y"))
  )
end

cs(-- [sig] signature block snippet{{{
  { trig = "sig", desc = "signature block" },
  signature_block_fmt()
) --- }}

vim.notify("snippets/markdown.lua loaded")
-- End Refactoring --

return snippets, autosnippets
