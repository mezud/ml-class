casandie <- read.csv("D:/Courses/DM2008/Datasets/casandie.txt", sep="")
sdrapcty <- read.csv("D:/Courses/DM2008/Datasets/sdrapcty.txt", sep="")

par(mfrow=c(2,1))
hist(casandie$Temp)
hist(sdrapcty$Temp)

par(mfrow=c(2,1))
hist(casandie$Temp, xlim = c(-20,100))
hist(sdrapcty$Temp, xlim = c(-20,100))


par(mfrow=c(2,1))
bins <- seq(-20, 100, 2)
hist(casandie$Temp, xlim = c(-20,100), breaks=bins)
hist(sdrapcty$Temp, xlim = c(-20,100), breaks=bins)

par(mfrow=c(2,1))
bins <- seq(-20, 100, 2)
bins <- seq(-20, 100, 2)
hist(casandie$Temp, xlim = c(-20,100), ylim=c(0,760), breaks=bins)
hist(sdrapcty$Temp, xlim = c(-20,100), ylim=c(0,760), breaks=bins)

