#### multispecies model ####

# alpha = relative contribution of baseline 1
# IDLE = IDLE
# IM/FI = burdwood
# Deseado = shelf

# lambda: baseline TP

# mode, median and credibility confidence interval for trophic position and 
#alpha, grouped by model



# IM/FI
rockhopper_malvinas <- multiSpeciesTP(consumer_malvinas, model = "twoBaselinesFull",
                                      lambda = 2, n.adapt = 50000, n.iter = 50000,
                                      burnin = 50000, n.chains = 5, print = TRUE)

#  median and 95% credibility interval
sapply(rockhopper_malvinas$"TPs", quantile, probs = c(0.025, 0.5, 0.975)) %>% round(3)
sapply(rockhopper_malvinas$"Alphas", quantile, probs = c(0.025, 0.5, 0.975)) %>% round(3)


#Plots
#mode
credibilityIntervals(rockhopper_malvinas$df, x = "consumer", xlab ="Species", group_by ="consumer")
#median
credibilityIntervals(rockhopper_malvinas$df, x = "consumer", xlab ="Species", 
                     y1 = "median", y2 = "alpha.median", group_by ="consumer")




# IP
rockhopper_deseado <- multiSpeciesTP(consumer_deseado, model = "twoBaselinesFull",
                                     lambda = 2, n.adapt = 50000, n.iter = 50000,
                                     burnin = 50000, n.chains = 5, print = TRUE)

#  median and 95% credibility interval
sapply(rockhopper_deseado$"TPs", quantile, probs = c(0.025, 0.5, 0.975)) %>% round(3)
sapply(rockhopper_deseado$"Alphas", quantile, probs = c(0.025, 0.5, 0.975)) %>% round(3)

#Plots
#mode
credibilityIntervals(rockhopper_deseado$df, x = "consumer", xlab ="Species", group_by ="consumer")
#median
credibilityIntervals(rockhopper_deseado$df, x = "consumer", xlab ="Species", 
                     y1 = "median", y2 = "alpha.median", group_by ="consumer")



# Isla de los Estados
rockhopper_idle <- multiSpeciesTP(consumer_idle, model = "twoBaselinesFull",
                                   lambda = 2, TP = "dnorm(3, 0.1)",
                                   n.adapt = 50000, n.iter = 50000,
                                   burnin = 50000, n.chains = 5, print = TRUE)


#  median and 95% credibility interval
sapply(rockhopper_idle$"TPs", quantile, probs = c(0.025, 0.5, 0.975)) %>% round(3)
sapply(rockhopper_idle$"Alphas", quantile, probs = c(0.025, 0.5, 0.975)) %>% round(3)


#Plot the results
#mode
credibilityIntervals(rockhopper_idle$df, x = "consumer", xlab ="Species", group_by ="consumer")
#median
credibilityIntervals(rockhopper_idle$df, x = "consumer", xlab ="Species", 
                     y1 = "median", y2 = "alpha.median", group_by ="consumer")

