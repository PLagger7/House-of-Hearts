local mod = SMODS.current_mod
mod.no_marquee = true

-- Temp mod reference for DebugPlus watch cmd
HouseOfHearts = mod

load(NFS.read(mod.path.."/ModInfo.lua"), "HouseOfHearts/ModInfo")()
load(NFS.read(mod.path.."/achievements.lua"), "HouseOfHearts/Achievements")()

SMODS.Atlas {
    key = "atlas",
    path = "House_of_hearts_atlas.png",
    px = 71,
    py = 95,
    atlas_table = "ASSET_ATLAS"
}
SMODS.Atlas {
    key = 'decks',
    path = 'House_of_hearts_deck.png',
    px = 71,
    py = 95,
    atlas_table = 'ASSET_ATLAS'
}
SMODS.Atlas {
    key = 'modicon',
    path = 'modicon.png',
    px = 34,
    py = 34,
    atlas_table = 'ASSET_ATLAS'
}
SMODS.Atlas {
    key = 'aha_logo',
    path = 'aha_logo.png',
    px = 624,
    py = 633,
    atlas_table = 'ASSET_ATLAS'
}
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

            if #G.hand.highlighted >= 1 and not card.jiggling then
                local eviljiggle = true
                for i = 1, #G.hand.highlighted do
                    if G.hand.highlighted[i]:is_suit(G.GAME.ktb_suit) then
                        eviljiggle = false
                        break
                    else
                        eviljiggle = true
                    end
                end
                if eviljiggle then
                    card.jiggling = true
                    local eval = function (card)
                        if #G.hand.highlighted == 0 then
                            card.jiggling = nil
                            return false
                        end
                        for i = 1, #G.hand.highlighted do
                            if G.hand.highlighted[i]:is_suit(G.GAME.ktb_suit) then
                                eviljiggle = false
                            break
                            else
                                eviljiggle = true
                            end
                        end
                        if not eviljiggle then
                            card.jiggling = nil
                        end
                        return eviljiggle
                    end
                    juice_card_until(card, eval, true)
                end
            end
            

            if context.before and not context.blueprint then
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
                if context.other_card == context.full_hand[#context.full_hand] then
                return{
                    message = localize("k_upgrade_ex")
                }
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
            chips_mod = 8,
            original_pack_choices = 0,
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
        return {vars = {card.ability.extra.chips_mod, card.ability.extra.chips}}
    end,

    calculate = function (self, card, context)
        if context.open_booster and not context.blueprint then
            card.ability.extra.original_pack_choices = G.GAME.pack_choices
        end

        if (context.skipping_booster or context.ending_booster) and not context.blueprint then
            local cards_used
            if context.skipping_booster then
                cards_used = card.ability.extra.original_pack_choices - G.GAME.pack_choices
            else
                cards_used = card.ability.extra.original_pack_choices
            end
            card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chips_mod * cards_used

            return {
                message = localize('k_upgrade_ex'),
                color = G.C.CHIPS
            }
        end

        if context.joker_main then
            return{
                chips = card.ability.extra.chips
            }
        end

    end
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
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,

    calculate = function(self, card, context)
        if context.after and not context.blueprint and next(context.poker_hands['Two Pair']) then
            local highest_rank = {}
            local other_ranks = {}

            local highest_rank_id = 0

            for _, card in pairs(context.scoring_hand) do
                if not SMODS.has_no_rank(card) then
                    local card_id = card:get_id()
                    if card_id > highest_rank_id then
                        highest_rank_id = card_id
                    end
                end
            end
            for _, card in pairs(context.scoring_hand) do
                if not SMODS.has_no_rank(card) then
                    if card:get_id() == highest_rank_id then 
                        highest_rank[#highest_rank+1] = card
                    else
                        other_ranks[#other_ranks+1] = card
                    end
                end
            end
            for i = 1, #other_ranks do
                G.E_MANAGER:add_event(Event({
                    func = function()
                        assert(SMODS.modify_rank(other_ranks[i], -1))
                        other_ranks[i]:juice_up()
                        card:juice_up()
                        return true
                    end
                }))
            end
            for i = 1, #highest_rank do
                G.E_MANAGER:add_event(Event({
                    func = function()
                        assert(SMODS.modify_rank(highest_rank[i], 1))
                        highest_rank[i]:juice_up()
                        card:juice_up()
                        return true
                    end
                }))
            end

            G.E_MANAGER:add_event(Event({
                func = function()
                    local has_ace = false
                    local has_two = false
                    for _, ranks in pairs({highest_rank, other_ranks}) do
                        for _, card in pairs(ranks) do
                            if card:get_id() == 2 then
                                has_two = true
                            elseif card:get_id() == 14 then
                                has_ace = true
                            end
                        end
                    end

                    if has_ace and has_two then
                        check_for_unlock({type = 'training_complete'})
                    end
                    return true
                end
            }))


            return{
                message = localize("k_pumped_ex"),
                colour = G.C.FILTER
            }
        end
    end
}

SMODS.Joker{
    name = '5-A-Day',
    key = '5_a_day',
    config = {
        extra = {
            uses = 3,
        }
    },
    atlas = 'atlas',
    pos = {x = 2, y = 1},
    cost = 6,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = true,

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.uses}}
    end,

    calculate = function(self, card, context)
        if context.after and not context.blueprint and next(context.poker_hands['Flush']) then
            card.ability.extra.uses = card.ability.extra.uses - 1
            for k,v in ipairs(context.full_hand) do
                local enhancement = SMODS.poll_enhancement {
                    key = 'dd_enhancement',
                    guaranteed = true
                }
                G.E_MANAGER:add_event(Event {
                func = function()
                    v:set_ability(enhancement)
                    v:juice_up()
                    card:juice_up()
                    return true
                end
                })
            end
            if card.ability.extra.uses >= 1 then
            return{
                message = localize("k_enhanced_ex"),
                colour = G.C.FILTER
            }
            else
                SMODS.destroy_cards(card, nil, nil, true)
                return {
                    message = localize('k_complete_ex'),
                    colour = G.C.FILTER
                }
            end
        end
    end
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
        if context.skip_blind and not context.blueprint then
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
    config = {
        extra = {
            xmult = 1,
            xm_mod = 0.25
        }
    },
    atlas = 'atlas',
    pos = {x = 4, y = 1},
    cost = 7,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    unlocked = true,
    discovered = true,

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.xm_mod, card.ability.extra.xmult}}
    end,

    calculate = function(self, card, context)
        if context.cards_destroyed and not context.blueprint then
            local bl = 0
            for k, v in ipairs(context.glass_shattered) do
                if v:is_suit("Spades") or v:is_suit("Clubs") then
                    bl = bl + 1
                end
            end
            if bl > 0 then
                G.E_MANAGER:add_event(Event({
                    func = function()
                G.E_MANAGER:add_event(Event({
                    func = function()
                        card.ability.extra.xmult = card.ability.extra.xmult + bl*card.ability.extra.xm_mod
                        return true
                    end
                    }))
                card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize{type = 'variable', key = 'a_xmult', vars = {card.ability.extra.xmult + faces*card.ability.extra.xm_mod}}})
                return true
            end
            }))
            end

            return
        elseif context.remove_playing_cards and not context.bluerpint then
            local bl = 0
                for k, v in ipairs(context.removed) do
                    if v:is_suit("Spades") or v:is_suit("Clubs") then bl = bl + 1 end
                end
                if bl > 0 then
                    card.ability.extra.xmult = card.ability.extra.xmult + bl*card.ability.extra.xm_mod
                    G.E_MANAGER:add_event(Event({
                    func = function() card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize{type = 'variable', key = 'a_xmult', vars = {card.ability.extra.xmult}}}); return true
                    end}))
                end
            return
        elseif context.cardarea == G.jokers and context.joker_main and card.ability.extra.xmult > 1 then
            return {
                message = localize{type='variable',key='a_xmult',vars={card.ability.extra.xmult}},
                Xmult_mod = card.ability.extra.xmult
            }
        end
    end
}

