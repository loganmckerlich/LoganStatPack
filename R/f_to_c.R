#' Fahrenheit Converter
#'
#' This function converts from farenheit to celsius.
#'
#' @param temp_F Numeric input indicating temperature in fahrenheit.
#' @keywords temperature.
#'
#' @return Numeric representing \code{temp_F} converted to celsius.
#'
#' @examples
#' f_to_c(32)
#'
#' @export
f_to_c <- function(temp_F) {
  temp_C <- (temp_F - 32) * 5 / 9
  return(temp_C)
}

# run 'devtools::document()' in console when done
