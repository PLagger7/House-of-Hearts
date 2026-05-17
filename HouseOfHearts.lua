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
                    print(context.scoring_hand[i].suit)
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
        return {vars = {card.ability.extra.m_mod, card.ability.extra.mult,}}
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