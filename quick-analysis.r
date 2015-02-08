#Install dependencies
install.packages("reshape2")
install.package("ggplot2")

#Requires
require("reshape2")
require("ggplot2")

#Import the data
teams <- read.csv("./the-blue-alliance-data-master/the-blue-alliance-data-master/teams/teams.csv", header=FALSE)
names(teams) <- c("number", "name", "sponsors", "location", "website", "rookie_year")

#Let's parese the location further down into state
teams <- cbind(teams,colsplit(teams$location, pattern = ",", names = c("city","state","country")))

#Let's take a look ate how many teams join each year
png("new-teams-by-year.png")
years <- data.frame(table(teams$rookie_year))
years[1] <- as.numeric(levels(years[1]))[years[1]]
years[2] <- as.numeric(levels(years[2]))[years[2]]
names(years) <- c("year", "freq")
plot(years$year, years$freq)
reg1 <- lm(years$freq~years$year) #TODO, make this correct
abline(reg1)
abline(-30,20)
#TODO Add a polynomial regression hear
dev.off()

png("new-teams-by-year.2.png")
rookie_hist <- qplot(teams$rookie_year, main="Number of teams per year", xlab="Year")
rookie_hist <- rookie_hist + scale_x_continuous(breaks = seq(1990, 2018, by = 2))
rookie_hist <- rookie_hist + geom_freqpoly(size=2, color = "blue", alpha = .2)
rookie_hist + geom_freqpoly() 
#TODO, add a regression line to this
dev.off()

png("new-teams-by-year.3.png")
hist(teams$rookie_year) #This uses the base plotting system
dev.off()

png("new-teams-by-year.4.png")
#TODO qplot(years) + stat_bin(binwidth = 1,  col = "black")
dev.off()

png("team-count-by-state.png")
qplot(teams$state) #TODO sort by most numerous
dev.off()

png("team-count-by-state.2.png")
plot(table(teams$state)) #Uses base plotting system
dev.off()

png("team-count-by-state.3.png")
plot(data.frame(table(teams$state))) #Uses base plotting system
dev.off()
