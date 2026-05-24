
-- Reset achievements tracking for this round
local function reset_round_globals()
    G.GAME.hoh_enhanced_round = 0
    G.GAME.hoh_pack_choices_round = 0
end

local new_round_ref = new_round
function new_round()
    reset_round_globals()

    return new_round_ref()
end

--  ==================================================================================================================
--  Certification Achievements (9)
--  ==================================================================================================================

--[[

Certification (9)
Wayfarer: Use every Rank in a Straight at least once during a run. [Long Walk]
Cyclist: Have 0 cards remaining in your deck during a round. [Recycled]
BPM: Play a hand of 9 - Ace - Ace in Hearts Suit. [Stayin' Alive]
XXX Jump Rope: Take 4 or more items from a Booster Pack in a single round. [Cross Fit]
XXX 5-A-Day: Create 6 Enhanced Cards in a single round. [Flavor Fanatic]
??? Green Tea: Leave a Shop without buying anything or re-rolling twice in a row [Refresher]
Pressure Cuff: Have a deck with no Black Cards. [No Pressure]
Heart of Gold: Earn $40 or more at Cashout during a run. [Dono-thon]
Share the Love: Play a Flush Five in Hearts Suit. [Contagious Smile]
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

-----------------
-- Flavor Fanatic
-----------------

SMODS.Achievement {
    key = 'flavor_fanatic',
    bypass_all_unlocked = true,
    hidden_text = false,
    hidden_name = false,
    unlock_condition = function (self, args)
        return args.type == 'enhanced_round' and args.amount >= 6
    end
}

local card_set_ability = Card.set_ability
function Card:set_ability(center, initial, delay_sprites)
    if center and center.set == "Enhanced" then
        if self.area == G.play or self.area == G.hand then
            self.hoh_just_enhanced = nil
            G.GAME.hoh_enhanced_round = (G.GAME.hoh_enhanced_round or 0) + 1
            check_for_unlock({type = 'enhanced_round', amount = G.GAME.hoh_enhanced_round})
        else
            -- Cache newly created enhanced cards (i.e. when creating one with DNA / Standard pack / etc.)
            self.hoh_just_enhanced = true
        end
    end

    return card_set_ability(self, center, initial, delay_sprites)
end

local cardarea_emplace = CardArea.emplace
function CardArea:emplace(card, location, stay_flipped)
    if card.hoh_just_enhanced and (self == G.play or self == G.hand or self == G.deck) then
        card.hoh_just_enhanced = nil
        G.GAME.hoh_enhanced_round = (G.GAME.hoh_enhanced_round or 0) + 1
        check_for_unlock({type = 'enhanced_round', amount = G.GAME.hoh_enhanced_round})
    else
        card.hoh_just_enhanced = nil
    end
    return cardarea_emplace(self, card, location, stay_flipped)
end

-----------------
-- Cross Fit
-----------------

SMODS.Achievement {
    key = 'cross_fit',
    bypass_all_unlocked = true,
    hidden_text = false,
    hidden_name = false,
    unlock_condition = function (self, args)
        return args.type == 'pack_choices_round' and args.amount >= 4
    end
}



--  ==================================================================================================================
--  Mastery Achievements (6)
--  ==================================================================================================================


--[[

Keep the Beat: Win a run with Keep the Beat without it ever having reset. [Beat Keeper]
Stethoscope: Trigger the Stethoscope using a card with the same Rank and Suit during all three Blinds of an Ante. [Checkup]
XXX CPR Training: Create both Aces and 2s at the same time using CPR Training [Training Complete]
Heartfelt Gift: Receive each gift at least once from Heartfelt Gift during a run. [Thoughtfulness]
Crimson Chip: Use Crimson Chip to retrigger played cards twice or more in the same hand. [Re-buffed]
Hemoglobin: Have at least 52 cards in your Deck that are Mult Cards, Holographic Cards, or Red Seal Cards. [Circulatory System]

]]



-----------------
-- Training Complete
-----------------

SMODS.Achievement {
    key = 'training_complete',
    bypass_all_unlocked = true,
    hidden_text = false,
    hidden_name = false,
    unlock_condition = function (self, args)
        return args.type == 'training_complete'
    end
}









HouseOfHearts.calculate = function(self, context)

    if context.open_booster then
        G.GAME.hoh_original_pack_choices = G.GAME.pack_choices
    end

    if context.skipping_booster or context.ending_booster then
        local cards_used
        if context.skipping_booster then
            cards_used = G.GAME.hoh_original_pack_choices - G.GAME.pack_choices
        else
            cards_used = G.GAME.hoh_original_pack_choices
        end
        G.GAME.hoh_original_pack_choices = nil
        G.GAME.hoh_pack_choices_round = G.GAME.hoh_pack_choices_round + cards_used
        check_for_unlock({type = 'pack_choices_round', amount = G.GAME.hoh_pack_choices_round})
    end

end
