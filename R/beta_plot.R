#' Plot beta distribution
#'
#' This function utlises [beta_pal] to produce a visualisation of the beta
#' distribution, with user-specified interpretable conditions.
#'
#'
#' @inheritParams beta_pal
#' @param caption_width Option to control the width of the caption, defaults to
#' 70.
#' @param theme_default Currently defaults to `ggthemes::theme_tufte`.
#'
#' @export

beta_plot <- function(expected_value,
                      within,
                      this_much,
                      caption_width = 70,
                      theme_default = TRUE) {
  # calculate parameters
  par <-
    beta_pal(expected_value = expected_value,
             within = within,
             this_much = this_much)

  # return plot of beta distribution with parameters
  tibble::tibble(x = c(0, 1)) %>%
    ggplot2::ggplot(ggplot2::aes(x = x)) +

    # desired quantiles
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
      args = list(
        shape1 = par$shape1_est,
        shape2 = par$shape2_est
      )
    ) +
    ggplot2::labs(
      title = sprintf("beta(%.1f, %.1f)",
                      par$shape1_est,
                      par$shape2_est),
      y = NULL,
      x = NULL,
      caption = sprintf(
        "Assuming a beta distribution (dotted line), with expected value
        %g (vertical dashed line), and %g of values falling within %g, we
        approximate the distribution beta(%g, %g). Parameters in
        in the title are rounded. The shaded region shows the
        desired interval %g of values falling within %g. In this approximated
        distribution, %g of values fall within %g of %g.",
        expected_value,
        this_much,
        within,
        par$shape1_est,
        par$shape2_est,
        this_much,
        within,
        pbeta(q = expected_value + within, par$shape1_est, par$shape2_est) -
          pbeta(q = expected_value - within, par$shape1_est, par$shape2_est),
        within,
        expected_value
      )
    ) +
    ggplot2::theme(
      axis.text.y = ggplot2::element_blank(),
      axis.ticks.y = ggplot2::element_blank()
    ) -> bplot

    if (isTRUE(theme_default)) {
      bplot + ggthemes::theme_tufte(base_size = 12) + ggplot2::theme(
        axis.text.y = ggplot2::element_blank(),
        axis.ticks.y = ggplot2::element_blank()
      )

    } else {
      bplot
    }

}
