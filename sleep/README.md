---
title: "Sleep Analysis"
output: github_document
---
## Here are the Libraries we will be using during this analysis
```{r libraries, message= FALSE}
library('tidyverse')
```

## Next lets take a look at the data frame
I've included a couple of different ways of viewing the data set. Viewing it a few different ways can help understand the potential insights

```{r look at data frame}
glimpse(sleep)
head(sleep)

dim(sleep)
str(sleep)
summary(sleep)
colnames(sleep)
```

## Plotting the Data Set
Using the group ID as the X axis, and the amount of extra sleep as values, we can make a plot to spot the differences in drug effectiveness between the two groups.
I also set the size of the point to be equal to the amount of extra sleep. Helps to highlight the difference between patient ID's with low benefit vs high benefits. 

```{r plots}
p <- ggplot(sleep, aes(group, extra, colour = ID, size = extra))
p + geom_point()
```
![sleep-1](https://user-images.githubusercontent.com/70235515/146835816-89be86a4-6460-456b-9216-5bd6897d3a3f.png)
