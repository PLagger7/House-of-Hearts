
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

function G.FUNCS.hoh_fallen(e)
    love.system.openURL("https://www.twitch.tv/fallenkingdomking_")
end

function G.FUNCS.hoh_aha(e)
    love.system.openURL("https://www.heart.org/")
end

function G.FUNCS.hoh_cpr_tutorial(e)
    love.system.openURL("https://www.youtube.com/watch?v=M4ACYp75mjU")
end

-- Custom Loc Colours
loc_colour()
G.ARGS.LOC_COLOURS.hoh_pink = HEX('E59CD0')
G.ARGS.LOC_COLOURS.hoh_teal = HEX('3AB7B7')

----------------------------------------------------------------------------------------------------------------
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


----------------------------------------------------------------------------------------------------------------
-- Mod Config


HouseOfHearts.config_tab = function ()

    local reset_achievements = UIBox_button({
        minw = 5,
        id = "hoh_reset_achievements",
        button = "hoh_reset_achievements",
        label = {
            localize("hoh_reset_achievements")
        }
    })

    return {n = G.UIT.ROOT, config = {r = 0.1, align = "cm", padding = 0.1, colour = G.C.BLACK, minw = 8, minh = 6}, nodes = {
        {n = G.UIT.R, config = {align = "cl", padding = 0}, nodes = {
            reset_achievements
        }},
    }}
end

-- Copied from Ankh because I can :)
local function custom_overlay_infotip(args)
  local message = args.message or args
  local align = args.align or "bm"
  local offset = args.offset or {x=0,y=0}

  local _infotip_object = G.OVERLAY_MENU:get_UIE_by_ID('overlay_menu_infotip')
  _infotip_object.config.object:remove()
  _infotip_object.config.object = UIBox{
    definition = overlay_infotip(message),
    config = {offset = offset, align = align, parent = _infotip_object}
  }
  _infotip_object.config.object.UIRoot:juice_up()
  _infotip_object.config.set = true
end

local function create_UIBox_reset_achievements_confirm()
  local yes = UIBox_button{ button = "hoh_reset_achievements_actually", label = { localize('hoh_reset_achievements') }, minw = 5}
  local no = UIBox_button({button = 'exit_overlay_menu', label = { localize('hoh_no') }, minw = 5, focus_args = {snap_to = true}})

  local t = create_UIBox_generic_options {
        contents = {
            yes,
            no
        },
        no_back = true,
  }

  G.E_MANAGER:add_event(Event({
    trigger = 'after',
    func = function()
        custom_overlay_infotip {
            message = {localize('hoh_are_you_sure')},
            align = "tm",
            offset = {x = 0, y = -3.3}
        }
        return true
    end
  }))

  return t
end

function G.FUNCS.hoh_reset_achievements(e)
    G.FUNCS.overlay_menu {
        definition = create_UIBox_reset_achievements_confirm(),
    }
end

function G.FUNCS.hoh_reset_achievements_actually(e)
    for _, ach_info in pairs(G.ACHIEVEMENTS) do
        if ach_info.original_mod and ach_info.original_mod.id == HouseOfHearts.id then
            print("Resetting House-of-Hearts achievement "..ach_info.key)
            G.SETTINGS.ACHIEVEMENTS_EARNED[ach_info.key] = nil
            ach_info.earned = false
        end
    end

    G.FUNCS.exit_overlay_menu()
end

----------------------------------------------------------------------------------------------------------------
-- Front page

HouseOfHearts.custom_ui = function(modNodes)
    modNodes[1].nodes[1].config.colour = G.C.RED
    modNodes[1].nodes[1].config.text = localize('hoh_created_by')

    -- Remove mod description text mode
    modNodes[#modNodes] = nil

    -- Controls for the UI layout once you change the text.
    -- Make sure to use DebugPlus mod and run watch command to test updates
    -- Run this command in console:
    -- watch lua Mods/House-Of-Hearts/ModInfo.lua
    -- Then, every time you save this file, reopen menu in-game

    local menu_width = 9
    local text_scale = 1.25
    local image_scale = 2.35
    local image_spacing_R = 0.9
    local image_spacing_L = 0.9
    local yt_scale = 0.6


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
            -- Spacing (Left)
            {
                n = G.UIT.C,
                config = { padding = 0.01, align = "lm", minw = image_spacing_L },
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
            -- Spacing (Right)
            {
                n = G.UIT.C,
                config = { padding = 0.01, align = "lm", minw = image_spacing_R },
                nodes = {
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
    
    local yt_icon = Sprite(0, 0, yt_scale, yt_scale, G.ASSET_ATLAS["hoh_youtube"], {x = 0, y = 0})

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
                                n = G.UIT.O,
                                config = {
                                    object = yt_icon,
                                    shadow = false,
                                }
                            },
                            {
                                n = G.UIT.T,
                                config = {
                                    text = localize('k_hoh_cpr_tutorial'),
                                    shadow = false,
                                    colour = G.C.WHITE,
                                    scale = 0.6,
                                }
                            },
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
                            minw = 4.05,
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

