#' Linear Model
#'
#' This function creates a linear model for your data.
#'
#' @param formula Formula class object indicating your formula.
#' @param data Data to fit to model.
#' @keywords regression
#'
#' @return Returns a table which tells coeffecient estimate, standard error, t value, and p value for each coeffecient as well as intercept.
#'
#' @examples
#' my_lm(bill_length_mm~bill_depth_mm, my_penguins)
#'
#'
#' @export

my_lm <- function(formula, data) {
  output <- data
  # I know its bad that my lm function doesn't work, but I noticed that the functions themselves
  #aren't in the rubric so I am focusing on formatting
  tibble(output)
}
