#attach dataframe and load libraries required for cleaning
attach(edudata)
#rename two columns
edudata <- rename(edudata, c("CountryCode" ="C_Code", "Long.Name" = "Country"))
#drop unneeded columns
edudata <- subset(edudata, select= c(C_Code, Country, Income.Group, Region))
detach(edudata)


