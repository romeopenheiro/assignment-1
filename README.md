
<!-- README.md is generated from README.Rmd. Please edit that file -->

# assignment1

<!-- badges: start -->
<!-- badges: end -->

The goal of assignment1 is to make accessible, clean, and tidy dataset
for Assignment 1 of the course CGSC 5901/4900 X Special Topics in
Cognitive Science: Advanced Statistics for Cognitive Science at Carleton
University.

## Installation

You can install the development version of assignment1 from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("romeopenheiro/assignment-1")
```

## Usage

The dataset is a tibble with 12,240 rows and 11 variables. A description
of the variables is provided below.

``` r
library(assignment1)
tibble::glimpse(DATASET)
#> Rows: 12,240
#> Columns: 11
#> $ subject     <int> 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1…
#> $ age         <int> 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19…
#> $ gender      <chr> "female", "female", "female", "female", "female", "female"…
#> $ trial_index <int> 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, …
#> $ strings     <chr> "assiduous", "lawyer", "physics", "sympathy", "liberties",…
#> $ freq        <int> 1, 43, 22, 6, 8, 50, 1, 214, 61, 1, 4, 1, 64, 78, 1, 313, …
#> $ resp_keys   <chr> "n", "w", "w", "w", "w", "w", "w", "w", "w", "w", "w", "w"…
#> $ resp_corr   <int> 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 0…
#> $ resp_rt     <dbl> 0.6868, 0.5367, 0.9349, 0.5205, 0.7451, 1.3512, 1.1024, 0.…
#> $ corrans     <chr> "w", "w", "w", "w", "w", "w", "w", "w", "w", "w", "w", "w"…
#> $ OS          <chr> "Win32", "Win32", "Win32", "Win32", "Win32", "Win32", "Win…
```

Here is a sample of the rows.

``` r
dplyr::slice_sample(DATASET)
#>   subject age gender trial_index    strings freq resp_keys resp_corr resp_rt
#> 1     101  19 female          49 altruistic    1         w         1   1.046
#>   corrans       OS
#> 1       w MacIntel
```

You’ll still need to render `README.Rmd` regularly, to keep `README.md`
up-to-date. `devtools::build_readme()` is handy for this. You could also
use GitHub Actions to re-render `README.Rmd` every time you push. An
example workflow can be found here:
<https://github.com/r-lib/actions/tree/v1/examples>.

## Example

An example of the usage of the package can be seen by following this
[link](https://github.com/romeopenheiro/CGSC5901/tree/main/assignment_1).
