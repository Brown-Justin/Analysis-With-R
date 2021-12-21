---
title: "Penguins Data Exploration"
output: github_document
---

## First we need to install packages
```{r install_packages, echo=FALSE, message=FALSE}
##install the packages we will be using
#install.packages("palmerpenguins")
#install.packages("here")
#install.packages("janitor")
#install.packages("skimr")
```

## Then we need to load the libraries
```{r loadlibraries, echo=FALSE}
#load the libraries
library("tidyverse")
library("palmerpenguins")
library("here")
library("skimr")
library("janitor")
```

## Organizing and Viewing the Data Base
```{r organize}
#begin to organize the data
penguins %>% arrange(-bill_length_mm)

penguins2 <- penguins %>%  arrange(-bill_length_mm)
penguins %>% group_by(island) %>% drop_na() %>% summarize(mean_bill_length_mm = mean(bill_length_mm))

#lets find max bill length
penguins %>% group_by(island) %>% drop_na() %>% summarize(max_bill_length_mm = max(bill_length_mm))
```

## Plotting
```{r plotting}
#plot penguins flipper length by body mass
ggplot(penguins, aes(flipper_length_mm, body_mass_g, colour = species, shape = species)) + 
  geom_point()
![plotting-1](https://github.com/Brown-Justin/Analysis-With-R/blob/main/palmerpenguins/images/plotting-1.png) 

#this one will use smooth instead of point for the graph
ggplot(penguins, aes(flipper_length_mm, body_mass_g)) + 
  geom_smooth()

#this lays smooth and point together on the same graph
ggplot(data=penguins)+
  geom_smooth(mapping=aes(x=flipper_length_mm, y = body_mass_g))+
  geom_point(mapping=aes(x=flipper_length_mm, y=body_mass_g))

#facet wrap splits the graph up based on, in this instance species. 
ggplot(data=penguins)+
  geom_point(mapping=aes(x=flipper_length_mm, y=body_mass_g, color = species))+
  facet_wrap(~species)

#lets expand the facets and go by species and sex
ggplot(data=penguins)+
  geom_point(mapping=aes(x=flipper_length_mm, y=body_mass_g, color = species))+
  facet_wrap(sex~species)

#lets add some labels 
ggplot(data=penguins)+
  geom_point(mapping=aes(x=flipper_length_mm, y=body_mass_g, color = species))+
  facet_wrap(sex~species)+
  labs(title = "Palmer Penguins: Body Mass vs. Flipper Length", subtitle="Sample of Three Penguin Species",caption="Data collected by Dr. Kristen Gorman")
```
