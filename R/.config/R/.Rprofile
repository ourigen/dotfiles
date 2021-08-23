# vim: ft=r

options(
        menu.graphics = FALSE,
        digits = 4L,
        pillar.sigfig = 6,
        max.print = 100L,
        max = 10L,
        scipen = 10L,
        # show.signif.stars = FALSE,
        # useFancyQuotes = FALSE,
        width = cli::console_width(),
        setWidthOnResize = TRUE,
        Ncpus = max(1L, parallel::detectCores() - 1L),
        mc.cores = max(1L, parallel::detectCores() - 1L),
        prompt = "> ",
        continue = "... ",
        # servr.daemon = TRUE,
        warnPartialMatchArgs = TRUE
)

## enable autocompletions for package names in
## `require()`, `library()`
utils::rc.settings(ipck = TRUE)

### Set CRAN mirror across R sessions
# `local` creates a new, empty environment
# This avoids polluting .GlobalEnv with the object r
local({
    r <- getOption("repos")
    # r["CRAN"] <- "https://cran.r-project.org/"
    r["CRAN"] <- "http://cran.rstudio.com/"
    options(repos = r)
})

## Helper functions ---------------------------
## Create hidden environment
.env <- new.env()

## Show the first 6 rows & last 6 rows of a data frame
# .env$ht <- function(df) {
#    rbind(head(df, 5), tail(df, 5))
# }

#### Inhibit "Save workspace image?" prompt
## Define new q() function
.env$q <- function(save = "no", ...) {
   quit(save = save, ...)
}

## Attach hidden environment
attach(.env, warn.conflicts = FALSE)

## colorout: General ----------------------------------------
base::require(colorout, quietly = TRUE)

colorout::setOutputColors(
 normal   = 15,                      # white normal text
 index    = 7,                       # light gray vector indexes ie. [1]

 number   = 3,                       # yellow positive numbers
 negnum   = 3,                       # yellow negative numbers
 zero     = 4, zero.limit = 0.01,    # blue 0 and values 0.01 increments close to 0,
 infinite = 5,                       # magenta "Inf" and "-Inf"

 string   = 2,                       # green quoted text ie "string"
 date     = 5,                       # magenta date/hours in format "HH:MM:SS", YYYYxMMxDD", "DDxMMxYYYY"
 const    = 9,                       # dark/light_red "NULL", "NA", "NaN"

 true     = 2,                       # green "TRUE"
 false    = 1,                       # red "FALSE"

 warn     = 3,                       # yellow_bg warnings
 stderror = 1,                       # red text sent to stderr
 error    = 1,                       # red_bg error

 verbose  = FALSE # logical value indicating whether to print colored words showing results of the setup
)

## _ {data.table} ---------------------------------

colorout::addPattern("[0-9]*:", 7)  # Row num
colorout::addPattern("---", 8)  # Row splitter
colorout::addPattern("<[a-z]*>", 3)  # Col class

## _ `str` ----------------------------------------

## Class
colorout::addPattern(" num ", 6)
colorout::addPattern(" int ", 3)
colorout::addPattern(" chr ", 2)
colorout::addPattern(" Factor ", 5)
colorout::addPattern(" fctr ", 5)
colorout::addPattern(" Ord.factor ", 4)
colorout::addPattern(" logi ", 1)
colorout::addPattern("function ", 5)
colorout::addPattern(" dbl ", 7)
colorout::addPattern(" lgcl ", 3)
colorout::addPattern(" cplx ", 2)
colorout::addPattern("$ ", 3)

## _ `str`, {mlr3} --------------------------------
#
## R6 field name
## colorout::addPattern("* [A-z]*:",                      "\x1b[38;2;235;203;139m")
## colorout::addPattern("* [A-z]* [A-z]*:",               "\x1b[38;2;235;203;139m")
## colorout::addPattern("* [A-z]* [A-z]* [A-z]*:",        "\x1b[38;2;235;203;139m")
## colorout::addPattern("* [A-z]* [A-z]* [A-z]* [A-z]*:", "\x1b[38;2;235;203;139m")
