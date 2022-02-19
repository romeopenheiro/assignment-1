## code to prepare `DATASET` dataset

# Setup packages
if (!requireNamespace('xfun')) install.packages('xfun')
xf <- loadNamespace('xfun')

cran_packages = c(
"readr",
"here",
"tibble",
"data.table",
"magrittr",
"import",
"dplyr",
"usethis",
"readr"
)
if (length(cran_packages) != 0) xf$pkg_load2(cran_packages)
usethis::use_pipe(export = TRUE)
import::from(magrittr, '%>%')

library(readr)
library(here)
library(tibble)
library(data.table)
library(magrittr)
library(import)
library(dplyr)
#library(usethis)
library(readr)
library(devtools)
library(roxygen2)
#library(devtools)

usethis::use_pipe(export = TRUE)
dp <- import::from(dplyr, .all=TRUE, .into={new.env()})

# Make a list of all the csv files in the directory
list <- list.files(here::here("data-raw"), pattern ="*.csv")

# Create a data frame for holding all the data
final <- data.frame(NULL)

#Go though each file, extract the relevant info, add a subject number
for(i in 1:length(list)){
        name <- list[i]
        temp <- data.table::fread(here::here("data-raw", name),
                                  select = c("resp.keys",
                                             "resp.corr",
                                             "resp.rt",
                                             "strings",
                                             "corrans",
                                             "gender (m/f)",
                                             "age",
                                             "freq",
                                             "trials.thisIndex",
                                             "OS"))
        # Remove the practice trials
        temp <- temp[-(1:10),]
        # Add subject number
        temp$subject <- i
        # Concatenate successive files
        final <- dplyr::bind_rows(final, temp)

}

# Rename some of the columns
# Arrange the dataset by columns subject and trial_index
final <-
        final %>%
        dp$rename(gender = `gender (m/f)`,
                  trial_index = trials.thisIndex,
                  resp_keys = resp.keys,
                  resp_corr = resp.corr,
                  resp_rt = resp.rt) %>%
        dp$arrange(subject, trial_index)

# Change the variables in the gender column
final <-
        final %>%
        dp$mutate(gender = dp$case_when(
                gender == "f" | gender == "F"| gender == "Female" ~ "female",
                gender == "m" | gender == "M" | gender == "Male" ~ "male",
                gender == "Non-binary" ~ "non-binary",
                TRUE ~ as.character(gender)

        ))

# Reorder the columns that makes sense to me
final <- dp$relocate(final, subject, age, gender, trial_index, strings, freq)


# Read the data
DATASET <- readr::type_convert(final)
usethis::use_data(DATASET, overwrite = TRUE)
