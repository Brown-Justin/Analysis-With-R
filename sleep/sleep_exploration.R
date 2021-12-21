#First we need to import the data set
install.packages('tidyverse')
library('ggplot2')
#library('sleep')


#lets first take a look at the sleep data frame
glimpse(sleep)
head(sleep)

dim(sleep)
str(sleep)
summary(sleep)
colnames(sleep)
#view(sleep)

#now lets plot the points, using group as the x, and the amount of extra sleep as y, also scaling the size of the dot by the amount extra.

ggplot(sleep, aes(group, extra, colour = ID, size = extra)) + 
  geom_point()
