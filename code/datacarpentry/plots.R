# Read in the CSV called surveys
# Copy and paste the line from analysis.R

surveys <- read_csv("data_raw/portal_data_joined.csv")
library(ggplot2)
library(tidyverse)

ggplot(data = surveys, 
       mapping = aes(x = weight, y=hindfoot_length)) +
geom_point(alpha=0.1, aes(color=species))
## What causes the variation in weight and foot length?
## One variable in the data does. Find out which one.
## Next challenge: Make a scatter plot of 
## weight over species_id .. color by plot types.
## Does this look useful?
ggplot(data = surveys, 
       mapping = aes(x = species_id, y=weight)) +
  geom_jitter(alpha=0.3, color='tomato') +
  geom_boxplot(alpha=0.5)
## geom_violin ? geom_line ? new x and y values?

ggplot(data = surveys,
       mapping = aes(x = sex, y= hindfoot_length)) +
  geom_violin(alpha=1, aes(color=sex), na.rm=TRUE)











## Make this dataset 
yearly_counts <- surveys %>%
  count(year, genus)

ggplot(data = yearly_counts,
       mapping = aes(x = year, y= n, color= genus)) +
  geom_line() +
  facet_wrap(facets=vars(genus))

## Challenge:
# Make a dataset with number of observations
#   For each year, sex, and genus.
#   Save that dataset in a variable.
## Then, make a line plot
##   Color by sex
##   Facet by genus

yearly_sex_counts <- surveys %>%
  count(year, genus, sex)

filtered_yearly <- 
  yearly_sex_counts %>%
  filter(genus == "Chaetodipus" | genus == "Dipodomys")


rodent_plot <- ggplot(data = filtered_yearly,
       mapping = aes(x = year, y= n, color= sex)) +
  geom_line() +
  facet_grid(rows=vars(sex), cols=vars(genus)) +
  theme_minimal() +
  labs(title="Observed genera through time",
       x="Year of observation",
       y="Number of individuals") +
  theme(axis.text.x = element_text(angle=45, hjust=1))

ggsave("fig/rodent_plot.png", rodent_plot, width=10, height=15)



