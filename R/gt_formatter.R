# emoji_labels <- function(x) {
#   emoji <- 
#     dplyr::case_when(
#       x == "book" ~ as.character(emo::ji(paste0(sample(c("green", "blue", "orange", "closed", "open"), size = 1), "_book")))
#     )
#   paste0(tidyr::replace_na(emoji, ""), x)
# }
# emoji_labels("book")

fa_labels <- function(x) {
  fa <- 
    dplyr::case_when(
      x == "book" ~ glue::glue("{fontawesome::fa('book')}"),
      x == "course" ~ glue::glue("{fontawesome::fa('road')}"),
      x == "post" ~ glue::glue("{fontawesome::fa('bullhorn')}"),
      x == "slide" ~ glue::glue("{fontawesome::fa('fas fa-image')}"),
      x == "video" ~ glue::glue("{fontawesome::fa('video')}"),
    )
  paste0(tidyr::replace_na(fa, ""), x)
}
# fa_labels("book")

gt_level_color <- function(level){
  bg_color <- if (level == "beginner") {
    "background: hsl(116, 60%, 90%); color: hsl(116, 30%, 25%);"
  } else if (level == "general") {
    "background: hsl(230, 70%, 90%); color: hsl(230, 45%, 30%);"
  } else if (level == "advanced") {
    "background: hsl(350, 70%, 90%); color: hsl(350, 45%, 30%);"
  }
  div_out <- htmltools::div(
    style = paste(
      "display: inline-block; padding: 2px 12px; border-radius: 15px; font-weight: 600; font-size: 12px;",
      bg_color
    ),
    level
  )
  as.character(div_out) %>% 
    gt::html()
}

gt_export <- function(x) {
  gt::gt(x) |> 
    gt::tab_style(
      locations = gt::cells_column_labels(columns = everything()),
      style     = list(
        gt::cell_text(weight = "bold")
      )
    ) |> 
    gt::cols_align(align = "left", columns = c(title, authors))
}
