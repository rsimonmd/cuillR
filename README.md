# cuillR
Package R construit grâce à [l'API Kaamelott](https://github.com/sin0light/api-kaamelott/) pour générer des citations avec R sans connection internet.
# Installation

Pour installer le package, ovus pouvez l'installer directement depuis Github :

```r
remotes::install_github("rsimonmd/cuillR")
```

# Citation aléatoire

```r
kaamelottr::get_rand_quote()
```

# Conseil d'utilisation

Historiquement j'ai découvert l'[API de citation Kaamelott](https://github.com/sin0light/api-kaamelott/) et j'avais envie d'avoir une citation à chaque fois que je redémarre ma session.  
On peut le faire en ajoutant cette ligne dans le fichier `.Rprofile`  

```r
setHook("rstudio.sessionInit", function(newSession) {

  cat("\014")

  cli::cat_line(
    cli::col_white(
      what = paste(        
            kaamelottr::get_rand_quote()
      )
    )
  )

}, action = "append" )
```

Have fun !