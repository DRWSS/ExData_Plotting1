## This program reads in the data from household_power_consumption.txt and creates a 
## histogram showing the distribution of Global Active Power for 01-02/02/2007 and 
## sends it to Plot1.png

mp1 <- function(){

dfp <- read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE,dec=".")
fp1 <- as.numeric(dfp[dfp$Date== "1/2/2007" | dfp$Date== "2/2/2007",3])
hist(fp1,main = "Global Active Power",xlab = "Global Active Power (kilowatts)",col = "red")
dev.copy(png,file = "Plot1.png",width=480,height=480)
dev.off()

}


