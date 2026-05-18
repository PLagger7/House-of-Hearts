local mod = SMODS.current_mod
SMODS.Atlas({key = "atlas", path = "House_of_hearts_atlas.png", px = 71, py = 95, atlas_table = "ASSET_ATLAS"}):register()

-- JOKERS

SMODS.Joker{
    name = "Keep The Beat",
    key = "keep_the_beat",
    config = {
        extra = {
            m_mod = 1,
            mult = 0
        }
    },
    pos = {
        x = 0, y = 0
    },
    cost = 5,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    unlocked = true,
    discovered = true,
    atlas = 'atlas',

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.m_mod, localize(G.GAME.ktb_suit or "Diamonds", 'suits_singular'), colours = {G.C.SUITS[G.GAME.ktb_suit or "Diamonds"]},
        card.ability.extra.mult, localize("Diamonds", 'suits_plural'), localize("Clubs", 'suits_plural'), localize("Hearts", 'suits_plural'),
        localize("Spades", 'suits_plural')}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers then
            if context.before and not context.bluerint then
                local cards = false
                for i = 1, #context.scoring_hand do
                    if context.scoring_hand[i]:is_suit(G.GAME.ktb_suit) then cards = true end
                end
                if cards then
                    card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.m_mod
                    return {
                        message = localize('k_upgrade_ex'),
                        colour = G.C.RED,
                    }
                else
                    if card.ability.extra.mult > 0 then
                        card.ability.extra.mult = 0
                        return {
                            message = localize('k_reset')
                        }
                    end
                end
            elseif context.joker_main and card.ability.extra.mult > 0 then
                return{
                    message = localize{type='variable',key='a_mult',vars={card.ability.extra.mult}},
                    mult_mod = card.ability.extra.mult
                }
            elseif context.after then
                change_ktb_suit()
            end
        end
    end
}

SMODS.Joker{
    name = "Wayfarer",
    key = "wayfarer",
    config = {
        extra = {
            m_mod = 2,
            mult = 0
        }
    },
    pos = {
        x = 1, y = 0
    },
    cost = 5,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    unlocked = true,
    discovered = true,
    atlas = 'atlas',

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.m_mod, card.ability.extra.mult}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers then
            if context.before and next(context.poker_hands['Straight']) and not context.blueprint then
                    card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.m_mod
                    return {
                        message = localize('k_upgrade_ex'),
                    }
            elseif context.joker_main and card.ability.extra.mult > 0 then
                return{
                    message = localize{type='variable',key='a_mult',vars={card.ability.extra.mult}},
                    mult_mod = card.ability.extra.mult
                }
            end
        end
    end
}

SMODS.Joker{
    name = "Cyclist",
    key = "cyclist",
    config = {
        extra = {
            m_mod = 4,
            ch_mod = 10,
            mult = 0,
            chips = 0
        }
    },
    pos = {
        x = 2, y = 0
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'atlas',

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.ch_mod, card.ability.extra.m_mod, card.ability.extra.chips, card.ability.extra.mult}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers then
            if context.discard and not context.other_card.debuff  and not context.blueprint then
                if context.other_card:is_suit("Diamonds") or context.other_card:is_suit("Hearts") then
                    card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.m_mod
                elseif context.other_card:is_suit("Clubs") or context.other_card:is_suit("Spades") then
                    card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.ch_mod
                end
            end
            if context.joker_main and (card.ability.extra.chips > 0 or card.ability.extra.mult > 0) then
                return {
                    message = "+"..card.ability.extra.chips.." Chips, +" ..card.ability.extra.mult.." Mult",
                    chip_mod = card.ability.extra.chips,
                    mult_mod = card.ability.extra.mult,
                }
            end
            if context.end_of_round then
                card.ability.extra.mult = 0
                card.ability.extra.chips = 0
                return {
                    message = localize('k_reset')
                }
            end
        end
    end
}

SMODS.Joker{
    name = 'BPM',
    key = 'bpm',
    config = {extra = {chips = 103}},
    pos = {x = 3, y = 0},
    cost = 5,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'atlas',

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.chips}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main then
            local cards = false
            for i = 1, #context.scoring_hand do
                if context.scoring_hand[i]:get_id() == 9 or context.scoring_hand[i]:get_id() == 14 then cards = true end
            end
            if cards then
                return{
                    message = localize{type='variable',key='a_chips',vars={card.ability.extra.chips}},
                    chip_mod = card.ability.extra.chips
                }
            end
        end
    end
}

SMODS.Joker{
    name = 'Jump Rope',
    key = 'jump_rope',
    config = {
        extra = {
            chips = 0,
            c_mod = 15
        }
    },
    atlas = 'atlas',
    pos = {x = 4, y = 0},
    cost = 6,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    unlocked = true,
    discovered = true,

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.c_mod, card.ability.extra.chips}}
    end,

    --calculate = function(self, card, context)
        --if context.open_booster then
            --if context.card then
                --print(card.config.center)
                --card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.c_mod
                --return {
                --    message = localize('k_upgrade_ex'),
                --    colour = G.C.BLUE,
                --}
            --end
        --end
    --end
}

