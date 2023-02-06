#' get_rand_quote
#' @description Génère n citations Kaamelott formattées pour terminal
#'
#' @param n nombre de citations
#' @param li_ref liste des quotes de l'api
#' @importFrom purrr map
#'
#' @export
get_rand_quote <- function(n = 1, li_ref = kaamelott_citations){

    rand_num <- sample(x = 1:length(li_ref), size = n, replace = FALSE)

    res <-
        purrr::map(
            .x = rand_num,
            .f = ~{
                paste(
                    unlist(
                        li_ref[.x]
                    )[c("citation", "infos.personnage")],
                    collapse = "\n\n"
                )
            }
        )

    return(res)

}
