
<!-- README.md is generated from README.Rmd. Please edit that file -->

# parameterpal

<!-- badges: start -->

<!-- badges: end -->

Rather than knowing intrinsically what parameters are required for a
distribution, scientists tend to have a sense of what value they
*expect* a measure to take, *how many* observations should fall *within*
a certain distance of that value.

For the normal distribution, this is straightforward, as the parameters
reflect the expected value and variance. However, for the beta
distribution, the parameters are not so readily interpretable.

`parameterpal::` provides a means of obtaining the parameters required
for the beta distribution from interpretable conditions.

## installation

``` r
devtools::install_github("softloud/parameterpal", build_vignettes = TRUE)
```

## launch tutorial

After installation, the `parameterpal::` tutorial will be available in
the Tutorial pane of Rstudio.

``` r
# executing this code will launch the tutorial in your browser
learnr::run_tutorial("ppalhelp", package = "parameterpal")
```

## documentation

See this package’s
[`pkgdown::`](https://pkgdown.r-lib.org/articles/pkgdown.html)-generated
[site for more information](https://softloud.github.io/parameterpal/).

## intended user

This package was developed for a friend and collaborator, computational
ecologist [Dr Matthew Grainger](https://github.com/DrMattG), who
previously used browser-based tools to obtain beta parameters to inform
his rstats workflow. I hope he finds this package a useful augment to
his codeflow.

# vignette

See `vignette("betapal")` for ~~more information~~ the same information,
but from the handy ease of your Rstudio Viewer pane.

Full disclosure, I need to update it after I fully understand this
[gist](https://gist.github.com/daob/1422e978ff98bdf466fbcb4d9bf3e53e) I
was provided with after posting the first version of this software to
twitter. Open science at its best. Blogpost incoming on open science and
why it’s good to share bad math and beta research code. So cool I’ve
ended up with a better, more mathematically correct solution after
posting it.

# other distributions

No reason the same math can’t be applied to other distributions. Open an
issue if you’d like me to provide parameters from interpretable
conditions for another distribution.

# development on hold

Currently softloud is finishing her dissertation, and with it so close,
she’s focussed on wrapping that up before extending any software beyond
what’s required for the thesis.
