
-- Links

function G.FUNCS.hoh_kitty(e)
    love.system.openURL("https://vgen.co/DottyKitty")
end

function G.FUNCS.hoh_omega(e)
    love.system.openURL("https://www.instagram.com/omegaflowey18")
end

function G.FUNCS.hoh_plagger(e)
    love.system.openURL("https://plagger.carrd.co/")
end

function G.FUNCS.hoh_lava(e)
    love.system.openURL("https://github.com/KilledByLava")
end

function G.FUNCS.hoh_doc(e)
    love.system.openURL("https://www.youtube.com/@drspectred")
end

function G.FUNCS.hoh_stupxd(e)
    love.system.openURL("https://github.com/stupxd")
end

-- Custom Loc Colours
loc_colour()
G.ARGS.LOC_COLOURS.hoh_pink = HEX('E59CD0')
G.ARGS.LOC_COLOURS.hoh_teal = HEX('3AB7B7')

-- Credits Page

SMODS.current_mod.extra_tabs = function()
    return {
        {
            label = "Credits",
            tab_definition_function = function()
                local modNodes = {}

                -- Copied from JoyousSpring by N' (https://github.com/nh6574)
                modNodes[#modNodes + 1] = {}
                localize { type = 'descriptions', key = "hoh_credits", set = 'Other', nodes = modNodes[#modNodes], scale = 1.4, text_colour = G.C.WHITE, }
                modNodes[#modNodes] = desc_from_rows(modNodes[#modNodes])
                modNodes[#modNodes].config.colour = G.C.CLEAR
                modNodes[#modNodes].nodes[1].config.padding = 0.1

                return {
                    n = G.UIT.ROOT,
                    config = {
                        emboss = 0.05,
                        minh = 6,
                        r = 0.1,
                        minw = 6,
                        align = "tm",
                        padding = 0.2,
                        colour = G.C.BLACK
                    },
                    nodes = modNodes
                }
            end
        },
    }
end


-- Front page


-- TODO Some links to AHA ?

