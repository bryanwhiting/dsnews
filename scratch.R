# scratch
library(tidyRSS)
library(DT)

df = tidyfeed('https://blog.openai.com/rss/')
df %>%
  select(item_description) %>%
  datatable()

# https://stackoverflow.com/a/48512819
library(dplyr)
library(knitr)
library(kableExtra)
dt_url <- c("https://en.wikipedia.org/wiki/Cadillac_Fleetwood",
            "https://www.lincoln.com/luxury-cars/continental/",
            "http://shop.honda.com/civics.aspx",
            "https://bringatrailer.com/2011/12/28/striking-1973-maserati-bora-4-9/")

mtcars[c(15,16,19,31),1:3] %>%
  mutate(model = cell_spec(row.names(.), "html", link = dt_url)) %>%
  kable("html", escape = FALSE) %>%
  kable_styling(bootstrap_options = c("hover", "condensed"),
                full_width=FALSE,
                position='float_left')

mtcars[c(15,16,19,31),1:3] %>%
  mutate(model = cell_spec(row.names(.), "html", link = dt_url)) %>%
  kable("html", escape = FALSE) %>%
  kable_styling(bootstrap_options = c("hover", "condensed"),
                full_width=FALSE,
                position='left')

kable(list(iris, iris)) %>%
  kable_styling(bootstrap_options = c("hover"))

datatable(iris, style = 'bootstrap', class = 'table-bordered table-condensed')




library(kableExtra)
library(lubridate)
df = tidyfeed('https://blog.openai.com/rss/')

x <- df %>% 
  arrange(desc(item_pub_date)) %>%
  mutate(
    date = format(item_pub_date, '%m/%d/%y'),
    blog = cell_spec(feed_title, "html", link=feed_link),
    post = paste(blog, cell_spec(date, 'html', link=item_link), item_description)
  ) %>%
  select(post)

# datatable(x, escape=F)
kable(list(x, x, x), "html", escape = FALSE) %>%
  kable_styling(bootstrap_options = c("hover", "condensed"))





cat = 'astro-ph'
n = 10
sort = '&sortBy=lastUpdatedDate&sortOrder=descending'
max_res = paste0('&max_results=', n)
q = paste0('http://export.arxiv.org/api/query?search_query=cat:', cat, sort, max_res)