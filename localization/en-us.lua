return {
	descriptions = {
		Joker = {
			j_hoh_keep_the_beat = {
				name = "Keep the Beat",
				text = {
					"This Joker gains {C:mult}+#1#{} Mult",
					"per {C:attention}consecutive{} hand played with",
					"a scoring {V:1}#2#{} card,",
                    "suit cycles every hand",
                    "{C:inactive}(Currently {C:mult}+#3#{C:inactive} Mult)",
                    "{C:inactive, s:0.8}(#4#, #5#, #6#, #7#){}",
				},
			},
			j_hoh_wayfarer = {
				name = "Wayfarer",
				text = {
					"This Joker gains {C:mult}+#1#{} Mult",
                    "if played hand",
                    "contains a {C:attention}Straight{}",
                    "{C:inactive}(Currently {C:mult}+#2#{C:inactive} Mult)",
				},
			},
			j_3 = {
				name = "Cyclist",
				text = {
                    "This Joker gains {C:chips}+#1#{} Chips",
                    "per {C:spades}Spade{} or {C:clubs}Club{}",
                    "and {C:mult}+#2#{} Mult",
                    "per {C:hearts}Heart{} or {C:diamonds}Diamond{}",
                    "discarded this round",
                    "{C:inactive}(Currently {C:chips}+#3#{C:inactive} Chips and {C:mult}+#4#{C:inactive} Mult)",
				},
			},
			j_4 = {
				name = "BPM",
				text = {
					"{C:chips}+#1#{} Chips if played",
                    "hand contains",
                    "a scoring {C:attention}Ace{} or {C:attention}9{}",
				},
			},
			j_5 = {
				name = "Stethoscope",
				text = {
					"{C:mult}+#1#{} Mult if played",
                    "hand contains",
                    "exactly {C:attention}1 face{} card",
				},
			},
			j_10 = {
				name = "Jump Rope",
				text = {
                    "This Joker gains {C:chips}+#1#{} Chips",
                    "when a {C:attention}Booster Pack{} item",
                    "is chosen",
                    "{C:inactive}(Currently {C:chips}+#3#{C:inactive} Chips)",
				},
			},
			j_6 = {
				name = "CPR Training",
				text = {
					"If played hand contains a {C:attention}Two Pair{}",
                    "increase the rank of {C:attention}higher{} ranked cards",
                    "and decrease the rank of {C:attention}lower{} ranked cards",
                    "{C:inactive}(8 8 5 5 -> 9 9 4 4){}"
				},
			},
			j_7 = {
				name = "5-A-Day",
				text = {
					"If played hand contains a {C:attention}Flush{},",
                    "{C:attention}randomise{} the Enchancements of all",
                    "played cards when scored",
                    "{C:inactive}(#1# uses remaining)",
				},
			},
			j_8 = {
				name = "Green Tea",
				text = {
					"When {C:attention}Blind{} is skipped,",
                    "enter the shop and",
                    "{S:1.1,C:red,E:2}destroy{} this Joker",
				},
			},
			j_9 = {
				name = "Pressure Cuff",
				text = {
                    "This Joker gains {X:mult,C:white} X#1# {} Mult",
                    "for every {C:spades}Spade{} or {C:clubs}Club{} card",
                    "that is destroyed",
                    "{C:inactive}(Currently {X:mult,C:white} X#2# {C:inactive} Mult)"
				},
			},
			j_11 = {
				name = "Heart of Gold",
				text = {
					"When {C:attention}Boss Blind{} is defeated",
                    "earn {C:money}$1{} for every {C:money}$2000{}",
                    "raised during {C:attention}House of Hearts 2025{}",
                    "{C:inactive}($#1#){}"
				},
			},
			j_12 = {
				name = "Heartfelt Gift",
				text = {
					"If played hand contains a {C:attention}Three of a Kind{},",
                    "create a {C:planet, T:c_venus}Venus{}, {C:tarot, T:c_lovers}The Lovers{},",
                    "{C:tarot, T:c_sun}The Sun{}, or {C:spectral, T:c_deja_vu}Deja Vu{} card",
				},
			},
			j_13 = {
				name = "Crimson Chip",
				text = {
					"Retrigger all played cards {C:attention}#1#{} times,",
                    "gain 1 retrigger any {C:attention}#2#{} hands",
                    "played this round"
				},
			},
			j_14 = {
				name = "Share the Love",
				text = {
					"If playted hand contains exactly",
                    "1 {C:hearts}Heart{} card and 1 {C:attention}non-Heart{} card",
                    "convert the {C:attention}non-Heart{} card into the {C:hearts}Heart{} card"
				},
			},
			j_15 = {
				name = "Hemoglobin",
				text = {
					"Gives {X:mult,C:white} X#1# {} Mult",
                    "for each {C:attention}Mult Card{}, {C:dark_edition}Holographic{} card,",
                    "or a card with a {C:red}Red Seal{}",
                    "in your {C:attention}full deck",
                    "{C:inactive}(Currently {X:mult,C:white} X#2# {C:inactive} Mult)",
				},
			},
        },
        Back = {
			b_deck = {
				name = "Deck",
				text = {
					"Effect",
				},
			},
        },
	},
}
