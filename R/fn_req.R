#' get_rand_quote
#' @description Génère n citations Kaamelott formattées pour terminal
#'
#' @param n nombre de citations
#' @param perso OPTIONNEL, spécifier un nom de pesonnage, ou plusieurs avec un vecteur
#'
#' @export
get_rand_quote <- function(n = 1, perso = NULL){

    stopifnot(
        is.numeric(n),
        is.null(perso) | is.character(perso)
    )

    index <- 1:length(kaamelott_citations)

    if (!is.null(perso)) {

        index <- personnages_ref[personnages_ref$perso %in% perso,]$which
        n <- if (length(index) > n) { n } else { length(index) }

    }

    rand_num <- sample(x = index, size = n, replace = FALSE)

    res <-
        lapply(
            X = rand_num,
            FUN = function(x){
                paste(
                    unlist(
                        kaamelott_citations[x]
                    )[c("citation", "infos.personnage")],
                    collapse = "\n\n"
                )
            }
        )

    return(res)

}
