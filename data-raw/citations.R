## code to prepare `DATASET` dataset goes here

kaamelott_citations <-
    httr::content(
        httr::GET("https://kaamelott.chaudie.re/api/all")
    )$citation


usethis::use_data(kaamelott_citations,
                  overwrite = TRUE,
                  version = 3,
                  internal = TRUE)
