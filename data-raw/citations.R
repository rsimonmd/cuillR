## code to prepare `DATASET` dataset goes here

kaamelott_citations <-
    httr::content(
        httr::GET("https://kaamelott.chaudie.re/api/all")
    )$citation

personnages_ref <-
    purrr::map2_df(
        .x = kaamelott_citations,
        .y = 1:length(kaamelott_citations),
        .f = ~{

            data.frame(
                perso = .x$info$personnage,
                which = .y
            )

        }
    )

usethis::use_data(kaamelott_citations,
                  personnages_ref,
                  overwrite = TRUE,
                  version = 3,
                  internal = TRUE)
