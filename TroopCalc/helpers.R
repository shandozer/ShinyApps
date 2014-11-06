# this is a helper file for TroopCalc, and is unlikely to be "helpful" elsewhere... 
army_size <- 200

troop_levels <- factor(c(1,2,3,4,5,6))

lvls <- length(troop_levels)

troop_types <- c("barbarian", "archer", "goblin", "giant", "wallbreaker", "wizard", "healer", "dragon", "pekka", "minion")

barbarian_costs <- seq(length.out=lvls, from=20, to=20*lvls)

troop_costs <- as.data.frame(barbarian_costs)
 
archer_costs <- seq(length.out=lvls, from=40, to = 40*lvls)

goblin_costs <- barbarian_costs

giant_costs <- seq(length.out=lvls, from = 500, to = 500 * lvls)

# ADD THE REST LATER... 
#balloon_costs <- seq(length.out=lvls, from= , to= ) # L4 = 3,000
wizard_costs <- c(1500, 2000, 2500, 3000, 3500, 4000) # L4 = 3,000
healer_costs <- c(3000, 6000, 9000, 12000, 15000, NA) # L2 = 6,000

wallbreaker_costs <- seq(length.out=lvls-1, from=1000, to=500*lvls)

dragon_costs <- c(25000, 30000, 35000, 40000, NA, NA)

#pekka_costs <- seq(length.out=lvls, from=1800, to = 400*lvls)  # L1 = 

# DARK TROOPS # 
minion_costs <- c(6,7,8,9,10,NA)

troop_costs <- as.data.frame(cbind(barbarian_costs, archer_costs, goblin_costs, giant_costs, wizard_costs, healer_costs, minion_costs))

# Hack
troop_costs$dragon <- c(dragon_costs)

troop_costs$wallbreaker <- c(wallbreaker_costs, NA)

# Hackety hack
mycols <- c("barbarian", 'archer', 'goblin', 'giant', 'wizard', 'healer','minion', 'dragon', "wallbreaker")
colnames(troop_costs) <- mycols

# SPELLS
lightning_costs <- c(5000, 10000, 15000, 20000, 25000)
heal_costs <- c(5000, 10000, 15000, 20000, 25000)
rage_costs <- c(15000, 20000, 25000, 30000, 35000)
jump_costs <- c()
freeze_costs <- c()

spell_costs <- as.data.frame(cbind(lightning_costs, heal_costs, rage_costs, jump_costs, freeze_costs))

get_spell_cost <- function(spell_name, spell_level, num_spells) {
    
    per_item_cost = spell_costs[spell_level, c(grep(spell_name, colnames(spell_costs)))]
    spell_cost = num_spells * per_item_cost
    
    spell_cost
}

# USE THE TABLE LIKE: num_troops_desired * troops_table$wall_breakers[1] # returns total cost
get_cost <- function(troop_type, level, num_troops) {
            
        per_item_cost = troop_costs[level, c(grep(troop_type, mycols))]
        cost = num_troops * per_item_cost
        
        cost
    
}

add_s <- function(troop_name) {
    paste(R.utils::toCamelCase(as.character(troop_name), capitalize=T), 's', sep='')
}

