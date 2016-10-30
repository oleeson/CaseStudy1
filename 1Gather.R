#Read in gdp data 
gdpdata <- read.csv(file="worldbankgdpstats.csv", skip=4, header = TRUE, sep=",")

#Read in edu data
edudata <- read.csv(file="worldbankedustats.csv", header = TRUE, sep=",")

#Activate libraries
library(tidyr)
library(plyr)