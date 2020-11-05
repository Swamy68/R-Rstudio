library(tidyverse); data(diamonds)
dd <- diamonds
rm(diamonds)
attach(dd)
# With large datasets you want to try plotting with a sub sample. Use sample_n to select select 1000 cases out of 54000 diamonds.
# note sample_n is a function from dplyr part of the tidyverse

?sample_n

dev.new(height=600, width = 1400)

gdd <- ggplot(data = sample_n(dd, size = 1000),
              aes(x = carat, y = price) )
gdd #no plot just frame

# does not work why ?
gdd + geom_point(color = clarity) # a variable cannot be passed to any aesthetic such as colour, shape etc. outside the aes() function
# works why
gdd + geom_point(color = "red")
# if color has to show another variable or feature it must be passed through the aes() function
#
gdd + geom_point(aes(color = clarity))

table(dd$clarity) # let us understand the how many categories clarity has and what are its frequencies.


# Let us use colour aestthetic to show levels of clairty
gdd <- ggplot(data = sample_n(dd, size = 1000),
       aes(x = carat, y = price, color = clarity))
# And also use size to depict levels of depth
gdd + geom_point(aes(size=depth))

dev.new(height=600, width = 1400)
# How will you explain this graph. ? Please relook at Clarity as a feature or variable of the diamond
# It is not entirely clear
#
dev.new(height=600, width = 1400)
# Can we add a line with geom_line() for seach set of diamonds by clarity to discern pattern if any.
# Also we add axis labels

gdd.ln <- gdd + geom_point() + geom_line() + xlab("Carat ") + ylab("Price (USD)")

gdd.ln
# Is this clear enough ?
plot.new()
dev.new(height=600, width = 1400)

gdd.sm <- gdd + geom_point() + geom_smooth(method=loess) + xlab("Carat ") + ylab("Price (USD)")

gdd.sm

# So use facet wrap
dev.new(height=600, width = 1400)

gdd.sm + geom_point() + geom_smooth(method=loess) + xlab("Carat ") + ylab("Price (USD)") + facet_wrap(~clarity, nrow=2)

gdd.sm + geom_point() + geom_smooth(method = loess, se = FALSE) + xlab("Carat ") + ylab("Price (USD)") + facet_wrap(~clarity, nrow=4)

# LOWESS or LOESS is a stat method for fitting a smooth curve between two variables or smooth surface between four variables

# Now let us add a fourth varaible diamond cut

gdd.sm + geom_point() + geom_smooth(method=loess) + xlab("Carat ") + ylab("Price (USD)") + facet_grid(cut~clarity)
####

dd.pr.n <- nrow(dd) # how many points? same as nrows in ddprice
dd.pr.mn <-  mean(dd$price)
dd.pr.sd <- sd(dd$price)

dd.pr.norm  <-   rnorm(dd.pr.n)

qqplot(x=dd.pr.norm, y=dd$price)

# Better options with qq plot in car package
install.packages("car")
library(car)
qqPlot(iris$Petal.Length, dist="norm", main = "Q-QPlot for Normality \nIris Petal Length ", xlab = "Normal Quantiles", ylab = "Petal Length")
dev.new(height = 600, width = 800)
qqPlot(iris$Petal.Length, dist="norm", main = "Q-QPlot for Normality \nIris Petal Length ", xlab = "Normal Quantiles", ylab = "Petal Length", groups = iris$Species)
