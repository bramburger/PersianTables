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

n <- 20
theData <- data.frame(Boys = rnorm(n, 1, 5),
                      Girls = rnorm(n, 2, 3))
meanBoys <- round(mean(theData$Boys), 3)
meanGirls <- round(mean(theData$Girls), 3)
standardBoys <- round(sd(theData$Boys), 3)
standardGirls <- round(sd(theData$Girls), 3)

cat("# Translate tables\n\n", file="README.md")

cat("## English\n\n", file="README.md", append=TRUE)
cat("|   | Boys | Girls |\n", file="README.md", append=TRUE)
cat("| :--- | :--- | :--- |\n", file="README.md", append=TRUE)
cat("| mean (sd) |", meanBoys, " (", standardBoys, ") |", meanGirls, " (", standardGirls, ") |\n\n", file="README.md", append=TRUE)

meanPersianBoys <- toPersian(meanBoys)
meanPersianGirls <- toPersian(meanGirls)
standardPersianBoys <- toPersian(standardBoys)
standardPersianGirls <- toPersian(standardGirls)
cat("## فارسی\n\n", file="README.md", append=TRUE)
cat("| ", file="README.md", append=TRUE)
cat("دختران", file="README.md", append=TRUE)
cat(" | ", file="README.md", append=TRUE)
cat("پسران", file="README.md", append=TRUE)
cat(" |    |\n ", file="README.md", append=TRUE)
cat("| ---: | ---: | ---: |\n", file="README.md", append=TRUE)
cat("| ", meanPersianGirls, " (", standardPersianGirls, ") | ",
    meanPersianBoys, " (", standardPersianBoys, ") | ",
    file="README.md", append=TRUE)
cat("میانگین (انحراف معیار) |\n", file="README.md", append=TRUE)

