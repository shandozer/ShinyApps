# this is a helper file for TroopCalc, and is unlikely to be "helpful" elsewhere... 
army_size <- 200

troop_levels <- factor(c(1,2,3,4,5,6))

lvls <- length(troop_levels)

troop_types <- c("barbarian", "archer", "goblin", "giant", "wallbreaker", "wizard", "healer", "dragon", "pekka")
barbarian_costs <- seq(length.out=lvls, from=20, to=20*lvls)

troop_costs <- as.data.frame(barbarian_costs)
 
archer_costs <- seq(length.out=lvls, from=40, to = 40*lvls)

goblin_costs <- barb_costs

giant_costs <- seq(length.out=lvls, from = 500, to = 500 * lvls)

wallbreaker_costs <- seq(length.out=lvls-1, from=1000, to=500*lvls)

dragon_costs <- c(25000, 30000, 35000, 40000)

# ADD THE REST LATER... 
#balloon_costs <- seq(length.out=lvls, from= , to= ) # L4 = 3,000
#wizard_costs <- seq(length.out=lvls, from=1800, to = 400*lvls) # L4 = 3,000
#healer_costs <- seq(length.out=lvls, from=1800, to = 400*lvls) # L4 = 6,000
#pekka_costs <- seq(length.out=lvls, from=1800, to = 400*lvls)  # L1 = 

troop_costs <- as.data.frame(cbind(barbarian_costs, archer_costs, goblin_costs, giant_costs))
troop_costs$dragon <- c(dragon_costs, NA, NA)
troop_costs$wallbreaker <- c(wallbreaker_costs, NA)
# UGH< FIX THIS NEXT PART
mycols <- c("barbarian", 'archer', 'goblin', 'giant', 'dragon', "wallbreaker")
colnames(troop_costs) <- mycols

minion_costs <- seq(from = 6, to = (6+lvls), by=1)

# USE THE TABLE LIKE: num_troops_desired * troops_table$wall_breakers[1] # returns total cost
get_cost <- function(troop_type, level, num_troops) {
            
        per_item_cost = troop_costs[level, c(grep(troop_type, mycols))]
        cost = num_troops * per_item_cost
        
        cost
    
}

add_s <- function(troop_name) {
    paste(R.utils::toCamelCase(as.character(troop_name), capitalize=T), 's', sep='')
}

