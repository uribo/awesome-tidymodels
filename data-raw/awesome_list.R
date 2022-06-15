library(dplyr)
source(here::here("R/gt_formatter.R"))
df_awesome <-
  tibble::tribble(
    ~title, ~authors, ~url, ~resource_type, ~level, ~note, ~pickup,
    "Create machine learning models with R and tidymodels",
    "Microsoft", "https://docs.microsoft.com/en-us/learn/paths/machine-learning-with-r/", 
    "course", "beginner", NA_character_, TRUE,
    "Feature Engineering and Selection: A Practical Approach for Predictive Models", 
    c("Max Kuhn", "Kjell Johnson"), "http://www.feat.engineering", 
    "book", "general", NA_character_, TRUE,
    "Supervised Machine Learning for Text Analysis in R",
    c("Emil Hvitfeldt", "Julia Silge"), "https://smltar.com/", 
    "book", "advanced", NA_character_, TRUE,
    "Tidy Modeling with R", 
    c("Max Kuhn", "Julia Silge"), "https://www.tmwr.org", 
    "book", "general", NA_character_, TRUE,
    "Tidy your mental models", 
    "Alison Hill", "https://apreshill.github.io/tidy-mental-models/", 
    "slide", "beginner", NA_character_, TRUE)

# df_awesome <- 
#   df_awesome |> 
#   tidyr::pack(labels = c(type, level))

df_users <-
  tibble::tribble(
    ~name, ~twitter, ~github,
    "Emil Hvitfeldt", "Emil_Hvitfeldt", "EmilHvitfeldt",
    "Kjell Johnson", NA_character_, NA_character_,
    "Max Kuhn", "topepos", "topepo",
    "Julia Silge", "juliasilge", "juliasilge",
    "Alison Hill", "apreshill", "apreshill")
