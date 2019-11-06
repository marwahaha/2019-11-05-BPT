## Make a new R script called databases.R
## Copy and paste from the TinyURL site
download.file(url = "https://ndownloader.figshare.com/files/2292171",
              destfile = "data_raw/portal_mammals.sqlite", mode = "wb")
install.packages("dbplyr")
install.packages("RSQLite")
library(dbplyr)
library(dplyr)
library(RSQLite)
mammals <- DBI::dbConnect(RSQLite::SQLite(), 
                          "data_raw/portal_mammals.sqlite")
# Only works on some computers
src_dbi(mammals)
tbl(mammals, sql("SELECT plot_id FROM surveys"))
tbl(mammals, sql("SELECT count(*) FROM surveys"))
tbl(mammals, sql("SELECT plot_id, species_id FROM surveys"))

surveys_sql <- tbl(mammals, "surveys")

surveys_sql %>% 
  select(year, species_id)
    
# practice: get the year and species_id 
## of observations from the first plot
surveys_sql %>%
  filter(plot_id == 1) %>%
  select(year, species_id)

surveys_sql %>%
  filter(plot_id == 1) %>%
  select(year, species_id) %>%
  show_query()

plots_sql <- tbl(mammals, "plots")
species_sql <- tbl(mammals, "species")
species_sql

plots_sql %>% collect()

rodents <- species_sql %>%
  filter(taxa == "Rodent") %>%
  inner_join(surveys_sql) %>%
  collect()

not_rodents <- species_sql %>%
  filter(taxa != "Rodent") %>%
  inner_join(surveys_sql) %>%
  collect()

## Challenge: 
## Get the number of rodents in each plot for every year
rodents_by_year <- rodents %>% count(year, plot_id)
## Plot number of rodents per year for each plot. 
## Does it change over time? You can use faceting if you like.
## If you have time, when are we collecting non-rodents? 
##   in which plot_ids?

library(ggplot2)
 ggplot(data = rodents_by_year,
        mapping = aes(x = year, y= n)) + 
   geom_line() +
   facet_wrap(facets=vars(plot_id))
 
 