# Task to make a bar plot of categorical vraiable.
# Unlike plot() function, barplot() function does not take a raw categorical variable for plottting. It needs a vector for plotting the heights the bars. This means the no of observations falling under each of the categories must grouped and counted and presented as a vector. Usually categorical variables are stored as a factor.

# The levels of a factor are the names of the categories.

library(ggplot2)
data(diamonds)
install.packages(doBy);
library(doBy)
dd <- as.data.frame(diamonds) # convert as pure dataframe not tbl_df, tbl for summaryBy function

dd.cut <- summaryBy(data=dd, # reference datafarme
                    price~cut, # price by cut groups
                    FUN=c(mean, # avg price per group
                          NROW, # freq per group
                          max, # not used yet
                          min # not used yet
                          ))
class(dd.cut) # check class must be dataframe not tbl
dd.cut
names(dd.cut) <- c("type","mean.price", "freq", "max.price", "min.price")
dd.cut
dd.cut$mean.price <- round(dd.cut$mean.price )

plot.new()

cut.barplot <- barplot(height=dd.cut$freq,
              width = 1,
              names.arg=dd.cut$type,
              horiz= TRUE,
              xlim=c(0, max(dd.cut$freq)*1.25), # provide margin
              col="light green",
              las = 2 # label axis style: 2 = perpendicular to axis
              )  # axis label orientation to be fixed ??

title("Diamonds Price by Type of Cut")


text(x=dd.cut$freq + 2000, # where: position of label
     cut.barplot, # add to which barplot
     labels= as.character(dd.cut$freq), # what to show in label
     col="blue" # color of label
     )

# DUAL AXIS PLOTTING

par(new = T)

plot(dd.cut$mean.price,
     cut.barplot,
     xlim=c(0, max(dd.cut$mean.price)*1.20),
     xlab="",
     ylab ="",
     type = "n",
     axes = F
)

lines(dd.cut$mean.price, cut.barplot, lwd = 4, col= "red")


points(dd.cut$mean.price, cut.barplot, lwd = 4, col= "red")

text(dd.cut$mean.price + 100, # where
     cut.barplot,  # to which plot's reference
     labels=as.character(dd.cut$mean.price), # label as what
     col= "red",
     font = 2,
     cex = 0.7 # char expansion reduced
     )

axis(1, col = "red", lwd = 3, line = 3)

mtext("mean.price",
      side = 1,  # on bottom of graph
      line = 3.1, # if axis line= 3, mtext = 3.1 not on it, thus visible
      col = "red", # colour of text
      cex= 0.9, # character expands by 1.5
      at = 2500 # on scale of 0-5000 of mean price, mtext is at 2500 x co-ordinate
)

