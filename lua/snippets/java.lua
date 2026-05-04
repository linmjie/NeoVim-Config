local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

local function basicPrint(shortcut, str)
    return s(shortcut, fmt([[System.out.{}({});]], {
        t(str), i(1)
    }))
end

local function methodReference(shortcut, method)
    return s(shortcut, t('System.out::' .. method))
end

return {
    s('ts', {
        t('this.')
    }),

    s('todo', {
        t('//TODO placeholder method definition'),
        t('return null;')
    }),

    -- TODO: make it check lsp for Optional import
    s('toptof',
        fmt([[Optional<{}>]], {
            i(1)
        })
    ),
    s('optof',
        fmt([[Optional.of({})]], {
            i(1)
        })
    ),
    -- idk if i wanna do nilopt or nullopt
    s('nilopt', {
        t'Optional.empty()'
    }),
    s('nullopt', {
        t'Optional.empty()'
    }),

    basicPrint('sout', 'println'),
    basicPrint('soun', 'print'),
    methodReference('soutref', 'println'),
    methodReference('sounref', 'print'),

    basicPrint('souf', 'printf')
}
