## I'm pretty sure there has to be an existing function for this.
## Very sure there is one for translating to roman numerals...

## the UNICODE way
toPersianUnicode <- function (number) {
    number <- strsplit(as.character(number), "")[[1]]
    paste0(sapply(number, unicodeTranslation), collapse="")
}
unicodeTranslation <- function (x) {
    switch (x,
            "." = "&#1776;",
            "0" = "&#1777;",
            "1" = "&#1778;",
            "2" = "&#1779;",
            "3" = "&#1780;",
            "4" = "&#1781;",
            "5" = "&#1782;",
            "6" = "&#1783;",
            "7" = "&#1784;",
            "8" = "&#1785;",
            "9" = "&#1786;")
}

## the sane way 
toPersian <- function (number) {
    number <- strsplit(as.character(number), "")[[1]]
    paste0(sapply(number, saneTranslation), collapse="")
}
saneTranslation <- function (x) {
    switch (x,
            "." = "٫",
            "0" = "٠",
            "1" = "١",
            "2" = "٢",
            "3" = "٣",
            "4" = "۴",
            "5" = "۵",
            "6" = "۶",
            "7" = "٧",
            "8" = "٨",
            "9" = "٩")
}

englishTable <- function(data, filename) {
    meanBoys <- round(mean(data$Boys), 3)
    meanGirls <- round(mean(data$Girls), 3)
    standardBoys <- round(sd(data$Boys), 3)
    standardGirls <- round(sd(data$Girls), 3)

    cat("## English\n\n", file=filename, append=TRUE)
    cat("|   | Boys | Girls |\n", file=filename, append=TRUE)
    cat("| :--- | :--- | :--- |\n", file=filename, append=TRUE)
    cat("| mean (sd) |", meanBoys, " (", standardBoys, ") |",
        meanGirls, " (", standardGirls, ") |\n\n",
        file=filename, append=TRUE)
}

persianTable <- function(data, filename) {
    meanPersianBoys <- toPersian(round(mean(data$Boys), 3))
    meanPersianGirls <- toPersian(round(mean(data$Girls), 3))
    standardPersianBoys <- toPersian(round(sd(data$Boys), 3))
    standardPersianGirls <- toPersian(round(sd(data$Girls), 3))
    
    cat("## فارسی\n\n", file=filename, append=TRUE)
    cat("| ", file=filename, append=TRUE)
    cat("دختران", file=filename, append=TRUE)
    cat(" | ", file=filename, append=TRUE)
    cat("پسران", file=filename, append=TRUE)
    cat(" |    |\n ", file=filename, append=TRUE)
    cat("| ---: | ---: | ---: |\n", file=filename, append=TRUE)
    cat("| ", meanPersianGirls, " (", standardPersianGirls, ") | ",
        meanPersianBoys, " (", standardPersianBoys, ") | ",
        file=filename, append=TRUE)
    cat("میانگین (انحراف معیار) |\n\n", file=filename, append=TRUE)
}

n <- 20
theData <- data.frame(Boys = rnorm(n, 1, 5),
                      Girls = rnorm(n, 2, 3))

filename <- "README.md"
cat("# Translate tables\n\n", file=filename)
englishTable(theData, filename)
persianTable(theData, filename)

n <- 12345
theData <- data.frame(Boys = rnorm(n, 1, 5),
                      Girls = rnorm(n, 2, 3))
englishTable(theData, filename)
persianTable(theData, filename)
