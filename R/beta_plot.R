#' plot the distribution of the proportion allocated to the intervention group
#'
#' This function utlises [beta_pal] to produce a visualisation of the beta
#' distribution, with user-specified interpretable conditions.
#'
#' @inheritParams beta_pal
#' @param caption_width Option to control the width of the caption, defaults to
#' 70.
#'
#' @export

beta_plot <- function(
  expected_value,
  within,
  this_much = 0.95,
  caption_width = 70) {
  # calculate parameters
  par <-
    beta_pal(expected_value = expected_value,
             within = within,
             this_much = this_much)

  # return plot of beta distribution with parameters
  tibble::tibble(x = c(0, 1)) %>%
    ggplot2::ggplot(ggplot2::aes(x = x)) +
    ggplot2::geom_rect(
      xmin = expected_value - within,
      xmax = expected_value + within,
      ymin = 0,
      ymax = Inf,
      alpha = 0.2
    ) +
    ggplot2::geom_vline(xintercept = expected_value,
                        linetype = "dashed",
                        alpha = 0.8) +
    ggplot2::stat_function(
      fun = dbeta,
      linetype = "dotted",
      args = list(shape1 = par$shape1, shape2 = par$shape2)
    ) +
    ggplot2::labs(
      title = paste0("beta(",
                     round(par$shape1, 1), ", ",
                     round(par$shape2, 1), ")"),
      y = NULL,
      x = NULL,
      caption = stringr::str_wrap(
        paste0(
          "We assume a beta distribution, drawn with a dotted line,
          with expected centre ",
          expected_value,
          ", illustrated by the vertical dashed line , and ",
          this_much * 100,
          " per cent of values falling within ",
          within,
          "; i.e, within the interval [",
          expected_value - within,
          ",",
          expected_value + within,
          "], shown by the shaded region. Parameters in title are rounded."
        ),
        width = caption_width
      )
    ) +
    ggplot2::theme(
      axis.text.y = ggplot2::element_blank(),
      axis.ticks.y = ggplot2::element_blank()
    )


}
