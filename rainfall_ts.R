library(readxl)
library(zoo)
library(xts)
library(lubridate)
library(data.table)
rf <- read.csv(file.choose(),sep = ",",header = TRUE)
trans <- 
rf %>% 
  pivot_longer(c('January', 'February','March','April','May','June','July',
                 'August','September','October','November','December'),
               names_to ='Month', values_to = 'Rainfall')
View(trans)

i <- 1
for (x in 1:nrow(rf)){
  z = 0
  for(y in i:(i+11)){
  df[y,1] <- rf[x,1]
  z = z+1
  df[y,2] <- rf[x,z+1]
  }
   i=i+12}

na.omit(df)
ts <- ts(df$Rainfall, frequency = 12, start = c(1985,1), end = c(2015,12))
attributes(ts)
start(ts)
end(ts)
View(ts)

plot(ts)
adf.test(ts)

df[1,2] = rf[1,2]
df[13,2] = rf[2,3]
View(rf)
rf[1,2]
df <- data.frame(matrix(ncol = 2, nrow = 1000))
x <- c("Year","Rainfall")
colnames(df) <- x
View(df)
ts <- as.ts(rf)
class(ts)
str(rf)
View(rf)
attributes(ts)
ts[,-1]
