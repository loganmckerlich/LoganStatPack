#' T test
#'
#' This function performs a one sample T test.
#'
#' @param x Numeric vector of data.
#' @param alternative Specifiys nature of alternative hypothesis. \code{two.sided}, \code{less}, \code{greater}.
#' @param mu Numeric indicating null hypothesis value of the mean.
#' @keywords statistical test
#'
#' @return Returns a list with 4 peices of info: Numeric test statistic, Numeric degrees of freedom, String stating the method used, Numeric P value.
#'
#' @import stats
#'
#' @examples
#' x <- c(34,32,36,2,34,33,29,21,24)
#' mu <- 30
#' my_t.test(x,"two.sided", mu)
#'
#' my_t.test(na.omit(my_penguins$bill_depth_mm), "less", 40)
#'
#' @export

my_t.test <- function(x, alternative, mu) {
  freedom <- length(x) - 1 # degrees of freedom

  se <- sd(x)/sqrt(length(x)) # standard error for test stat
  test.stat <- (mean(x) - mu) / se # calculate test stat

  if(alternative == "two.sided") { # lower and upper tail
    p.val <- pt(abs(test.stat), freedom, lower.tail = F)
  } else if (alternative == "less") { #upper tail
    p.val <- pt(test.stat, freedom, lower.tail = F)
  } else if (alternative == "greater") { # lower tail
    p.val <- pt(test.stat, freedom, lower.tail = T)
  } else {
    stop("Alt was not two.sided, less, or greater")
  }
  my.list <- list() # making output list
  my.list[1] <- paste("test stat: ",test.stat)
  my.list[2] <- paste("degrees of freedom: ", freedom)
  my.list[3] <- paste("method: ", alternative)
  my.list[4] <- paste("p value: ", p.val)

  print(my.list)
} # works