SMODS.Joker{
    name = "Stethoscope",
    key = "stethoscope",
    config = {
        extra = 15
    },
    pos = {
        x = 0, y = 1
    },
    cost = 5,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'atlas',

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main then
            local cards = 0
            for i = 1, #context.full_hand do
                if context.full_hand[i]:get_id() == 11 then cards = cards + 1 -- can't use is_face() because of debuff interaction
                elseif context.full_hand[i]:get_id() == 12 then cards = cards + 1
                elseif context.full_hand[i]:get_id() == 13 then cards = cards + 1 end
            end
            if cards == 1 then
                return{
                    message = localize{type='variable',key='a_mult',vars={card.ability.extra}},
                    mult_mod = card.ability.extra
                }
            end
        end
    end
}

SMODS.Joker{
    name = 'CPR Training',
    key = 'cpr_training',
    config = {},
    atlas = 'atlas',
    pos = {x = 1, y = 1},
    cost = 6,
    rarity = 2
}

SMODS.Joker{
    name = '5-A-Day',
    key = '5_a_day',
    config = {},
    atlas = 'atlas',
    pos = {x = 2, y = 1},
    cost = 6,
    rarity = 2
}

SMODS.Joker{
    name = 'Green Tea',
    key = 'green_tea',
    config = {},
    atlas = 'atlas',
    pos = {x = 3, y = 1},
    cost = 6,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = true,

    add_to_deck = function ()
        TeaTime = true
    end,

    calculate = function (self, card, context)
        if context.skip_blind then
            TeaTime = true
             SMODS.destroy_cards(card, nil, nil, true)
                return {
                    message = localize('k_drank_ex'),
                    colour = G.C.FILTER
                }
        end
    end
}

SMODS.Joker{
    name = 'Pressure Cuff',
    key = 'pressure_cuff',
    config = {},
    atlas = 'atlas',
    pos = {x = 4, y = 1},
    cost = 7,
    rarity = 2
}

SMODS.Joker{
    name = 'Heart of Gold',
    key = 'heart_of_gold',
    config = {},
    atlas = 'atlas',
    pos = {x = 0, y = 2},
    cost = 8,
    rarity = 2
}

SMODS.Joker{
    name = 'Heartfelt Gift',
    key = 'heartfelt_gift',
    config = {},
    atlas = 'atlas',
    pos = {x = 1, y = 2},
    cost = 6,
    rarity = 2
}

SMODS.Joker{
    name = 'Crimson Chip',
    key = 'crimson_chip',
    config = {},
    atlas = 'atlas',
    pos = {x = 2, y = 2},
    cost = 9,
    rarity = 3
}

SMODS.Joker{
    name = 'Share the Love',
    key = 'share_the_love',
    config = {},
    atlas = 'atlas',
    pos = {x = 3, y = 2},
    soul_pos = {x = 0, y = 3},
    cost = 8,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.after then
            if #context.full_hand == 2 then
                local heart_card = {}
                local nonheart_card = {}
                for k, v in ipairs(context.full_hand) do
                    if v:is_suit("Hearts") then heart_card[#heart_card+1] = v
                    else nonheart_card[#nonheart_card+1] = v end
                    if #heart_card == 1 and #nonheart_card == 1 then
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                if nonheart_card[1] ~= heart_card[1] then
                                    copy_card(heart_card[1], nonheart_card[1])
                                end
                                return true
                            end
                        }))
                        return {
                            message = localize('k_copied_ex'),
                            colour = G.C.RED
                        }
                    end
                end
            end
        end
    end
}

SMODS.Joker{
    name = 'Hemoglobin',
    key = 'hemoglobin',
    config = {},
    atlas = 'atlas',
    pos = {x = 4, y = 2},
    cost = 8,
    rarity = 3
}

-- FUNCTIONS

change_ktb_suit = function()
    if G.GAME.ktb_suit then
        local suits = {"Diamonds", "Clubs", "Hearts", "Spades"}
        local i = get_index(suits, G.GAME.ktb_suit)
        if i == #suits then i = 0 end
        G.GAME.ktb_suit = suits[i + 1]
    end
end

TeaTime = false
local ref_skip_blind = G.FUNCS.skip_blind
function G.FUNCS.skip_blind(e)
    if TeaTime then
        G.E_MANAGER:add_event(Event({ --i stole all this from Shenanigans Decks
                trigger = 'before',
                delay = 0.2,
                func = function()
                    G.blind_prompt_box.alignment.offset.y = -10
                    G.blind_select.alignment.offset.y = 40
                    G.blind_select.alignment.offset.x = 0
                    return true
                end
            }))
            G.E_MANAGER:add_event(Event({     -- from G.FUNCS.cash_out
                trigger = 'immediate',
                func = function()
                    if G.round_eval then
                        G.round_eval:remove()
                        G.round_eval = nil
                    end
                    G.GAME.current_round.jokers_purchased = 0
                    G.GAME.current_round.discards_left = math.max(0,
                        G.GAME.round_resets.discards + G.GAME.round_bonus.discards)
                    G.GAME.current_round.hands_left = (math.max(1, G.GAME.round_resets.hands + G.GAME.round_bonus.next_hands))
                    G.STATE = G.STATES.SHOP
                    G.GAME.shop_free = nil
                    G.GAME.shop_d6ed = nil

                    G.blind_select:remove() -- from somewhere else
                    G.blind_prompt_box:remove()
                    G.blind_select = nil

                    G.STATE_COMPLETE = false
                    return true
                end
            }))
        end
    return ref_skip_blind(e)
end

-- RESETS

reset_ktb_suit = function()
    G.GAME.ktb_suit = "Diamonds"
end

mod.reset_game_globals = function(run_start)
	reset_ktb_suit()
end