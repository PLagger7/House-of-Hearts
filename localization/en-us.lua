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
            j_hoh_cyclist = {
                name = "Cyclist",
                text = {
                    "This Joker gains {C:chips}+#1#{} Chips",
                    "per {C:spades}Spade{} or {C:clubs}Club{} card",
                    "and {C:mult}+#2#{} Mult per {C:hearts}Heart{} or {C:diamonds}Diamond{}",
                    "card discarded this round",
                    "{C:inactive}(Currently {C:chips}+#3#{C:inactive} Chips and {C:mult}+#4#{C:inactive} Mult)",
                },
            },
            j_hoh_bpm = {
                name = "BPM",
                text = {
                    "{C:chips}+#1#{} Chips if played",
                    "hand contains",
                    "a scoring {C:attention}Ace{} or {C:attention}9{}",
                },
            },
            j_hoh_stethoscope = {
                name = "Stethoscope",
                text = {
                    "{C:mult}+#1#{} Mult if played",
                    "hand contains",
                    "exactly {C:attention}1 face{} card",
                },
            },
            j_hoh_jump_rope = {
                name = "Jump Rope",
                text = {
                    "This Joker gains {C:chips}+#1#{} Chips",
                    "when any {C:attention}Card{} is chosen",
                    "from a {C:attention}Booster Pack{}",
                    "{C:inactive}(Currently {C:chips}+#2#{C:inactive} Chips)",
                },
            },
            j_hoh_cpr_training = {
                name = "CPR Training",
                text = {
                    "If played hand contains a {C:attention}Two Pair{},",
                    "{C:attention}increase{} the rank of {C:attention}higher{} ranked cards",
                    "and {C:attention}decrease{} the rank of {C:attention}lower{} ranked cards",
                    "{C:inactive}(ex: {C:attention}8 8 5 5{C:inactive} -> {C:attention}9 9 4 4{C:inactive}){}"
                },
            },
            j_hoh_5_a_day = {
                name = "5-A-Day",
                text = {
                    "If played hand contains a {C:attention}Flush{},",
                    "{C:attention}randomise{} the Enchancements of all",
                    "played cards after scoring",
                    "{C:inactive}({C:attention}#1#{C:inactive} use(s) remaining)",
                },
            },
            j_hoh_green_tea = {
                name = "Green Tea",
                text = {
                    "When {C:attention}Blind{} is skipped,",
                    "enter the shop and",
                    "{S:1.1,C:red,E:2}destroy{} this Joker",
                },
            },
            j_hoh_pressure_cuff = {
                name = "Pressure Cuff",
                text = {
                    "This Joker gains {X:mult,C:white} X#1# {} Mult",
                    "when a {C:spades}Spade{} or {C:clubs}Club{} card",
                    "is destroyed",
                    "{C:inactive}(Currently {X:mult,C:white} X#2# {C:inactive} Mult)"
                },
            },
            j_hoh_heart_of_gold = {
                name = "Heart of Gold",
                text = {
                    "When {C:attention}Boss Blind{} is defeated,",
                    "earn {C:money}$1{} for every {C:money}$2000{}",
                    "raised during {C:attention}House of Hearts 2025{}",
                    "{C:inactive}({C:money}$#1#{C:inactive}){}"
                },
            },
            j_hoh_heartfelt_gift = {
                name = "Heartfelt Gift",
                text = {
                    "If played hand is a {C:attention}Three of a Kind{},",
                    "create a {C:planet, T:c_venus}Venus{}, {C:tarot, T:c_lovers}The Lovers{},",
                    "{C:tarot, T:c_sun}The Sun{}, or {C:spectral, T:c_deja_vu}Deja Vu{} card",
                },
            },
            j_hoh_crimson_chip = {
                name = "Crimson Chip",
                text = {
                    "Retrigger all played cards {C:attention}#1#{} times,",
                    "gain {C:attention}#2#{} retrigger every {C:attention}#3#{} {C:inactive}[#4#]{} hands",
                    "played this round"
                },
            },
            j_hoh_share_the_love = {
                name = "Share the Love",
                text = {
                    "If played hand contains exactly",
                    "1 {C:hearts}Heart{} card and 1 {C:attention}non-Heart{} card,",
                    "convert the {C:attention}non-Heart{} card",
                    "into the {C:hearts}Heart{} card"
                },
            },
            j_hoh_hemoglobin = {
                name = "Hemoglobin",
                text = {
                    "Gives {X:mult,C:white} X#2# {} Mult",
                    "for each {C:attention}Mult Card{}, {C:dark_edition}Holographic{} card,",
                    "or a card with a {C:red}Red Seal{}",
                    "in your {C:attention}full deck",
                    "{C:inactive}(Currently {X:mult,C:white} X#1# {C:inactive} Mult)",
                },
            },
        },
        Back = {
            b_hoh_heartbeat = {
                name = "Heartbeat Deck",
                text = {
                    "All {C:hearts}Heart{} cards",
                    'start with a {C:attention}Red Seal'
                },
            },
        },
        Other = {
            hoh_credits = {
                name = " ",
                text = {
                    "{C:green,T:hoh_alasbabylon_hover}AlasBabylon{}",
                    "{C:blue,button:hoh_kitty,u:blue,T:hoh_kitty_hover}dottykitty{}",
                    "{C:red,button:hoh_doc,u:red,T:hoh_doc_hover}drspectred{}",
					"{C:blue,T:hoh_expelsword_hover}Expelsword{} and {C:hoh_teal,T:hoh_uselessreptile_hover}UselessReptile8{}",
					"{C:hoh_pink,T:hoh_fallen_hover}Fallen{}",
					"{C:green,T:hoh_honu_hover}HonuKane{}",
					"{C:tarot,T:hoh_kei_hover}KeiFlox{}",
					"{C:attention,button:hoh_lava,u:attention,T:hoh_lava_hover}KilledByLava{}",
					"{C:money,button:hoh_omega,u:money,T:hoh_omega_hover}Omegaflowey18{}",
                    "{C:red,button:hoh_plagger,u:red,T:hoh_plagger_hover}PLagger{}",
                    "{C:blue,button:hoh_stupxd,u:blue,T:hoh_stupxd_hover}stupxd{}",
                    "{C:red,button:hoh_wingcap,T:hoh_wingcap_hover}Wingcap{}",
                    " ",
                },
            },
			hoh_alasbabylon_hover = {
				name = "Contributions",
                text = {
                    "{X:green,C:white}Ideas{}",
                },
			},
			hoh_doc_hover = {
				name = "Contributions",
                text = {
                    "{X:green,C:white}Ideas{}",
                },
			},
			hoh_expelsword_hover = {
				name = "Contributions",
                text = {
                    "{X:green,C:white}Ideas{} {X:attention,C:white}Achievements{}",
                },
			},
			hoh_uselessreptile_hover = {
				name = "Contributions",
                text = {
                    "{X:money,C:white}Art{}",
                    "- BPM",
                },
			},
			hoh_kitty_hover = {
				name = "Contributions",
                text = {
                    "{X:blue,C:white}Organisation{} {X:green,C:white}Ideas{}",
                    "{X:money,C:white}Art{}",
                    "- Stethoscope",
                    "- CPR Training",
                    "- 5-A-Day",
                    "- Heartbeat Deck",
                },
			},
			hoh_honu_hover = {
				name = "Contributions",
                text = {
                    "{X:money,C:white}Art{}",
                    "- Jump Rope",
                    "- Green Tea",
                    "- Heart of Gold",
                },
			},
			hoh_fallen_hover = {
				name = "Contributions",
                text = {
                    "{X:green,C:white}Idea{}",
                },
			},
			hoh_kei_hover = {
				name = "Contributions",
                text = {
                    "{X:green,C:white}Ideas{}",
                },
			},
			hoh_lava_hover = {
				name = "Contributions",
                text = {
                    "{X:green,C:white}Ideas{} {X:red,C:white}Code{}",
                },
			},
			hoh_omega_hover = {
				name = "Contributions",
                text = {
                    "{X:green,C:white}Ideas{} {X:money,C:white}Art{}",
                    "- Crimson Chip",
                    "- Share the Love",
                },
			},
			hoh_plagger_hover = {
				name = "Contributions",
                text = {
                    "{X:green,C:white}Ideas{} {X:red,C:white}Code{}",
                    "{X:money,C:white}Art{}",
                    "- Cyclist",
                    "- Hemoglobin",
                },
			},
			hoh_stupxd_hover = {
				name = "Contributions",
                text = {
                    "This menu :3",
                },
			},
			hoh_wingcap_hover = {
				name = "Contributions",
                text = {
                    "{X:green,C:white}Ideas{} {X:money,C:white}Art{}",
                    "- Wayfarer",
                    "- Heartfelt Gift",
                    "- Mod Icon",
                },
			},
        },
    },
    misc = {
        dictionary = {
            k_pumped_ex = "Pumped!",
            k_enhanced_ex = "Enhanced!",
            k_complete_ex = "Complete!",
            k_gifted_ex = 'Gifted!'
        }
    }
}
