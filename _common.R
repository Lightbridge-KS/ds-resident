# Printing Table ----------------------------------------------------------


## From: https://bookdown.org/yihui/rmarkdown-cookbook/opts-render.html

yihui_print <- function(x, ...) {
  res = paste(c("", "", knitr::kable(x)), collapse = "\n")
  knitr::asis_output(res)
}


## From: https://cran.r-project.org/web/packages/kableExtra/vignettes/awesome_table_in_html.html#Bootstrap_table_classes
kableExtra_print <- function(x, ...){
  
  res <- kableExtra::kbl(x) %>%
    kableExtra::kable_styling(bootstrap_options = c("striped", "hover", "responsive"))
  
  knitr::asis_output(res)
  
}

## Generic: knit_print

knit_print.data.frame <-  function(x, ...) {
  
  kableExtra_print(x, ...)
}

registerS3method(
  "knit_print", "data.frame", knit_print.data.frame,
  envir = asNamespace("knitr")
)
