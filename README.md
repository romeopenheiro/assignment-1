
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

## Data

Everything related to the dataset generated can be found in the
following directory structure

``` bash
├── DESCRIPTION
├── LICENSE
├── LICENSE.md
├── NAMESPACE
├── R
│   ├── DATASET.R
│   ├── assignment1-package.R
│   └── utils-pipe.R
├── README.Rmd
├── README.md
├── assignment1.Rproj
├── data
│   └── DATASET.rda
├── data-raw
├── inst
│   └── rmarkdown
│       └── templates
│           └── assignment_template
│               ├── skeleton
│               │   └── skeleton.Rmd
│               └── template.yaml
└── man
    ├── DATASET.Rd
    ├── assignment1-package.Rd
    └── pipe.Rd
```

## Usage

The dataset is a tibble with 12,240 rows and 11 variables. A glimpse of
the variables is provided below.

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

Here is a random sample of 6 rows.

``` r
dplyr::slice_sample(DATASET, n = 6)
#>   subject age gender trial_index     strings freq resp_keys resp_corr resp_rt
#> 1      52  19 female          56    rebuttal    2         w         1  1.1349
#> 2      17  21 female          73    letarery   78         n         1  0.9357
#> 3      74  19 female          38     elegies    1         n         0  0.6851
#> 4      22  25 female          57 percipience    1         w         1  0.7520
#> 5      99  19 female         117 percopoence    1         n         1  2.4682
#> 6      88  20 female           0   assiduous    1         n         0  0.8026
#>   corrans       OS
#> 1       w    Win32
#> 2       n    Win32
#> 3       w    Win32
#> 4       w MacIntel
#> 5       n    Win32
#> 6       w MacIntel
```

## Example

An example of the usage of the package can be seen by following this
[link](https://github.com/romeopenheiro/CGSC5901/tree/main/assignment_1).

## License

This project is licensed under the MIT License - see the
[LICENSE.md](https://github.com/romeopenheiro/assignment-1/blob/main/LICENSE.md)
file for details.
