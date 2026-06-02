return {
    descriptions = {
        Joker = {
            j_hoh_keep_the_beat = {
                name = "Keep the Beat",
                text = {
                    "{X:mult,C:white}X#1#{} Mult if hand contains",
                    "scoring {V:1}#2#{} card,",
                    "otherwise {C:mult}self destructs,",
                    "suit cycles every hand",
                    "{C:inactive,s:0.8}(#3#){}",
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
                    "for every {C:attention}Card{} chosen",
                    "in a {C:attention}Booster Pack{}",
                    "{C:inactive}(Currently {C:chips}+#2#{C:inactive} Chips)",
                },
            },
            j_hoh_cpr_training = {
                name = "CPR Training",
                text = {
                    "If played hand contains a {C:attention}Two Pair{} or {C:attention}Full House,",
                    "{C:attention}increase{} the ranks of the {C:attention}higher{} ranked group",
                    "and {C:attention}decrease{} the ranks of the {C:attention}lower{} ranked group",
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
                    "earn {C:money}$1{} for every {C:attention}$2000{}",
                    "raised during {C:dark_edition}House of Hearts 2025{}",
                    "{C:inactive}({C:money}$#1#{C:inactive}){}"
                },
            },
            j_hoh_heartfelt_gift = {
                name = "Heartfelt Gift",
                text = {
                    "If played hand contains a {C:attention}Three of a Kind{},",
                    "create a {C:planet, T:c_venus}Venus{}, {C:tarot, T:c_lovers}The Lovers{},",
                    "{C:tarot, T:c_fool}The Fool{}, or {C:spectral, T:c_deja_vu}Deja Vu{} card",
                    "{C:inactive}(Must have room)"
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
                    "If {C:attention}first hand{} of round contains exactly",
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
                    "or card with a {C:red}Red Seal{}",
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
                    'start with a {C:attention,T_set:Other,T:red_seal}Red Seal'
                },
            },
        },
        Other = {
            hoh_credits = {
                name = " ",
                text = {
                    " ",
                    "{C:green,T:hoh_alasbabylon_hover}AlasBabylon{}",
                    "{C:blue,button:hoh_kitty,u:blue,T:hoh_kitty_hover}dottykitty{}",
                    "{C:red,button:hoh_doc,u:red,T:hoh_doc_hover}drspectred{}",
					"{C:blue,T:hoh_expelsword_hover}Expelsword{} and {C:hoh_teal,T:hoh_uselessreptile_hover}UselessReptile8{}",
					"{C:hoh_pink,button:hoh_fallen,u:hoh_pink,T:hoh_fallen_hover}Fallen{}",
					"{C:green,T:hoh_honu_hover}HonuKane{}",
					"{C:tarot,T:hoh_kei_hover}KeiFlox{}",
					"{C:attention,button:hoh_lava,u:attention,T:hoh_lava_hover}KilledByLava{}",
					"{C:money,button:hoh_omega,u:money,T:hoh_omega_hover}Omegaflowey18{}",
                    "{C:red,button:hoh_plagger,u:red,T:hoh_plagger_hover}PLagger{}",
                    "{C:blue,button:hoh_stupxd,u:blue,T:hoh_stupxd_hover}stupxd{}",
                    "{C:red,T:hoh_wingcap_hover}Wingcap{}",
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
                    "- Mastery Achievements Icons",
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
                    "- Keep the Beat",
                    "- Wayfarer",
                    "- Cyclist",
                    "- BPM",
                    "- Stethoscope",
                    "- CPR Guide",
                    "- 5-A-Day",
                    "- Pressure Cuff",
                    "- Heart of Gold",
                    "- Crimson Chip",
                    "- Share the Love"
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
                    "{X:green,C:white}Ideas{}",
                    "{X:red,C:white}Code{}",
                    "- Jump Rope",
                    "- Green Tea",
                    "- Heartfelt Gift",
                    "- Hemoglobin",
                    "- Heartbeat Deck",
                    "- Achievements",
                    "{X:money,C:white}Art{}",
                    "- Cyclist",
                    "- Hemoglobin",
                },
			},
			hoh_stupxd_hover = {
				name = "Contributions",
                text = {
                    "{X:red,C:white}Code{}",
                    "- This menu :3",
                    "- Joker rewrites/modifications",
                    "- Achievements"
                },
			},
			hoh_wingcap_hover = {
				name = "Contributions",
                text = {
                    "{X:green,C:white}Ideas{} {X:money,C:white}Art{}",
                    "- Wayfarer",
                    "- Heartfelt Gift",
                    "- Pressure Cuff",
                    "- Mod Icon",
                    "- Certification Achievements Icons",
                },
			},

            hoh_about_aha = {
                name = " ",
                text = {
                    "The AHA is a worldwide leader in first aid,",
                    "CPR, and AED training - educating more than",
                    "22 million people globally in CPR each year.",
                },
            },
            hoh_about_cpr = {
                name = " ",
                text = {
                    "7 out of 10 cardiac arrests outside of the hospital happen at home.",
                    "That means if you witness one, it will most likely be someone you love.",
                    "Immediate CPR can double or even triple survival chances.",
                    "You can make a difference by learning Hands-Only CPR today!"
                },
            },
        },
    },
    misc = {
        dictionary = {
            k_pumped_ex = "Pumped!",
            k_enhanced_ex = "Enhanced!",
            k_complete_ex = "Complete!",
            k_gifted_ex = 'Gifted!',
            k_missed = 'Missed',
            k_hoh_credits = "Credits",
            k_hoh_aha_header = "American Heart Association",
            k_hoh_cpr_tutorial = "CPR Tutorial",
            k_hoh_donate_aha = "Donate to AHA",

            hoh_reset_achievements = "Reset Achievements",
            hoh_are_you_sure = "Are you sure?",
            hoh_no = "No",
            hoh_created_by = "Created By: Balatro University Discord",
        },
        achievement_names = {
            ach_hoh_no_pressure = 'No Pressure',
            ach_hoh_flavor_fanatic = 'Flavor Fanatic',
            ach_hoh_training_complete = 'Training Complete',
            ach_hoh_cross_fit = 'Cross Fit',
            ach_hoh_long_walk = 'Long Walk',
            ach_hoh_stayin_alive = "Stayin' Alive",
            ach_hoh_beat_keeper = "Beat Keeper",
            ach_hoh_recycled = 'Recycled',
            ach_hoh_donothon = 'Dono-thon',
            ach_hoh_contagious_smile = 'Contagious Smile',
            ach_hoh_circulatory_system = 'Circulatory System',
            ach_hoh_break_time = 'Break Time',
            ach_hoh_rebuffed = 'Rebuffed',
            ach_hoh_thoughtfulness = 'Thoughtfulness',
            ach_hoh_checkup = 'Checkup',
        },
        achievement_descriptions = {
            ach_hoh_no_pressure = 'Have a deck with no Spade or Club cards',
            ach_hoh_flavor_fanatic = 'Create 6 Enhanced Cards in a single round',
            ach_hoh_training_complete = 'Create both Aces and 2s at the same time using CPR Training',
            ach_hoh_break_time = 'Skip 5 times within 4 consecutive antes',
            ach_hoh_cross_fit = 'Take at least 4 items from Booster Packs in a single round',
            ach_hoh_long_walk = 'Use every Rank in a Straight at least once during a run',
            ach_hoh_stayin_alive = 'Play a hand of 9 - Ace - Ace in Hearts Suit',
            ach_hoh_beat_keeper = 'Play 12 consecutive hands with Keep the Beat',
            ach_hoh_recycled = 'Have 0 cards remaining in your deck during a round',
            ach_hoh_donothon = 'Earn $40 or more at Cashout during a run',
            ach_hoh_contagious_smile = 'Play a Flush Five in Hearts Suit',
            ach_hoh_circulatory_system = 'Have at least 52 cards in your Deck that are Mult Cards, Holographic Cards, or Red Seal Cards',
            ach_hoh_rebuffed = 'Use Crimson Chip to retrigger played cards twice or more in the same hand',
            ach_hoh_thoughtfulness = 'Receive each gift at least once from Heartfelt Gift during a run',
            ach_hoh_checkup = 'Trigger the Stethoscope using a card with the same Rank and Suit during all three Blinds of an Ante',
        }
    }
}
