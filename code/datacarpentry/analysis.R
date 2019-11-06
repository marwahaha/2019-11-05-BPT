download.file(url="https://ndownloader.figshare.com/files/2292169",
              destfile = "data_raw/portal_data_joined.csv")

surveys <- read.csv("data_raw/portal_data_joined.csv")
## Challenge: Play around with
# str(surveys)
# class(surveys)
# head(surveys)
# size(surveys)
# colnames(surveys)

str(surveys)
head(surveys)

surveys[1,1]
surveys[1,2]

surveys$sex
plot(surveys$sex)
plot(surveys$species)

## Two-variable comparisons
plot(surveys$sex, surveys$hindfoot_length)

levels(surveys$sex)
levels(surveys$sex)[1] <- "unknown"
levels(surveys$sex)

## Two tasks:
# 1. Leave feedback 
##   for the day on the sticky notes
# 2. Write notes to yourself
##  which parts of today 
##  were most important for your data?

## Good morning!
## Please open RStudio
## Make sure you are in the
##    datacarpentry project
## Please run
install.packages("tidyverse")
library(tidyverse)

?tidyverse

# Load in the surveys data

surveys <- read_csv("data_raw/portal_data_joined.csv")
## str()
## class()
## head()
## For example, see what happens when you run
str(surveys)
head(surveys)

select(surveys, record_id, plot_id, species)
## Bonus: Try learning about "filter"
filter(surveys, hindfoot_length > 40)
## Challenge:
## Make a variable called surveys_small
## That has only data in surveys where weight < 5
surveys_small <- filter(surveys, weight < 5)
simple_surveys_small <- 
  select(surveys_small, species_id, sex, weight)

## Pipes (shortcut: Ctrl-Shift-M)
surveys %>%
  filter(sex == "M") %>%
  select(species_id, sex, weight, year)
## Challenge:
## Can you filter to only Male observations
## that are before 1995?
surveys %>%
  filter(sex == "M") %>%
  filter(year < "1995")

# Another way:
surveys %>%
  filter(sex == "M", year < 1995) %>%
  select(sex, year)

## Group by and summarize
surveys %>%
  group_by(sex) %>% 
  summarize(min_weight = min(weight, na.rm=TRUE),
            max_weight = max(weight, na.rm=TRUE))

## Challenge:
## Get average hindfoot length
## for each species and sex
surveys %>%
  group_by(species, sex) %>%
  summarize(mean_foot_length = 
              mean(hindfoot_length, na.rm=TRUE))

## If you are curious, we can count by category
by_year <- surveys %>% count(year)
write_csv(by_year, path = "data/by_year.csv")



## Challenge:
## How could I get the maximum weight by sex?
?max
?mean
NA+7
