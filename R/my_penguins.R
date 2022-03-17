#' Penguins data.
#'
#' This is some descriptive data collected on penguins
#' This data and documentation come from the \code{palmerpenguins} package,
#' available as \code{\link[palmerpenguins]{palmerpenguins}}.
#'
#' @format The main data frame \code{palmerpenguins} has 344 rows and 8 variables:
#' \describe{
#'   \item{species}{Factor of 3 levels describing what species}
#'   \item{island}{Factor of 3 levels describing what island}
#'   \item{bill_length_mm}{Lengthof bill in millimeters}
#'   \item{bill_depth_mm}{Depth of bill in millimeters}
#'   \item{body_mass_g}{Mass of Penguin in grams}
#'   \item{sex}{Factor of 2 levels describing sex of Penguin}
#'   \item{year}{Year observed, 2007-2009}
#'   }
#'
#' @examples
#' penguins <- my_penguins
#' str(penguins)
#' head(penguins)
#' summary(penguins)
#' table(penguins$island)
#'
"my_penguins"

library(palmerpenguins)
data(penguins)
my_penguins <- penguins

