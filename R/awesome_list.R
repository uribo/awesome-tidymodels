create_awesome_df <- function(df, user_df) {
  df |> 
    tidyr::unnest(cols = authors) |> 
    left_join(user_df, by = c("authors" = "name")) |> 
    dplyr::mutate(title = purrr::map(glue::glue("[{title}]({url})"),
                              gt::md),
           resource_type = purrr::map(fa_labels(resource_type),
                                      gt::html),
           authors = paste0(authors, dplyr::if_else(!is.na(github), 
                                                    glue::glue("({fontawesome::fa('github')} [{github}](https://github.com/{github}))"), 
                                                    ""))) |> 
    dplyr::select(!c(twitter, github, url, note)) |> 
    tidyr::nest(data = c(authors)) |> 
    dplyr::mutate(authors = purrr::map(data,
                                ~ gt::md(paste(.x$authors, collapse = ", "))),
                  level = purrr::map(level, gt_level_color)) |> 
    dplyr::relocate(authors, .after = title) |> 
    dplyr::select(!data)  
}
