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
    config = {},
    atlas = 'atlas',
    pos = {x = 4, y = 0},
    cost = 6,
    rarity = 1
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
            for i = 1, #context.scoring_hand do
                if context.scoring_hand[i]:is_face() then cards = cards + 1 end
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
    key = '5-a-day',
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
    rarity = 2
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
    rarity = 3
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

-- RESETS

reset_ktb_suit = function()
    G.GAME.ktb_suit = "Diamonds"
end

mod.reset_game_globals = function(run_start)
	reset_ktb_suit()
end