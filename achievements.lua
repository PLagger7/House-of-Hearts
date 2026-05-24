--[[

Keep the Beat: Win a run with Keep the Beat without it ever having reset. [Beat Keeper]
Wayfarer: Use every Rank in a Straight at least once during a run. [Long Walk]
Cyclist: Have 0 cards remaining in your deck during a round. [Recycled]
BPM: Play a hand of 9 - Ace - Ace in Hearts Suit. [Stayin' Alive]
Stethoscope: Trigger the Stethoscope using a card with the same Rank and Suit during all three Blinds of an Ante. [Checkup]
Jump Rope: Take 4 or more items from a Booster Pack in a single round. [Cross Fit]
CPR Training: Create both Aces and 2s at the same time using CPR Training [Training Complete]

5-A-Day: Create 15 Enhanced Cards in a single round. [Flavor Fanatic] X

Green Tea: Leave a Shop without buying anything or re-rolling twice in a row [Refresher]
Pressure Cuff: Have a deck with no Black Cards. [No Pressure]
Heart of Gold: Earn $40 or more at Cashout during a run. [Dono-thon]
Heartfelt Gift: Receive each gift at least once from Heartfelt Gift during a run. [Thoughtfulness]
Crimson Chip: Use Crimson Chip to retrigger played cards twice or more in the same hand. [Re-buffed]
Share the Love: Have at least 2 copies of every Rank in Hearts Suit in your Deck. [Contagious Smile]
Hemoglobin: Have at least 52 cards in your Deck that are Mult Cards, Holographic Cards, or Red Seal Cards. [Circulatory System]

]]


SMODS.Achievement { --No Pressure
    key = 'no_pressure',
    bypass_all_unlocked = true,
    hidden_text = false,
    hidden_name = false,
    unlock_condition = function (self, args)
        return args.type == 'no_pressure'
    end
}

local game_update_ref = Game.update
function Game:update(dt)
    -- 
    return game_update_ref(self, dt)
end

--[[
game_update_ref()
    if G.playing_cards then
    local dark_suits = false
    for _, card in pairs(G.playing_cards) do
        if card.base.suit == 'Spades' or card.base.suit == 'Clubs' then
        dark_suits = true
        elseif not dark_suits then 
            check_for_unlock({type = 'no_pressure'})
        end
    end
end
--]]

SMODS.Achievement {
    key = 'flavor_fanatic',
    bypass_all_unlocked = true,
    hidden_text = false,
    hidden_name = false,
    unlock_condition = function (self, args)
        return args.type == 'test'
    end
}

local card_set_ability = Card.set_ability
function Card:set_ability(center, initial, delay_sprites)
    if center and center.set == "Enhanced" and G.GAME.hoh_in_round then
        G.GAME.hoh_enhanced_round = (G.GAME.hoh_enhanced_round or 0) + 1
        check_for_unlock({type = 'enhanced_round', amount = G.GAME.hoh_enhanced_round})
    end

    return card_set_ability(self, center, initial, delay_sprites)
end

-- Reset achievements tracking for this round
local new_round_ref = new_round
function new_round()
    G.GAME.hoh_enhanced_round = 0
    G.GAME.hoh_in_round = true

    return new_round_ref()
end

HouseOfHearts.calculate = function(self, context)
    
    if context.end_of_round then
        G.GAME.hoh_in_round = false
    end
end
