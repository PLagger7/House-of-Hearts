


-- Reset achievements tracking for this round
local function reset_round_globals()
    G.GAME.hoh_enhanced_round = 0
    G.GAME.hoh_pack_choices_round = 0
end

local mod = SMODS.current_mod

function mod.reset_game_globals(run_start)
    if run_start then
        G.GAME.hoh_windowshopped = 0
    end
end


local new_round_ref = new_round
function new_round()
    reset_round_globals()
    return new_round_ref()
end

local function contains(t, value)
    for _, v in pairs(t) do
        if v == value then
            return true
        end
    end   
end

--  ==================================================================================================================
--  Certification Achievements (9)
--  ==================================================================================================================

--[[

Certification (9)
XXX Wayfarer: Use every Rank in a Straight at least once during a run. [Long Walk]
XXX Cyclist: Have 0 cards remaining in your deck during a round. [Recycled]
XXX BPM: Play a hand of 9 - Ace - Ace in Hearts Suit. [Stayin' Alive]
XXX Jump Rope: Take 4 or more items from a Booster Pack in a single round. [Cross Fit]
XXX 5-A-Day: Create 6 Enhanced Cards in a single round. [Flavor Fanatic]
XXX Green Tea: Skip 5 times throughout 4 consecutive antes [Break Time]
XXX Pressure Cuff: Have a deck with no Black Cards. [No Pressure]
XXX Heart of Gold: Earn $40 or more at Cashout during a run. [Dono-thon]
XXX Share the Love: Play a Flush Five in Hearts Suit. [Contagious Smile]
]]

-----------------
-- No Pressure
-----------------

SMODS.Achievement {
    key = 'no_pressure',
    bypass_all_unlocked = true,
    hidden_text = false,
    hidden_name = false,
    unlock_condition = function (self, args)
        return args.type == 'no_pressure'
    end
}

-----------------
-- Stayin' Alive
-----------------

SMODS.Achievement {
    key = 'stayin_alive',
    bypass_all_unlocked = true,
    hidden_text = false,
    hidden_name = false,
    unlock_condition = function (self, args)
        return args.type == 'stayin_alive'
    end
}

-----------------
-- Long Walk
-----------------

SMODS.Achievement {
    key = 'long_walk',
    bypass_all_unlocked = true,
    hidden_text = false,
    hidden_name = false,
    unlock_condition = function (self, args)
        return args.type == 'straight_ranks_played' and args.amount >= 13
    end
}

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

-----------------
-- Recycled
-----------------

SMODS.Achievement {
    key = 'recycled',
    bypass_all_unlocked = true,
    hidden_text = false,
    hidden_name = false,
    unlock_condition = function (self, args)
        return args.type == 'recycled'
    end
}

-----------------
-- Dono-thon
-----------------

SMODS.Achievement {
    key = 'donothon',
    bypass_all_unlocked = true,
    hidden_text = false,
    hidden_name = false,
    unlock_condition = function (self, args)
        return args.type == 'donothon'
    end
}

-----------------
-- Contagious Smile
-----------------

SMODS.Achievement {
    key = 'contagious_smile',
    bypass_all_unlocked = true,
    hidden_text = false,
    hidden_name = false,
    unlock_condition = function (self, args)
        return args.type == 'contagious_smile'
    end
}

-----------------
-- Break Time
-----------------

SMODS.Achievement{
    key = 'break_time',
    bypass_all_unlocked = true,
    hidden_text = false,
    hidden_name = false,
    unlock_condition = function (self, args)
        return args.type == 'break_time'
    end
}

--  ==================================================================================================================
--  Mastery Achievements (6)
--  ==================================================================================================================


--[[

XXX Keep the Beat: Win a run with Keep the Beat without it ever having reset. [Beat Keeper]
Stethoscope: Trigger the Stethoscope using a card with the same Rank and Suit during all three Blinds of an Ante. [Checkup]
XXX CPR Training: Create both Aces and 2s at the same time using CPR Training [Training Complete]
XXX Heartfelt Gift: Receive each gift at least once from Heartfelt Gift during a run. [Thoughtfulness]
XXX Crimson Chip: Use Crimson Chip to retrigger played cards twice or more in the same hand. [Re-buffed]
XXX Hemoglobin: Have at least 52 cards in your Deck that are Mult Cards, Holographic Cards, or Red Seal Cards. [Circulatory System]

]]



-----------------
-- Beat Keeper
-----------------

SMODS.Achievement {
    key = 'beat_keeper',
    atlas = "achievements_atlas",
    pos = { x = 1, y = 0 },
    hidden_pos = { x = 1, y = 1 },
    bypass_all_unlocked = true,
    hidden_text = false,
    hidden_name = false,
    unlock_condition = function (self, args)
        return args.type == 'keep_the_beat' and args.amount >= 12
    end
}

SMODS.Achievement {
    key = 'checkup',
    atlas = "achievements_atlas",
    pos = { x = 1, y = 0 },
    hidden_pos = { x = 1, y = 1 },
    bypass_all_unlocked = true,
    hidden_text = false,
    hidden_name = false,
    unlock_condition = function (self, args)
        return args.type == 'checkup'
    end
}

HouseOfHearts.stethoscope_triggered = function (card)
    
end

-----------------
-- Training Complete
-----------------

SMODS.Achievement {
    key = 'training_complete',
    atlas = "achievements_atlas",
    pos = { x = 1, y = 0 },
    hidden_pos = { x = 1, y = 1 },
    bypass_all_unlocked = true,
    hidden_text = false,
    hidden_name = false,
    unlock_condition = function (self, args)
        return args.type == 'training_complete'
    end
}

-----------------
-- Circulatory System
-----------------

SMODS.Achievement {
    key = 'circulatory_system',
    atlas = "achievements_atlas",
    pos = { x = 1, y = 0 },
    hidden_pos = { x = 1, y = 1 },
    bypass_all_unlocked = true,
    hidden_text = false,
    hidden_name = false,
    unlock_condition = function (self, args)
        return args.type == 'circulatory_system'
    end
}

-----------------
-- Rebuffed
-----------------

SMODS.Achievement {
    key = 'rebuffed',
    atlas = "achievements_atlas",
    pos = { x = 1, y = 0 },
    hidden_pos = { x = 1, y = 1 },
    bypass_all_unlocked = true,
    hidden_text = false,
    hidden_name = false,
    unlock_condition = function (self, args)
        return args.type == 'rebuffed' and args.amount >= 2
    end
}

-----------------
-- Thoughtfulness
-----------------

SMODS.Achievement {
    key = 'thoughtfulness',
    atlas = "achievements_atlas",
    pos = { x = 1, y = 0 },
    hidden_pos = { x = 1, y = 1 },
    bypass_all_unlocked = true,
    hidden_text = false,
    hidden_name = false,
    unlock_condition = function (self, args)
        return args.type == 'thoughtfulness'
    end
}

HouseOfHearts.calculate = function(self, context)
    if G.playing_cards and (context.playing_card_added or context.change_suit or context.remove_playing_cards) then
        local dark_suits = false
        local decksize = 0
        for _, card in pairs(G.playing_cards) do
            if card.base.suit == 'Spades' or card.base.suit == 'Clubs' then
                dark_suits = true
                decksize = decksize + 1
            elseif not dark_suits then 
                decksize = decksize + 1
            end
            if decksize == #G.playing_cards and not dark_suits then
                check_for_unlock({type = 'no_pressure'})
            end
        end
    end

    if context.hand_drawn and #G.deck.cards <= 0 then
        check_for_unlock({type = 'recycled'})
    end

    local donothon_complete = false
    if G.GAME.current_round.dollars >= 40 and not donothon_complete then
        check_for_unlock({type = 'donothon'})
        donothon_complete = true --This is so it doesn't continue checking after you get the achievement
    end

    if context.open_booster then
        G.GAME.hoh_original_pack_choices = G.GAME.pack_choices
    end

    if context.skipping_booster then
        G.GAME.hoh_original_pack_choices = G.GAME.hoh_original_pack_choices - G.GAME.pack_choices
    end
    if context.ending_booster then
        local cards_used = G.GAME.hoh_original_pack_choices
        G.GAME.hoh_pack_choices_round = G.GAME.hoh_pack_choices_round + cards_used
        check_for_unlock({type = 'pack_choices_round', amount = G.GAME.hoh_pack_choices_round})
    end

    if context.before and next(context.poker_hands['Straight']) then
        G.GAME.straight_ranks_played = G.GAME.straight_ranks_played or {}
        for _, card in pairs(context.scoring_hand) do
            if not SMODS.has_no_rank(card) then
                local rank = card:get_id()
                if not contains(G.GAME.straight_ranks_played, rank) then
                    table.insert(G.GAME.straight_ranks_played, rank)
                end
            end
        end
        check_for_unlock({type = 'straight_ranks_played', amount = #G.GAME.straight_ranks_played})
    end

    if context.before and #context.full_hand == 3 then
        local stayin_alive = true
        for _, card in ipairs(context.full_hand) do
            if not card:is_suit('Hearts') or SMODS.has_no_rank(card) then
                stayin_alive = false
                break
            end
        end

        if stayin_alive and context.full_hand[1]:get_id() == 9 and context.full_hand[2]:get_id() == 14 and context.full_hand[3]:get_id() == 14 then
            check_for_unlock({type = 'stayin_alive'})
        end 
    end

    if context.before and next(context.poker_hands['Flush Five']) then
        local smiles = true
        for _, card in ipairs(context.full_hand) do
            if not card:is_suit('Hearts') or SMODS.has_no_rank(card) then
                smiles = false
                break
            end
        end

        if smiles then
            check_for_unlock({type = 'contagious_smile'})
        end
    end

    if G.playing_cards and (context.playing_card_added or context.change_suit or context.remove_playing_cards) then
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
        if reds >= 52 then
            check_for_unlock({type = 'circulatory_system'})
        end

        if context.skip_blind then
            local ante = G.GAME.round_resets.ante
            G.GAME.blinds_skipped_ante[ante] = G.GAME.blinds_skipped_ante[ante] + 1

            local total_skips = 0

            for i = ante, ante - 4, -1 do
                total_skips = total_skips + (G.GAME.blinds_skipped_ante[i] or 0)
            end
            
            if total_skips >= 5 then
                check_for_unlock({type = 'break_time'})
            end
        end
    end

    -- Reset stethoscope procs at the end of the ante
    if context.ante_end then
        G.GAME.hoh_stethoscope_procs = {}
    end

end
