---
title: "Penguins Data Exploration"
output: github_document
---

## First we need to install packages
```{r install_packages}
##install the packages we will be using
#install.packages("palmerpenguins")
#install.packages("here")
#install.packages("janitor")
#install.packages("skimr")
```

## Then we need to load the libraries
```{r loadlibraries, message=FALSE}
#load the libraries
library("tidyverse")
library("palmerpenguins")
library("here")
library("skimr")
library("janitor")
```

## Organizing and Viewing the Data Base
#begin to organize the data
```{r organize}
penguins %>% arrange(-bill_length_mm)

penguins2 <- penguins %>%  arrange(-bill_length_mm)
penguins %>% group_by(island) %>% drop_na() %>% summarize(mean_bill_length_mm = mean(bill_length_mm))

#lets find max bill length
penguins %>% group_by(island) %>% drop_na() %>% summarize(max_bill_length_mm = max(bill_length_mm))
```

### Plotting
##plot penguins flipper length by body mass
```{r plot-1, message=FALSE, warning=FALSE}
ggplot(penguins, aes(flipper_length_mm, body_mass_g, colour = species, shape = species)) + 
  geom_point()
```  

##this one will use smooth instead of point for the graph
```{r plot-2, message=FALSE, warning=FALSE}
ggplot(penguins, aes(flipper_length_mm, body_mass_g)) + 
  geom_smooth()
```

##this lays smooth and point together on the same graph
```{r plot-3, message=FALSE, warning=FALSE}
ggplot(data=penguins)+
  geom_smooth(mapping=aes(x=flipper_length_mm, y = body_mass_g))+
  geom_point(mapping=aes(x=flipper_length_mm, y=body_mass_g))
```

##facet wrap splits the graph up based on, in this instance species. 
```{r plot-4, message=FALSE, warning=FALSE}
ggplot(data=penguins)+
  geom_point(mapping=aes(x=flipper_length_mm, y=body_mass_g, color = species))+
  facet_wrap(~species)
```

##lets expand the facets and go by species and sex
```{r plot-5, message=FALSE, warning=FALSE}
ggplot(data=penguins)+
  geom_point(mapping=aes(x=flipper_length_mm, y=body_mass_g, color = species))+
  facet_wrap(sex~species)
```
##lets add some labels 
```{r plot-6, message=FALSE, warning=FALSE}
ggplot(data=penguins)+
  geom_point(mapping=aes(x=flipper_length_mm, y=body_mass_g, color = species))+
  facet_wrap(sex~species)+
  labs(title = "Palmer Penguins: Body Mass vs. Flipper Length", subtitle="Sample of Three Penguin Species",caption="Data collected by Dr. Kristen Gorman")
```
