###
# recreate the dates plot for gl30 paper 
# 20200123
# dan.carver@carverd.com
###

# change of mind, I'm just going to generate a counts table that summarized by year and month 

data <- read.csv("D:/gl30Mexico/gl30_2000_dates.csv")

# spilt capture time column by index Year and Month. I'm not really concerned about day

data$d2 <-as.character(data$Date)
data$year <- NA
data$month <- NA
data$day <- NA

substr(data$d2[1], start = 1, stop = 4)

for( i in 1:nrow(data)){
  data$year[i] <- substr(data$d2[i], start = 1, stop = 4)
  data$month[i] <- substr(data$d2[i], start = 5, stop = 6)
  data$day[i] <- substr(data$d2[i], start = 7, stop = 8)
}

d2 <- data %>%
  dplyr::group_by(year, month)%>%
  dplyr::summarise(count = n())

View(d2)

write.csv(x = d2, file = "D:/gl30Mexico/gl2000imagesByMonth.csv")

# month only 
d2month <- data %>%
  dplyr::group_by(month)%>%
  dplyr::summarise(count = n())

View(d2month
     )

#different method for the 2010 dataset 
install.packages("lubridate")


library(lubridate)
library(dplyr)

data2 <- read.csv("D:/gl30Mexico/gl30_2010Dates.csv")
names(data2)
data2[ , 4 ] <- ymd(data2[, 4])


d3 <- data2 %>%
  tidyr::separate(Date,into= c("year","month", "day"),sep = "-")%>%
  dplyr::group_by(year, month)%>%
  dplyr::summarise(count = n())

View(d3)

d4 <- data2 %>%
  tidyr::separate(Date,into= c("year","month", "day"),sep = "-")%>%
  dplyr::group_by(month)%>%
  dplyr::summarise(count = n())

write.csv(x = d3, file = "D:/gl30Mexico/gl2010imagesByMonth.csv")



