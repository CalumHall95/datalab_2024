# Load library(babynames) (don’t forget to comment your RScript!).
library(babynames)
library(ggplot2)
library(tidyverse)

bb_names <- babynames
# make a histogram of the name Marie in 1982

ggplot(data=bb_names, aes(x=name, y=year)) +
  geom_histogram()
Marie <- bb_names %>%
  mutate(name = 'Marie')

ggplot(bb_names %>% filter(name == 'Marie', year >= '1982', sex == 'F'), aes(x=year, y=prop)) +
  geom_line()

# Create a line plot for proportion of the name Joe, colored by sex. Make the lines a bit thicker and more transparent.
ggplot(bb_names %>% filter(name == 'Joe'), aes(x=year, y=prop, color=sex)) +
  geom_line()

# Create a bar chart of all female names in 2002.
women_2002 <- bb_names %>%
  filter(sex=='F', year=='2002') %>%
  arrange (desc(n)) %>%
  head(10)

ggplot(data=women_2002, aes(x=name, y=n)) +
  geom_col(fill = 'blue', alpha = 0.2)

# Create a new data set called the_nineties that only contains years from the 1990s.
the_nineties <- bb_names %>%
  filter(year >= 1990, year <= 1999)

# Save this dataset to your repository (use write.csv())
write_csv(the_nineties, file = 'bbnames_nineties.csv')
