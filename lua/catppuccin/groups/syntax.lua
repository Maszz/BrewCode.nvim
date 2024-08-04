local M = {}

function M.get()
    return {
        Comment = { fg = "#7f849c", style = { "italic" } },
        Constant = { fg = "#fab387" },                          -- (preferred) any constant
        String = { fg = "#FFA07A", style = {} },                -- a string constant: "this is a string"
        Character = { fg = "#FFA07A" },                         --  a character constant: 'c', '\n'
        Number = { fg = "#fab387", style = {} },                --   a number constant: 234, 0xff
        Float = { link = "Number" },                            --    a floating point constant: 2.3e10
        Boolean = { fg = "#fab387", style = {} },               --  a boolean constant: TRUE, false
        Identifier = { fg = "#cad3f5", style = {} },            -- (preferred) any variable name
        Function = { fg = "#8caaee", style = {} },              -- function name (also: methods for classes)
        Statement = { fg = "#FF7AB2" },                         -- (preferred) any statement
        Conditional = { fg = "#FF7AB2", style = { "italic" } }, --  if, then, else, endif, switch, etc.
        Repeat = { fg = "#FF7AB2", style = {} },                --   for, do, while, etc.
        Label = { fg = "#FF7AB2" },                             --    case, default, etc.
        Operator = { fg = "#A167E6", style = {} },              -- "sizeof", "+", "*", etc.
        Keyword = { fg = "#FF7AB2", style = {} },               --  any other keyword
        Exception = { fg = "#FF7AB2", style = {} },             --  try, catch, throw

        PreProc = { fg = "#FFA14F" },                           -- (preferred) generic Preprocessor
        Include = { fg = "#FFA14F", style = {} },               --  preprocessor #include
        Define = { link = "PreProc" },                          -- preprocessor #define
        Macro = { fg = "#FFA14F" },                             -- same as Define
        PreCondit = { link = "PreProc" },                       -- preprocessor #if, #else, #endif, etc.

        StorageClass = { fg = "#FF7AB2" },                      -- static, register, volatile, etc.
        Structure = { fg = "#FF7AB2" },                         --  struct, union, enum, etc.
        Special = { fg = "#FFA07A" },                           -- (preferred) any special symbol
        Type = { fg = "#f9e2af", style = {} },                  -- (preferred) int, long, char, etc.
        Typedef = { link = "Type" },                            --  A typedef
        SpecialChar = { link = "Special" },                     -- special character in a constant
        Tag = { fg = "#FF7AB2", style = { "bold" } },           -- you can use CTRL-] on this
        Delimiter = { fg = "#9399b2" },                         -- character that needs attention
        Debug = { link = "Special" },                           -- debugging statements


        Underlined = { style = { "underline" } }, -- (preferred) text that stands out, HTML links
        Bold = { style = { "bold" } },
        Italic = { style = { "italic" } },
        -- ("Ignore", below, may be invisible...)
        -- Ignore = { }, -- (preferred) left blank, hidden  |hl-Ignore|

        Error = { fg = C.red },                                      -- (preferred) any erroneous construct
        Todo = { bg = C.flamingo, fg = C.base, style = { "bold" } }, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX
        qfLineNr = { fg = C.yellow },
        qfFileName = { fg = C.blue },
        htmlH1 = { fg = C.pink, style = { "bold" } },
        htmlH2 = { fg = C.blue, style = { "bold" } },
        -- mkdHeading = { fg = C.peach, style = { "bold" } },
        -- mkdCode = { bg = C.terminal_black, fg = C.text },
        mkdCodeDelimiter = { bg = C.base, fg = C.text },
        mkdCodeStart = { fg = C.flamingo, style = { "bold" } },
        mkdCodeEnd = { fg = C.flamingo, style = { "bold" } },
        -- mkdLink = { fg = C.blue, style = { "underline" } },

        -- debugging
        debugPC = { bg = O.transparent_background and C.none or C.crust }, -- used for highlighting the current line in terminal-debug
        debugBreakpoint = { bg = C.base, fg = C.overlay0 },                -- used for breakpoint colors in terminal-debug
        -- illuminate
        illuminatedWord = { bg = C.surface1 },
        illuminatedCurWord = { bg = C.surface1 },
        -- diff
        diffAdded = { fg = C.green },
        diffRemoved = { fg = C.red },
        diffChanged = { fg = C.blue },
        diffOldFile = { fg = C.yellow },
        diffNewFile = { fg = C.peach },
        diffFile = { fg = C.blue },
        diffLine = { fg = C.overlay0 },
        diffIndexLine = { fg = C.teal },
        DiffAdd = { bg = U.darken(C.green, 0.18, C.base) },   -- diff mode: Added line |diff.txt|
        DiffChange = { bg = U.darken(C.blue, 0.07, C.base) }, -- diff mode: Changed line |diff.txt|
        DiffDelete = { bg = U.darken(C.red, 0.18, C.base) },  -- diff mode: Deleted line |diff.txt|
        DiffText = { bg = U.darken(C.blue, 0.30, C.base) },   -- diff mode: Changed text within a changed line |diff.txt|
        -- NeoVim
        healthError = { fg = C.red },
        healthSuccess = { fg = C.teal },
        healthWarning = { fg = C.yellow },
        -- misc

        -- glyphs
        GlyphPalette1 = { fg = C.red },
        GlyphPalette2 = { fg = C.teal },
        GlyphPalette3 = { fg = C.yellow },
        GlyphPalette4 = { fg = C.blue },
        GlyphPalette6 = { fg = C.teal },
        GlyphPalette7 = { fg = C.text },
        GlyphPalette9 = { fg = C.red },

        -- rainbow
        rainbow1 = { fg = C.red },
        rainbow2 = { fg = C.peach },
        rainbow3 = { fg = C.yellow },
        rainbow4 = { fg = C.green },
        rainbow5 = { fg = C.sapphire },
        rainbow6 = { fg = C.lavender },

        -- csv
        csvCol0 = { fg = C.red },
        csvCol1 = { fg = C.peach },
        csvCol2 = { fg = C.yellow },
        csvCol3 = { fg = C.green },
        csvCol4 = { fg = C.sky },
        csvCol5 = { fg = C.blue },
        csvCol6 = { fg = C.lavender },
        csvCol7 = { fg = C.mauve },
        csvCol8 = { fg = C.pink },
    }
end

return M
