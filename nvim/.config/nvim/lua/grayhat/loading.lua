local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")
local logo = [[
                                                                                                 
                                                                                                 
                                                                                                 
                                                                                                 
 ░▒▓██████▓▒░ ░▒▓███████▓▒░  ░▒▓██████▓▒░ ░▒▓█▓▒░░▒▓█▓▒░                                         
░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░                                         
░▒▓█▓▒░       ░▒▓█▓▒░ ▒▓█▓▒ ░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░ ░▒▓██████▓▒░░▒▓████████▓▒░
░▒▓█▓▒▒▓███▓▒░░▒▓███████▓▒░ ░▒▓████████▓▒░ ░▒▓██████▓▒░ ░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░  ░▒▓█▓▒░    
░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒▒▓█▓▒░  ░▒▓█▓▒░░▒▓█▓▒░   ░▒▓█▓▒░    ░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░  ░▒▓█▓▒░    
░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒ ░░▒▓█▓▒░░▒▓█▓▒░   ░▒▓█▓▒░    ░▒▓████████▓▒░░▒▓████████▓▒░  ░▒▓█▓▒░    
 ░▒▓██████▓▒░ ░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░   ░▒▓█▓▒░    ░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░  ░▒▓█▓▒░    
                                                        ░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░  ░▒▓█▓▒░    
                                                        ░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░  ░▒▓█▓▒░    
                                                                                                 
                                                                                                 
                                                                                                 
                                                                                                 
                                                                                                 
                                                                                                 
                                                                                                 
                                                                                                 
                                                                                                 
                                                                                                 
                                                                                                 
                                                                                                 
]]

dashboard.section.header.val = vim.split(logo, "\n")
--dashboard.section.header.val = [[ 'Foo' ]]
dashboard.section.header.opts.position = "center"
-- stylua: ignore
dashboard.section.buttons.val = {
--  dashboard.button("n", " " .. " New file",        [[<cmd> ene <BAR> startinsert <cr>]]),
--  dashboard.button("q", " " .. " Quit",            "<cmd> qa <cr>"),
}
--for _, button in ipairs(dashboard.section.buttons.val) do
--  button.opts.hl = "AlphaButtons"
--  button.opts.hl_shortcut = "AlphaShortcut"
--end
--dashboard.section.header.opts.hl = "AlphaHeader"
--dashboard.section.buttons.opts.hl = "AlphaButtons"
dashboard.section.footer.val = require'alpha.fortune'()
--dashboard.section.footer.opts.hl = "AlphaFooter"
dashboard.opts.layout[1].val = 8

alpha.setup(dashboard.opts)
