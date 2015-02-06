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
hist(teams$rookie_year)
dev.off()

#Let's look at how many teams are in each sate
#TODO
png("team-count-by-state.png")
hist(sum(teams$location))
plot(table(teams$state))
dev.off()


