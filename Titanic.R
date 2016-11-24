library(effects)
library(mosaic)

data("TitanicSurvival", package = "effects")
names(TitanicSurvival)
head(TitanicSurvival)

# stratification of data (group by )
xtabs(~sex + survived, TitanicSurvival)
# tally from mosaic
tally(~sex + survived, data = TitanicSurvival)

#How about numeric variables like age
AgeFactor <- cut(TitanicSurvival$age, c(0,13,19,Inf), labels= c("Child", "Teen", "Adult"))
AgeSexFactor <- factor(AgeFactor:TitanicSurvival$sex)

tally(~ survived + AgeSexFactor, data = TitanicSurvival)
tally(~ survived + AgeSexFactor:passengerClass, data = TitanicSurvival)
