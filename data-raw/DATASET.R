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
        dp$arrange(subject, trial_index) %>%
        dp$mutate(log10_freq = log10(freq))

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
final <- dp$relocate(final, subject, age, gender, trial_index, strings, freq, log10_freq)

# Check with columns have missing values to perform missing value imputations
colSums(is.na(final))

# Resp_corr has 0 for incorrect and missed trials
# This is not good, as the 0 in resp_corr maybe interpreted as incorrect trials
# Therefore, resp_corr will be coded as NA for trials where resp_rt is NA
# Also, this will allow trials trials where resp_rt is NA to be excluded from accuracy calculation
final <-
        final %>%
        dp$mutate(resp_corr =
                          ifelse(is.na(resp_rt), NA, as.numeric(resp_corr)))

# Create a table of the median values
# Calculate median of each subject for the word/non-word trials
median_table <- final %>%
        dp$group_by(subject, corrans) %>%
        dp$summarise(median = median(resp_rt, na.rm = T))

# For each subject with a missing RT value, replace the MV of the word/non-word trial with the respective word/non-word median RT of the subject
# Median is used as it is not affected by outliers
for(i in 1:nrow(final)) {
        # Conduct the following operation for only the NA rows
        if(is.na(final$resp_rt[i])) {
                # Temporary variables for subject and corrans
                sub_temp <- final$subject[i]
                cor_temp <- final$corrans[i]
                # Assign the median value from the table to only the missing values in resp_rt
                final$resp_rt[i] <- median_table[median_table$subject == sub_temp & median_table$corrans == cor_temp,][[3]]
        }
}

# Check with columns have missing values to perform missing value imputations
colSums(is.na(final))

# Age and gender value missing for subject 78
# The data of this subject will be kept for age/gender analysis

# Read the data
DATASET <- readr::type_convert(final)
usethis::use_data(DATASET, overwrite = TRUE)
