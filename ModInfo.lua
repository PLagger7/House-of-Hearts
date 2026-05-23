
-- Links

function G.FUNCS.hoh_kitty(e)
    love.system.openURL("https://vgen.co/DottyKitty")
end

function G.FUNCS.hoh_omega(e)
    love.system.openURL("https://www.instagram.com/omegaflowey18")
end

function G.FUNCS.hoh_plagger(e)
    love.system.openURL("https://github.com/PLagger7")
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

function G.FUNCS.hoh_fallen(e)
    love.system.openURL("https://www.twitch.tv/fallenkingdomking_")
end

function G.FUNCS.hoh_aha(e)
    love.system.openURL("https://www.heart.org/")
end

function G.FUNCS.hoh_cpr_tutorial(e)
    love.system.openURL("https://youtu.be/dQw4w9WgXcQ")
end

-- Custom Loc Colours
loc_colour()
G.ARGS.LOC_COLOURS.hoh_pink = HEX('E59CD0')
G.ARGS.LOC_COLOURS.hoh_teal = HEX('3AB7B7')

-- Credits Page

HouseOfHearts.extra_tabs = function()
    return {
        {
            label = localize('k_hoh_credits'),
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

HouseOfHearts.custom_ui = function(modNodes)
    modNodes[1].nodes[1].config.colour = G.C.RED

    -- Remove mod description text mode
    modNodes[#modNodes] = nil

    -- Controls for the UI layout once you change the text.
    -- Make sure to use DebugPlus mod and run watch command to test updates
    -- Run this command in console:
    -- watch lua Mods/House-Of-Hearts/ModInfo.lua
    -- Then, every time you save this file, reopen menu in-game
    
    local menu_width = 9
    local text_scale = 0.78
    local image_scale = 2.35
    local image_spacing = 0.65


    -- UI Code


    local paragraph1 = {}
    localize { type = 'descriptions', key = "hoh_about_aha", set = 'Other', nodes = paragraph1, scale = text_scale, text_colour = G.C.WHITE, }
    paragraph1 = desc_from_rows(paragraph1)
    paragraph1.config.colour = G.C.CLEAR
    -- paragraph1.nodes[1].config.padding = 0.1

    local aha_logo = Sprite(0, 0, image_scale*(624/633), image_scale, G.ASSET_ATLAS["hoh_aha_logo"], {x = 0, y = 0})

    local row1 = {
        n = G.UIT.R,
        config = { align = "cm", padding = 0.07, no_fill = true, minw = menu_width },
        nodes = {
            -- Header + About AHA
            {
                n = G.UIT.C,
                config = { padding = 0.01, align = "lm", },
                nodes = {
                    {
                        n = G.UIT.R,
                        config = { align = "lm", colour = G.C.RED, r = 0.05, padding = 0.05, res = 0.15 },
                        nodes = {
                            { n = G.UIT.T, config = { text = localize("k_hoh_aha_header"), colour = G.C.WHITE, scale = 0.5 },  }
                        },
                    },
                    {
                        n = G.UIT.R,
                        config = { padding = 0.01, align = "lm", },
                        nodes = {
                            paragraph1
                        }
                    },
                }
            },
            -- Spacing
            {
                n = G.UIT.C,
                config = { padding = 0.01, align = "lm", minw = image_spacing },
                nodes = {
                }
            },
            -- AHA Icon
            {
                n = G.UIT.C,
                config = { padding = 0.01, align = "rm", },
                nodes = {
                    {
                        n = G.UIT.O,
                        config = { object = aha_logo }
                    }
                }
            },
        }
    }

    local paragraph2 = {}
    localize { type = 'descriptions', key = "hoh_about_cpr", set = 'Other', nodes = paragraph2, scale = text_scale, text_colour = G.C.WHITE, }
    paragraph2 = desc_from_rows(paragraph2)
    paragraph2.config.colour = G.C.CLEAR
    -- paragraph2.nodes[1].config.padding = 0.1

    local row2 = {
        n = G.UIT.R,
        config = { align = "cm", padding = 0.07, no_fill = true, minw = menu_width },
        nodes = {
            -- About CPR / Fundraiser
            {
                n = G.UIT.C,
                config = { padding = 0.01, align = "cm", },
                nodes = {
                    paragraph2
                }
            },
        }
    }

    local row3 = {
        n = G.UIT.R,
        config = { align = "cm", padding = 0.07, no_fill = true, minw = menu_width },
        nodes = {
            -- CPR button
            {
                n = G.UIT.C,
                config = { padding = 0.01, align = "cm", },
                nodes = {
                    {
                        n = G.UIT.R,
                        config = {
                            padding = 0.2,
                            align = "cm",
                            colour = G.C.RED,
                            r = 0.1,
                            minw = 3.7,
                            hover = true,
                            shadow = true,
                            button = "hoh_cpr_tutorial"
                        },
                        nodes = {
                            {
                                n = G.UIT.T,
                                config = {
                                    text = localize('k_hoh_cpr_tutorial'),
                                    shadow = false,
                                    colour = G.C.WHITE,
                                    scale = 0.6,
                                }
                            }
                        }
                    }
                }
            },
            {
                n = G.UIT.C,
                config = { minw = 0.35, align = "cm" }
            },
            -- AHA button
            {
                n = G.UIT.C,
                config = { padding = 0.01, align = "cm", },
                nodes = {
                    {
                        n = G.UIT.R,
                        config = {
                            padding = 0.2,
                            align = "cm",
                            colour = G.C.WHITE,
                            r = 0.1,
                            minw = 3.7,
                            hover = true,
                            shadow = true,
                            button = "hoh_aha"
                        },
                        nodes = {
                            {
                                n = G.UIT.T,
                                config = {
                                    text = localize('k_hoh_donate_aha'),
                                    shadow = false,
                                    colour = G.C.RED,
                                    scale = 0.6,
                                }
                            }
                        }
                    }
                }
            },
        }
    }

    modNodes[#modNodes + 1] = {
        n = G.UIT.R,
        config = {
            padding = 0.01,
            align = "cm",
        },
        nodes = {
            {
                n = G.UIT.C,
                config = {
                    padding = 0.01,
                    align = "cm",
                },
                nodes = {
                    row1,
                    row2,
                    {
                        n = G.UIT.R,
                        config = { minh = 0.1, align = "cm" }
                    },
                    row3,
                }
            }
        }
    }
end

