# read in cleaned dataset 
both <- read.csv(file="MergedData.csv", header = TRUE, sep=",")

#Create ranking variable
both$Rank <- as.numeric(gsub("[^[:digit:]]","", both$ID))

#Create vector of High Income: OECD countries and return average ranking
highoecd <- (both$Rank[both$Income.Group=="High income: OECD"])
sumhighoecd <- sum(highoecd)
counthighoecd <- length(highoecd)
avghighoecd <- sumhighoecd/counthighoecd
avghighoecd

#Create vector of High Income: nonOECD countries and return average ranking
highnon <- (both$Rank[both$Income.Group=="High income: nonOECD"])
sumhighnon <- sum(highnon)
counthighnon<- length(highnon)
avghighnon<- sumhighnon/counthighnon
avghighnon

#activate ggplot2 library
#create scatterplot by income group of GDP 
library(ggplot2)
p <- ggplot(both, aes(Rank,GDP_Mills))
P <- p + geom_point()
p <- p + geom_point(aes(colour=factor(Income.Group)))
p

#Group countries into 5 quantiles based on GDP and create table versus Income Group
summary(both$Rank)
both$qnt <- cut(both$Rank, breaks=quantile(both$Rank, probs=seq(0,1,0.2)), labels=1:5, include.lowest=TRUE)
otable <- table(both$Income.Group, both$qnt)
otable
