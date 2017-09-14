##########################################################################
# Author: Brad Simkins
# Analyzing the running speed of mammals
# Dataset: Source:  Garland, T. (1983) The 
# relation between maximal running speed and
# body mass in terrestrial mammals, 
# J. Zoology, 199, 1557-1570.
# http://vincentarelbundock.github.io/Rdatasets/doc/quantreg/Mammals.html 
##########################################################################
install.packages("quantreg")
data(Mammals, package="quantreg")
attach(Mammals)
Mammals[1:3,] #analyze first few lines
hist(weight) 
#histogram concentration on low weights
hist(weight, xlim = c(0,20), breaks = 1000)
mean(weight)
median(weight)
hist(speed)

#reduce skew on weight data with log
log_weight <- log(weight)
hist(log_weight,prob = T)
#normal density curve
curve(dnorm(x, mean(log_weight), sd(log_weight)), add = T)

#scatterplot of transformed weight against speed
plot(log_weight,speed)
cor(log_weight,speed) #correlation
#add hoppers to scatterplot
gph_colors <- rep("darkblue",length(hoppers))
switcheroo <- which(hoppers == TRUE)
gph_colors[switcheroo] <- "red"
plot(log_weight,speed, col = gph_colors, xlab = "Log of Animal's Weight", ylab = "Animal's Speed", ylim = c(0,130))
legend("topright", legend = c("Hoppers", "Not Hoppers"), col=c("Red", "Dark Blue"), pch = 1)