SMODS.Joker{
    name = 'Heart of Gold',
    key = 'heart_of_gold',
    config = {
        extra = 32
    },
    atlas = 'atlas',
    pos = {x = 0, y = 2},
    cost = 8,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra}}
    end,

    calc_dollar_bonus = function(self, card)
        local thunk = card.ability.extra
        if G.GAME.blind.boss then
            return thunk
        end
    end
}

SMODS.Joker{
    name = 'Heartfelt Gift',
    key = 'heartfelt_gift',
    config = {extra = {poker_hand = 'Three of a Kind'}},
    atlas = 'atlas',
    pos = {x = 1, y = 2},
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,

    loc_vars = function (self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS['c_venus']
        info_queue[#info_queue+1] = G.P_CENTERS['c_lovers']
        info_queue[#info_queue+1] = G.P_CENTERS['c_sun']
        info_queue[#info_queue+1] = G.P_CENTERS['c_deja_vu']
        return{
            vars = {localize(card.ability.extra.poker_hand, 'poker_hands')}
        }
    end,

    calculate = function (self, card, context)
        local gift_pool = {'c_venus', 'c_lovers', 'c_sun', 'c_deja_vu'}
        
        if context.joker_main and context.scoring_name == card.ability.extra.poker_hand then
            local gift = pseudorandom_element(gift_pool, 'hoh_heartfelt_gift')
            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
            G.E_MANAGER:add_event(Event({
                trigger = 'before',
                delay = 0.0,
                func = (function()
                    SMODS.add_card {
                        key = gift,
                        key_append = 'heartfelt_gift'
                    }
                    G.GAME.consumeable_buffer = 0
                    return true
                end)
            }))
            return {
                message = localize('k_gifted_ex'),
            }
        end
    end
}

SMODS.Joker{
    name = 'Crimson Chip',
    key = 'crimson_chip',
    config = {
        extra = {
            times = 0,
            r_mod = 1,
            h_mod = 2,
            h_counter = 2
        }
    },
    atlas = 'atlas',
    pos = {x = 2, y = 2},
    cost = 9,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.times, card.ability.extra.r_mod, card.ability.extra.h_mod, card.ability.extra.h_counter}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.play and context.repetition and card.ability.extra.times > 0 then
            return {
                message = localize('k_again_ex'),
                repetitions = card.ability.extra.times,
            }
        elseif context.after and not context.blueprint then
            card.ability.extra.h_counter = card.ability.extra.h_counter - 1
            if card.ability.extra.h_counter == 0 then
                card.ability.extra.times = card.ability.extra.times + card.ability.extra.r_mod
                card.ability.extra.h_counter = card.ability.extra.h_mod
                return {
                    message = localize('k_upgrade_ex'),
                }
            end
        elseif context.cardarea == G.jokers and context.end_of_round and not context.blueprint then
            card.ability.extra.times = 0
            card.ability.extra.h_counter = card.ability.extra.h_mod
            return {
                message = localize('k_reset')
            }
        end
    end
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
                                    heart_card[1]:juice_up()
                                    nonheart_card[1]:juice_up()
                                    card:juice_up()
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
    config = {extra = {xmult = 1, xmult_mod = 0.2}},
    atlas = 'atlas',
    pos = {x = 4, y = 2},
    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,

    update_xmult = function (self, card)
        if G.playing_cards then
            local reds = 0
            for _, card in pairs(G.playing_cards) do
                if SMODS.has_enhancement(card, 'm_mult') then
                    reds = reds + 1
                end
                if card.edition and card.edition.key == 'e_holo' then
                    reds = reds + 1
                end
                if card.seal == 'Red' then
                    reds = reds + 1
                end
            end
            card.ability.extra.xmult = 1 + reds * card.ability.extra.xmult_mod
        end
    end,

    loc_vars = function (self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS['m_mult']
        info_queue[#info_queue+1] = G.P_CENTERS['e_holo']
        info_queue[#info_queue+1] = G.P_SEALS['Red']
        self:update_xmult(card)
        return{
            vars = {card.ability.extra.xmult, card.ability.extra.xmult_mod}
        }
    end,

    calculate = function (self, card, context)
        if context.joker_main then
            self:update_xmult(card)
            return{
                xmult = card.ability.extra.xmult
            }
        end
    end
}


-- DECKS

SMODS.Back{
    key = 'heartbeat',
    atlas = 'decks',
    pos = {x = 0, y = 0},
    config = {seal = 'Red'},
    unlocked = true,

    loc_vars = function (self, info_queue, back)
        return{
            vars = {localize{type = 'name_text', key = self.config.seal}}
        }
    end,

    apply = function (self, back)
        G.E_MANAGER:add_event(Event({
            func = function ()
                for _, card in ipairs(G.playing_cards) do
                    if card.base.suit == 'Hearts' then
                        card:set_seal('Red', true)
                    end
                end
                return true
            end
        }))
    end
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
    G.GAME.ktb_suit = G.GAME.ktb_suit or "Diamonds"
end

mod.reset_game_globals = function(run_start)
	reset_ktb_suit()
end
