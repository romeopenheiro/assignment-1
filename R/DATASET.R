#' Data of Digital Word Recognition by Howes and Solomon
#'
#' The package provides a tidy and clean dataset that can be used for Assignment 1 of the course CGSC 5901/4900 X Special Topics in Cognitive Science: Advanced Statistics for Cognitive Science.

#'
#' @format A tibble with 12,240 rows and 11 variables:
#' \describe{
#'   \item{subject}{int Subject ID of the participant}
#'   \item{age}{int Age entered by the participant. Range starts from 18}
#'   \item{gender}{chr Gender entered by the participant}
#'   \item{trial_index}{int Index of each trial before randomization of stimuli presentation}
#'   \item{strings}{chr Words/non-words used as stimuli}
#'   \item{freq}{int }
#'   \item{resp_keys}{chr Key press by the participant. Either "n" or "w"}
#'   \item{resp_corr}{int Integer representation of correct "1" or incorrect "0" key press (resp_keys)}
#'   \item{res_rt}{dbl Reaction time of key press in seconds}
#'   \item{corrans}{chr Denotes if the trial had a word "w" or non-word "n" stimulus presentation}
#'   \item{OS}{chr Denotes the kind of operating system used by a participant during the experiment}
#' }
"DATASET"
