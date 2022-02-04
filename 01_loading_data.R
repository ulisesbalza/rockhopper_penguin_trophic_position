rm(list=ls())

library(tRophicPosition)
library(dplyr)

##### Trophic position rockhopper penguin SWA  #####

# loading databases
data_malvinas <- read.csv("data/rockhopper_malvinas.csv", sep = ";", header = T)
data_deseado <- read.csv("data/rockhopper_deseado.csv", sep = ";", header = T)
data_idle <- read.csv("data/rockhopper_idle.csv", sep = ";", header = T)


# Defining consumers and baselines
# IM/FI
consumer_malvinas <- extractIsotopeData(data_malvinas, 
                                     consumersColumn = "FG",
                                     b1 = "burdwood",
                                     b2 = "malvinas", 
                                     baselineColumn = "FG",
                                     groupsColumn = NULL)

# Deseado
consumer_deseado <- extractIsotopeData(data_deseado, 
                                        consumersColumn = "FG",
                                        b1 = "shelf",
                                        b2 = "malvinas", 
                                        baselineColumn = "FG",
                                        groupsColumn = NULL)




# Isla de los Estados
consumer_idle <- extractIsotopeData(data_idle, 
                                       consumersColumn = "FG",
                                       b1 = "idle",
                                       b2 = "burdwood", 
                                       baselineColumn = "FG",
                                       groupsColumn = NULL)




#Plot the data that is going to be used for the estimations

# IM/FI
for (Spp in consumer_malvinas) {
  print(summary(Spp))
  plot(Spp)}

# IP
for (Spp in consumer_deseado) {
  print(summary(Spp))
  plot(Spp)}

# Isla de los Estados
for (Spp in consumer_idle) {
  print(summary(Spp))
  plot(Spp)}



