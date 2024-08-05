# BrewCode.nvim

# Introduction
> [!NOTE]
> Brewcode is a custom theme base on Catppuccin theme mix with syntax highlighting style of xcode theme.
> This Theme Originated from a my custom config on zed editor that mixed a catppuccin zed version with vscode xcode theme extensions.

## Why this theme not use overwriting colors?
This theme is based on custom Tree-sitter and LSP color highlighting, making it incapable of being replicated with color overwriting.

## why not create a custom theme?
my theme is mostly a catppuccin theme with some custom color and syntax highlighting, so i decided to fork the catppuccin theme and make my own version of it.
most of the config is the same as the catppuccin theme, but i have added some custom color and syntax highlighting to it.

Finally, I hope you enjoy the theme and if you have any suggestion or issue, feel free to open an issue or pull request.
you can follow rest of catpuccin theme documentation below for custom a theme.

> [!WARNING]
> I don't touch any of catppuccin theme code, i just forked it and make some custom color and syntax highlighting to it(Tree-sitter).
> You just use this like any of catppuccin theme.
<!-- panvimdoc-ignore-end -->

# Features

- Supports both vim and neovim (Requires [neovim](https://github.com/neovim/neovim/) >= 0.8 or [vim](https://github.com/vim/vim) >= 9 compiled with [lua](https://github.com/lua/lua) >= 5.1)
- Highly configurable with 4 different flavours and [ability to create your own!](https://github.com/catppuccin/nvim/discussions/323)
- [Compile](https://github.com/catppuccin/nvim#Compile) user config for [fastest startuptime](https://www.reddit.com/r/neovim/comments/xxfpt3/catppuccinnvim_now_startup_in_1ms/)
- Integrations with lsp, treesitter and [a bunch of plugins](https://github.com/catppuccin/nvim#integrations)
- Supports for [many other applications](https://github.com/catppuccin/catppuccin)

# Installation(Only chnage packages import from this repo)

[lazy.nvim](https://github.com/folke/lazy.nvim)
```lua
{  "Maszz/BrewCode.nvim", name = "catppuccin", priority = 1000 }
```

[packer.nvim](https://github.com/wbthomason/packer.nvim)
```lua
use { "Maszz/BrewCode.nvim", as = "catppuccin" }
```

[vim-plug](https://github.com/junegunn/vim-plug)
```vim
Plug "Maszz/BrewCode.nvim", { 'as': 'catppuccin' }
```

# Usage

```vim
colorscheme catppuccin " catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
```

```lua
vim.cmd.colorscheme "catppuccin"
```

# Configuration

There is no need to call `setup` if you don't want to change the default options and settings.

```lua
require("catppuccin").setup({
    flavour = "auto", -- latte, frappe, macchiato, mocha
    background = { -- :h background
        light = "latte",
        dark = "mocha",
    },
    transparent_background = false, -- disables setting the background color.
    show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
    term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
    dim_inactive = {
        enabled = false, -- dims the background color of inactive window
        shade = "dark",
        percentage = 0.15, -- percentage of the shade to apply to the inactive window
    },
    no_italic = false, -- Force no italic
    no_bold = false, -- Force no bold
    no_underline = false, -- Force no underline
    styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
        comments = { "italic" }, -- Change the style of comments
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
        -- miscs = {}, -- Uncomment to turn off hard-coded styles
    },
    color_overrides = {},
    custom_highlights = {},
    default_integrations = true,
    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        notify = false,
        mini = {
            enabled = true,
            indentscope_color = "",
        },
        -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
    },
})

-- setup must be called before loading
vim.cmd.colorscheme "catppuccin"
```

# Customize highlights

## Get catppuccin colors

```lua
local latte = require("catppuccin.palettes").get_palette "latte"
local frappe = require("catppuccin.palettes").get_palette "frappe"
local macchiato = require("catppuccin.palettes").get_palette "macchiato"
local mocha = require("catppuccin.palettes").get_palette "mocha"
```

Returns a table where the key is the name of the color and the value is its hex value corresponding to each flavour.

## Overwriting colors

Colors can be overwritten using `color_overrides` in the setting, checkout https://github.com/catppuccin/nvim/discussions/323 for inspirations:

```lua
require("catppuccin").setup {
    color_overrides = {
        all = {
            text = "#ffffff",
        },
        latte = {
            base = "#ff0000",
            mantle = "#242424",
            crust = "#474747",
        },
        frappe = {},
        macchiato = {},
        mocha = {},
    }
}
```

> [!Note]
> For more information check out our [style-guide](https://github.com/catppuccin/catppuccin/blob/main/docs/style-guide.md)

## Overwriting highlight groups

Global highlight groups can be overwritten in the setting, for example:

```lua
require("catppuccin").setup {
    custom_highlights = function(colors)
        return {
            Comment = { fg = colors.flamingo },
            TabLineSel = { bg = colors.pink },
            CmpBorder = { fg = colors.surface2 },
            Pmenu = { bg = colors.none },
        }
    end
}
```

Per flavour highlight groups can also be overwritten in the setting, for example:

```lua
require("catppuccin").setup {
    highlight_overrides = {
        all = function(colors)
            return {
                NvimTreeNormal = { fg = colors.none },
                CmpBorder = { fg = "#3e4145" },
            }
        end,
        latte = function(latte)
            return {
                Normal = { fg = latte.base },
            }
        end,
        frappe = function(frappe)
            return {
                ["@comment"] = { fg = frappe.surface2, style = { "italic" } },
            }
        end,
        macchiato = function(macchiato)
            return {
                LineNr = { fg = macchiato.overlay1 },
            }
        end,
        mocha = function(mocha)
            return {
                Comment = { fg = mocha.flamingo },
            }
        end,
    },
}
```

# Integrations

Catppuccin provides theme support for other plugins in the Neovim ecosystem and extended Neovim functionality through _integrations_.

To enable/disable an integration you just need to set it to true/false, for example:

```lua
require("catppuccin").setup({
    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        notify = false,
        mini = {
            enabled = true,
            indentscope_color = "",
        },
    }
})
```

Some integrations are enabled by default, you can control this behaviour with `default_integrations` option.

```lua
require("catppuccin").setup({
    default_integrations = false,
})
```

Below is a list of supported plugins and their corresponding integration module.

> [!Important]
> If you'd like to know which highlight groups are being affected by catppuccin, check out this directory: [`lua/catppuccin/groups/integrations/`](https://github.com/catppuccin/nvim/tree/main/lua/catppuccin/groups/integrations).

<table>
<tr>
<td> <b>Plugin</b> </td> <td> <b>Default</b> </td>
</tr>

<!-- aerial.nvim -->
</tr>
<tr>
<td> <a href="https://github.com/stevearc/aerial.nvim">aerial.nvim</a> </td>
<td>

```lua
aerial = false
```

</td>
</tr>
<!-- aerial.nvim -->

<!-- alpha.nvim -->
</tr>
<tr>
<td> <a href="https://github.com/goolord/alpha-nvim">alpha-nvim</a> </td>
<td>

```lua
alpha = true
```

</td>
</tr>
<!-- alpha.nvim -->

<!-- barbar.nvim -->
</tr>
<tr>
<td> <a href="https://github.com/romgrk/barbar.nvim">barbar.nvim</a> </td>
<td>

```lua
barbar = false
```

</td>
</tr>
<!-- barbar.nvim -->

<!-- barbecue.nvim -->
</tr>
<tr>
<td> <a href="https://github.com/utilyre/barbecue.nvim">barbecue.nvim</a> </td>
<td>

```lua
barbecue = {
    dim_dirname = true, -- directory name is dimmed by default
    bold_basename = true,
    dim_context = false,
    alt_background = false,
},
```

<details> <summary>Special</summary>

Use this to set it up:

```lua
require("barbecue").setup {
  theme = "catppuccin", -- catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
}
```
</details>

</td>
</tr>
<!-- barbecue.nvim -->

<!-- beacon.nvim -->
</tr>
<tr>
<td> <a href="https://github.com/DanilaMihailov/beacon.nvim">beacon.nvim</a> </td>
<td>

```lua
beacon = false
```

</td>
</tr>
<!-- beacon.nvim -->

<!-- bufferline.nvim -->
</tr>
<tr>
<td> <a href="https://github.com/akinsho/bufferline.nvim">bufferline.nvim</a> </td>
<td>

<details> <summary>Special</summary>

Update your bufferline config to use the Catppuccin components:

> [!NOTE]
> bufferline needs to be loaded after setting up catppuccin or it will highlight incorrectly

```lua
use "akinsho/bufferline.nvim" {
  after = "catppuccin",
  config = function()
    require("bufferline").setup {
      highlights = require("catppuccin.groups.integrations.bufferline").get()
    }
  end
}
```

Configurations are self-explanatory, see `:h bufferline-highlights` for detailed explanations:

```lua
local mocha = require("catppuccin.palettes").get_palette "mocha"
bufferline.setup {
    highlights = require("catppuccin.groups.integrations.bufferline").get {
        styles = { "italic", "bold" },
        custom = {
            all = {
                fill = { bg = "#000000" },
            },
            mocha = {
                background = { fg = mocha.text },
            },
            latte = {
                background = { fg = "#000000" },
            },
        },
    },
}
```

</details>

</td>
</tr>
<!-- bufferline.nvim -->

<!-- coc.nvim -->
</tr>
<tr>
<td> <a href="https://github.com/neoclide/coc.nvim">coc.nvim</a> </td>
<td>

```lua
coc_nvim = false
```

<details> <summary>Special</summary>

Setting `enabled` to `true` enables this integration.

```lua
coc_nvim = true,
```
> [!Note]
> coc.nvim by default link to native lsp highlight groups so config from `native_lsp` will also apply to coc

In the inners tables you can set the style for the diagnostics, both `virtual_text` (what you see on the side) and `underlines` (what points directly at the thing (e.g. an error)).

```lua
native_lsp = {
    enabled = true,
    virtual_text = {
        errors = { "italic" },
        hints = { "italic" },
        warnings = { "italic" },
        information = { "italic" },
        ok = { "italic" },
    },
    underlines = {
        errors = { "underline" },
        hints = { "underline" },
        warnings = { "underline" },
        information = { "underline" },
        ok = { "underline" },
    },
    inlay_hints = {
        background = true,
    },
},
```

</details>

</td>
</tr>
<!-- coc.nvim -->

<!-- colorful-winsep.nvim -->
</tr>
<tr>
<td> <a href="https://github.com/nvim-zh/colorful-winsep.nvim">colorful-winsep.nvim</a>
</td>
<td>

```lua
colorful_winsep = {
    enabled = false,
    color = "red",
}
```
</td>
</tr>
<!-- colorful_winsep.nvim -->

<!-- dashboard-nvim -->
</tr>
<tr>
<td> <a href="https://github.com/glepnir/dashboard-nvim">dashboard-nvim</a> </td>
<td>

```lua
dashboard = true
```

</td>
</tr>
<!-- dashboard-nvim -->

<!-- diffview.nvim -->
</tr>
<tr>
<td> <a href="https://github.com/sindrets/diffview.nvim">diffview.nvim</a> </td>
<td>

```lua
diffview = false
```

</td>
</tr>
<!-- diffview.nvim -->

<!-- dropbar.nvim -->
</tr>
<tr>
<td> <a href="https://github.com/Bekaboo/dropbar.nvim">dropbar.nvim</a> </td>
<td>

```lua
dropbar = {
    enabled = false,
    color_mode = false, -- enable color for kind's texts, not just kind's icons
},
```

</td>
</tr>
<!-- dropbar.nvim -->

<!-- feline.nvim -->
</tr>
<tr>
<td> <a href="https://github.com/freddiehaddad/feline.nvim/">feline.nvim</a> </td>
<td>

</details>

<details> <summary>Special</summary>

Update your Feline config to use the Catppuccin components:

```lua
local ctp_feline = require('catppuccin.groups.integrations.feline')

ctp_feline.setup()

require("feline").setup({
    components = ctp_feline.get(),
})
```

Notice that calling `setup()` is optional. You may pass a lua table in order to change assets, settings and the colors per vim mode.

Here are the defaults:

```lua
local clrs = require("catppuccin.palettes").get_palette()
local ctp_feline = require('catppuccin.groups.integrations.feline')
local U = require "catppuccin.utils.colors"

ctp_feline.setup({
    assets = {
        left_separator = "",
        right_separator = "",
        mode_icon = "",
        dir = "󰉖",
        file = "󰈙",
        lsp = {
            server = "󰅡",
            error = "",
            warning = "",
            info = "",
            hint = "",
        },
        git = {
            branch = "",
            added = "",
            changed = "",
            removed = "",
        },
    },
    sett = {
        text = U.vary_color({ latte = latte.base }, clrs.surface0),
        bkg = U.vary_color({ latte = latte.crust }, clrs.surface0),
        diffs = clrs.mauve,
        extras = clrs.overlay1,
        curr_file = clrs.maroon,
        curr_dir = clrs.flamingo,
        show_modified = false -- show if the file has been modified
        show_lazy_updates = false -- show the count of updatable plugins from lazy.nvim
                                  -- need to set checker.enabled = true in lazy.nvim first
                                  -- the icon is set in ui.icons.plugin in lazy.nvim
    },
    mode_colors = {
        ["n"] = { "NORMAL", clrs.lavender },
        ["no"] = { "N-PENDING", clrs.lavender },
        ["i"] = { "INSERT", clrs.green },
        ["ic"] = { "INSERT", clrs.green },
        ["t"] = { "TERMINAL", clrs.green },
        ["v"] = { "VISUAL", clrs.flamingo },
        ["V"] = { "V-LINE", clrs.flamingo },
        [""] = { "V-BLOCK", clrs.flamingo },
        ["R"] = { "REPLACE", clrs.maroon },
        ["Rv"] = { "V-REPLACE", clrs.maroon },
        ["s"] = { "SELECT", clrs.maroon },
        ["S"] = { "S-LINE", clrs.maroon },
        [""] = { "S-BLOCK", clrs.maroon },
        ["c"] = { "COMMAND", clrs.peach },
        ["cv"] = { "COMMAND", clrs.peach },
        ["ce"] = { "COMMAND", clrs.peach },
        ["r"] = { "PROMPT", clrs.teal },
        ["rm"] = { "MORE", clrs.teal },
        ["r?"] = { "CONFIRM", clrs.mauve },
        ["!"] = { "SHELL", clrs.green },
    },
    view = {
        lsp = {
            progress = true, -- if true the status bar will display an lsp progress indicator
            name = false, -- if true the status bar will display the lsp servers name, otherwise it will display the text "Lsp"
            exclude_lsp_names = {}, -- lsp server names that should not be displayed when name is set to true
            separator = "|", -- the separator used when there are multiple lsp servers
        },
    }
})
```

> [!Warning]
> Currently feline [doesn't officially support custom themes](https://github.com/feline-nvim/feline.nvim/issues/302). In order for `:colorscheme catppuccin-<flavour>` to work you could add this autocmd as a workaround:

```lua
vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "*",
    callback = function()
        package.loaded["feline"] = nil
        package.loaded["catppuccin.groups.integrations.feline"] = nil
        require("feline").setup {
            components = require("catppuccin.groups.integrations.feline").get(),
        }
    end,
})
```

</details>

</td>
</tr>
<!-- feline.nvim -->

<!-- fern.vim -->
</tr>
<tr>
<td> <a href="https://github.com/lambdalisue/fern.vim">fern.vim</a> </td>
<td>

```lua
fern = false
```

</td>
</tr>
<!-- fern.vim -->

<!-- fidget.nvim -->
</tr>
<tr>
<td> <a href="https://github.com/j-hui/fidget.nvim">fidget.nvim</a> </td>
<td>

```lua
fidget = false
```

<details> <summary>Special</summary>
Set `notification.window.winblend` to `0`:

```lua
require("fidget").setup {
    notification = {
        window = {
            winblend = 0,
        },
    }
    -- ... the rest of your fidget config
}
```

</details>

</td>
</tr>
<!-- fidget.nvim -->

<!-- flash.nvim -->
</tr>
<tr>
<td> <a href="https://github.com/folke/flash.nvim">flash.nvim</a> </td>
<td>

```lua
flash = true
```
<!-- flash.nvim -->

<!-- gitsigns.nvim -->
</tr>
<tr>
<td> <a href="https://github.com/lewis6991/gitsigns.nvim">gitsigns.nvim</a> </td>
<td>

```lua
gitsigns = true
```
<!-- gitsigns.nvim -->

<!-- grug-far.nvim -->
</tr>
<tr>
<td> <a href="https://github.com/MagicDuck/grug-far.nvim">grug-far.nvim</a> </td>
<td>

```lua
grug_far = false
```
<!-- grug-far.nvim -->

<!-- harpoon -->
</tr>
<tr>
<td> <a href="https://github.com/ThePrimeagen/harpoon">harpoon</a> </td>
<td>

```lua
harpoon = false
```
<!-- harpoon -->

<!-- headlines.nvim -->
</tr>
<tr>
<td> <a href="https://github.com/lukas-reineke/headlines.nvim">headlines.nvim</a> </td>
<td>

```lua
headlines = false
```
<!-- headlines.nvim -->

<!-- hop.nvim -->
</tr>
<tr>
<td> <a href="https://github.com/phaazon/hop.nvim">hop.nvim</a> </td>
<td>

```lua
hop = false
```
<!-- hop.nvim -->

<!-- indent-blankline.nvim -->
</tr>
<tr>
<td> <a href="https://github.com/lukas-reineke/indent-blankline.nvim">indent-blankline.nvim</a> </td>
<td>

```lua
indent_blankline = {
    enabled = true,
    scope_color = "", -- catppuccin color (eg. `lavender`) Default: text
    colored_indent_levels = false,
},

```

<details> <summary>Special</summary>

`colored_indent_levels` enables char highlights per indent level. Follow the instructions [here](https://github.com/lukas-reineke/indent-blankline.nvim#multiple-indent-colors) to set the latter up.

</details>

<!-- indent-blankline.nvim -->

<!-- leap.nvim -->
</tr>
<tr>
<td> <a href="https://github.com/ggandor/leap.nvim">leap.nvim</a> </td>
<td>

```lua
leap = false
```
<!-- leap.nvim -->

<!-- lightline.vim -->
</tr>
<tr>
<td> <a href="https://github.com/itchyny/lightline.vim">lightline.vim</a> </td>
<td>

<details> <summary>Special</summary>

```vim
let g:lightline = {'colorscheme': 'catppuccin'}
```

</details>
<!-- lightline.vim -->

<!-- lightspeed.nvim -->
</tr>
<tr>
<td> <a href="https://github.com/ggandor/lightspeed.nvim">lightspeed.nvim</a> </td>
<td>

```lua
lightspeed = false
```
<!-- lightspeed.nvim -->

<!-- lspsaga.nvim -->
</tr>
<tr>
<td> <a href="https://github.com/glepnir/lspsaga.nvim">lspsaga.nvim</a> </td>
<td>

```lua
lsp_saga = false
```

<details> <summary>Special</summary>

For custom Lsp Kind Icon and Color

```lua
require("lspsaga").setup {
    ui = {
        kind = require("catppuccin.groups.integrations.lsp_saga").custom_kind(),
    },
}
```

</details>
</tr>
<!-- lspsaga.nvim -->

<!-- lualine.nvim -->
<tr>
<td> <a href="https://github.com/nvim-lualine/lualine.nvim">lualine.nvim</a> </td>
<td>

<details> <summary>Special</summary>

```lua
require('lualine').setup {
    options = {
        theme = "catppuccin"
        -- ... the rest of your lualine config
    }
}
```

</details>

<!-- lualine.nvim -->

<!-- markdown -->
</tr>
<tr>
<td> <a href="https://www.markdownguide.org/">markdown</a> </td>
<td>

```lua
markdown = true
```

</td>
</tr>
<!-- markdown -->

<!-- mason.nvim -->
</tr>
<tr>
<td> <a href="https://github.com/williamboman/mason.nvim">mason.nvim</a> </td>
<td>

```lua
mason = false
```

</td>
</tr>
<!-- mason.nvim -->

<!-- mini.nvim -->
</tr>
<tr>
<td> <a href="https://github.com/echasnovski/mini.nvim">mini.nvim</a> </td>
<td>

```lua
mini = {
    enabled = true,
    indentscope_color = "", -- catppuccin color (eg. `lavender`) Default: text
},
```

</td>
</tr>
<!-- mini.nvim -->

<!-- neo-tree.nvim -->
</tr>
<tr>
<td> <a href="https://github.com/nvim-neo-tree/neo-tree.nvim">neo-tree.nvim</a> </td>
<td>

```lua
neotree = false
```

</td>
</tr>
<!-- neo-tree.nvim -->

<!-- neogit -->
</tr>
<tr>
<td> <a href="https://github.com/TimUntersberger/neogit">neogit</a> </td>
<td>

```lua
neogit = true
```

</td>
</tr>
<!-- neogit -->

<!-- neotest -->
</tr>
<tr>
<td> <a href="https://github.com/nvim-neotest/neotest">neotest</a> </td>
<td>

```lua
neotest = false
```

</td>
</tr>
<!-- neotest -->

<!-- noice.nvim -->
</tr>
<tr>
<td> <a href="https://github.com/folke/noice.nvim">noice.nvim</a> </td>
<td>

```lua
noice = false
```

</td>
</tr>
<!-- noice.nvim -->

<!-- NormalNvim -->
</tr>
<tr>
<td> <a href="https://github.com/NormalNvim/NormalNvim">NormalNvim</a> </td>
<td>

```lua
NormalNvim = false
```

</td>
</tr>
<!-- NormalNvim -->

<!-- notifier.nvim -->
</tr>
<tr>
<td> <a href="https://github.com/vigoux/notifier.nvim">notifier.nvim</a> </td>
<td>

```lua
notifier = false
```

</td>
</tr>
<!-- notifier.nvim -->

<!-- nvim-cmp -->
</tr>
<tr>
<td> <a href="https://github.com/hrsh7th/nvim-cmp">nvim-cmp</a> </td>
<td>

```lua
cmp = true
```

</td>
</tr>
<!-- nvim-cmp -->

<!-- nvim-dap -->
</tr>
<tr>
<td> <a href="https://github.com/mfussenegger/nvim-dap">nvim-dap</a> </td>
<td>

```lua
dap = true
```

<details> <summary>Special</a> </summary>

```lua
local sign = vim.fn.sign_define

sign("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = ""})
sign("DapBreakpointCondition", { text = "●", texthl = "DapBreakpointCondition", linehl = "", numhl = ""})
sign("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = ""})
```

</details>

</td>
</tr>
<!-- nvim-dap -->

<!-- nvim-dap-ui -->
</tr>
<tr>
<td> <a href="https://github.com/rcarriga/nvim-dap-ui">nvim-dap-ui</a> </td>
<td>

```lua
dap_ui = true
```

</td>
</tr>
<!-- nvim-dap-ui -->

<!-- nvim-lspconfig -->
</tr>
<tr>
<td> <a href="https://github.com/neovim/nvim-lspconfig">nvim-lspconfig</a> </td>
<td>

```lua
native_lsp = {
    enabled = true,
    virtual_text = {
        errors = { "italic" },
        hints = { "italic" },
        warnings = { "italic" },
        information = { "italic" },
        ok = { "italic" },
    },
    underlines = {
        errors = { "underline" },
        hints = { "underline" },
        warnings = { "underline" },
        information = { "underline" },
        ok = { "underline" },
    },
    inlay_hints = {
        background = true,
    },
},
```

<details> <summary>Special</summary>

In the inners tables you can set the style for the diagnostics, both `virtual_text` (what you see on the side) and `underlines` (what points directly at the thing (e.g. an error)).

</details>

</td>
</tr>
<!-- nvim-lspconfig -->

<!-- navic -->
</tr>
<tr>
<td> <a href="https://github.com/SmiteshP/nvim-navic">navic</a> </td>
<td>

```lua
navic = {
    enabled = false,
    custom_bg = "NONE", -- "lualine" will set background to mantle
},

```
<details> <summary>Special</summary>

```lua
-- You NEED to enable highlight in nvim-navic setting or it won't work
require("nvim-navic").setup {
    highlight = true
}
```

</details>

</td>
</tr>
<!-- navic -->

<!-- nvim-notify -->
</tr>
<tr>
<td> <a href="https://github.com/rcarriga/nvim-notify">nvim-notify</a> </td>
<td>

```lua
notify = false
```

</td>
</tr>
<!-- nvim-notify -->

<!-- nvim-semantic-tokens -->
</tr>
<tr>
<td> <a href="https://neovim.io/doc/user/lsp.html#lsp-semantic-highlight">nvim-semantic-tokens</a> </td>
<td>

```lua
semantic_tokens = true
```

</td>
</tr>
<!-- nvim-semantic-tokens -->

<!-- nvim-surround -->
</tr>
<tr>
<td> <a href="https://github.com/kylechui/nvim-surround">nvim-surround</a> </td>
<td>

```lua
nvim_surround = false
```

</td>
</tr>
<!-- nvim-surround -->

<!-- nvim-tree.lua -->
</tr>
<tr>
<td> <a href="https://github.com/kyazdani42/nvim-tree.lua">nvim-tree.lua</a> </td>
<td>

```lua
nvimtree = true
```

</td>
</tr>
<!-- nvim-tree.lua -->

<!-- nvim-treesitter-context -->
</tr>
<tr>
<td> <a href="https://github.com/nvim-treesitter/nvim-treesitter-context">nvim-treesitter-context</a> </td>
<td>

```lua
treesitter_context = true
```

</td>
</tr>
<!-- nvim-treesitter-context -->

<!-- nvim-treesitter -->
</tr>
<tr>
<td> <a href="https://github.com/nvim-treesitter/nvim-treesitter">nvim-treesitter</a> </td>
<td>

```lua
treesitter = true
```

</td>
</tr>
<!-- nvim-treesitter -->

<!-- nvim-ts-rainbow2 -->
</tr>
<tr>
<td> <a href="https://github.com/HiPhish/nvim-ts-rainbow2">nvim-ts-rainbow2</a> </td>
<td>

```lua
ts_rainbow2 = false
```

</td>
</tr>
<!-- nvim-ts-rainbow2 -->

<!-- nvim-ts-rainbow -->
</tr>
<tr>
<td> <a href="https://github.com/p00f/nvim-ts-rainbow">nvim-ts-rainbow</a> </td>
<td>

```lua
ts_rainbow = false
```

</td>
</tr>
<!-- nvim-ts-rainbow -->

<!-- nvim-ufo -->
</tr>
<tr>
<td> <a href="https://github.com/kevinhwang91/nvim-ufo">nvim-ufo</a> </td>
<td>

```lua
ufo = true
```

</td>
</tr>
<!-- nvim-ufo -->

<!-- nvim-window-picker -->
</tr>
<tr>
<td> <a href="https://github.com/s1n7ax/nvim-window-picker">nvim-window-picker</a> </td>
<td>

```lua
window_picker = false
```
<!-- nvim-window-picker -->

<!-- octo.nvim -->
</tr>
<tr>
<td> <a href="https://github.com/pwntester/octo.nvim">octo.nvim</a> </td>
<td>

```lua
octo = false
```

</td>
</tr>
<!-- octo.nvim -->

<!-- overseer.nvim -->
</tr>
<tr>
<td> <a href="https://github.com/stevearc/overseer.nvim">overseer.nvim</a> </td>
<td>

```lua
overseer = false
```

</td>
</tr>
<!-- overseer.nvim -->

<!-- pounce.nvim -->
</tr>
<tr>
<td> <a href="https://github.com/rlane/pounce.nvim">pounce.nvim</a> </td>
<td>

```lua
pounce = false
```

</td>
</tr>
<!-- pounce.nvim -->

<!-- rainbow-delimiters.nvim -->
</tr>
<tr>
<td> <a href="https://github.com/HiPhish/rainbow-delimiters.nvim">rainbow-delimiters.nvim</a> </td>
<td>

```lua
rainbow_delimiters = true
```

</td>
</tr>
<!-- rainbow-delimiters.nvim -->

<!-- reactive.nvim -->
</tr>
<tr>
<td> <a href="https://github.com/rasulomaroff/reactive.nvim">reactive.nvim</a> </td>
<td>

<details> <summary>Special</summary>

There're 2 available presets (`cursor` and `cursorline`) for every flavour.

Here is how you can use them.

```lua
require('reactive').setup {
  load = { 'catppuccin-mocha-cursor', 'catppuccin-mocha-cursorline' }
}
```

To use another flavour just replace `mocha` with the one you want to use.

</details>

</td>
</tr>
<!-- reactive.nvim -->

<!-- markdown.nvim -->
</tr>
<tr>
<td> <a href="https://github.com/MeanderingProgrammer/markdown.nvim">render-markdown (markdown.nvim)</a> </td>
<td>

```lua
render_markdown = true
```

</td>
</tr>
<!-- markdown.nvim -->

<!-- symbols-outline.nvim -->
</tr>
<tr>
<td> <a href="https://github.com/simrat39/symbols-outline.nvim">symbols-outline.nvim</a> </td>
<td>

> [!NOTE]
> This plugin has been archived by the author, consider using [outline.nvim](https://github.com/hedyhli/outline.nvim)

```lua
symbols_outline = false
```

</td>
</tr>
<!-- symbols-outline.nvim -->

<!-- telekasten.nvim -->
</tr>
<tr>
<td> <a href="https://github.com/renerocksai/telekasten.nvim">telekasten.nvim</a> </td>
<td>

```lua
telekasten = false
```

</td>
</tr>
<!-- telekasten.nvim -->

<!-- telescope.nvim -->
</tr>
<tr>
<td> <a href="https://github.com/nvim-telescope/telescope.nvim">telescope.nvim</a> </td>
<td>

```lua
telescope = {
    enabled = true,
    -- style = "nvchad"
}
```

</td>
</tr>
<!-- telescope.nvim -->

<!-- trouble.nvim -->
</tr>
<tr>
<td> <a href="https://github.com/folke/trouble.nvim">trouble.nvim</a> </td>
<td>

```lua
lsp_trouble = false
```

</td>
</tr>
<!-- trouble.nvim -->

<!-- vim-airline -->
</tr>
<tr>
<td> <a href="https://github.com/vim-airline/vim-airline">vim-airline</a> </td>
<td>

<details> <summary>Special</summary>

```vim
let g:airline_theme = 'catppuccin'
```

</details>

</td>
</tr>
<!-- vim-airline -->

<!-- vim-clap -->
</tr>
<tr>
<td> <a href="https://github.com/liuchengxu/vim-clap">vim-clap</a> </td>
<td>

<details> <summary>Special</summary>

Use this to set it up:

```vim
let g:clap_theme = 'catppuccin'
```

</details>

</td>
</tr>
<!-- vim-clap -->

<!-- vim-gitgutter -->
</tr>
<tr>
<td> <a href="https://github.com/airblade/vim-gitgutter">vim-gitgutter</a> </td>
<td>

```lua
gitgutter = false
```

</td>
</tr>
<!-- vim-gitgutter -->

<!-- vim-illuminate -->
</tr>
<tr>
<td> <a href="https://github.com/RRethy/vim-illuminate">vim-illuminate</a> </td>
<td>

```lua
illuminate = {
    enabled = true,
    lsp = false
}
```

</td>
</tr>
<!-- vim-illuminate -->

<!-- vim-sandwich -->
</tr>
<tr>
<td> <a href="https://github.com/machakann/vim-sandwich">vim-sandwich</a> </td>
<td>

```lua
sandwich = false
```

</td>
</tr>
<!-- vim-sandwich -->

<!-- vim-sneak -->
</tr>
<tr>
<td> <a href="https://github.com/justinmk/vim-sneak">vim-sneak</a> </td>
<td>

```lua
vim_sneak = false
```

</td>
</tr>
<!-- vim-sneak -->

<!-- vimwiki -->
</tr>
<tr>
<td> <a href="https://github.com/vimwiki/vimwiki">vimwiki</a> </td>
<td>

```lua
vimwiki = false
```

</td>
</tr>
<!-- vimwiki -->

<!-- which-key.nvim -->
</tr>
<tr>
<td> <a href="https://github.com/folke/which-key.nvim">which-key.nvim</a> </td>
<td>

```lua
which_key = false
```

</td>
</tr>
<!-- which-key.nvim -->

</table>

# Compile

> **Important**
> As of 7/10/2022, catppuccin should be able to automatically recompile when the setup table changed.

Catppuccin is a highly customizable and configurable colorscheme. This does however come at the cost of complexity and execution time. Catppuccin can pre compute the results of your configuration and store the results in a compiled lua file. We use these precached values to set it's highlights.

By default catppuccin writes the compiled results into the system's cache directory. You can change the cache dir using:

```lua
require("catppuccin").setup({ -- Note: On windows we replace `/` with `\` by default
    compile_path = vim.fn.stdpath "cache" .. "/catppuccin"
})
```

# FAQ

## Wrong treesitter highlights

Please disable `additional_vim_regex_highlighting`

```lua
require("nvim-treesitter.configs").setup {
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false
    },
}
```

## Colors doesn't match preview screenshots

Catppuccin requires true color support AKA terminals support the full range of 16 million colors

- Supported: iterm2 (macOS), kitty, wezterm, alacritty, tmux, ...

Full list of support terminals can be found here: <https://github.com/termstandard/colors#truecolor-support-in-output-devices>

- Unsupported terminal: Terminal.app (macOS), Terminus, Terminology, ...

Full list of Unsupported terminals can be found here: <https://github.com/termstandard/colors#not-supporting-truecolor>

### For tmux users

- [Enable true color support](https://gist.github.com/andersevenrud/015e61af2fd264371032763d4ed965b6) to fix the following [abnormal colors](https://github.com/catppuccin/nvim/issues/415):

![image](https://user-images.githubusercontent.com/1941785/220280749-c3ab52fb-9b8a-4f04-ab98-f8c1bb41f84b.png)

- [Enable italic font support](https://gist.github.com/gyribeiro/4192af1aced7a1b555df06bd3781a722) to fix the following [incorrect if, then, else, end highlights](https://github.com/catppuccin/nvim/issues/428):

![image](https://user-images.githubusercontent.com/13246770/224011118-dcf0f567-650a-4eb2-8be6-0af5cf435501.png)

<!-- panvimdoc-ignore-start -->

&nbsp;

<p align="center"><img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/footers/gray0_ctp_on_line.svg?sanitize=true" /></p>
<p align="center">Copyright &copy; 2021-present <a href="https://github.com/catppuccin" target="_blank">Catppuccin Org</a>
<p align="center"><a href="https://github.com/catppuccin/catppuccin/blob/main/LICENSE"><img src="https://img.shields.io/static/v1.svg?style=for-the-badge&label=License&message=MIT&logoColor=d9e0ee&colorA=363a4f&colorB=b7bdf8"/></a></p>

<!-- panvimdoc-ignore-end -->
