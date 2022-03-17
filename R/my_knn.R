#' Cross Validated K-Nearest Neighbors
#'
#' This function predicts class based off of covariates using KNN methods. Note to remove NA
#'
#' @param data Numeric input indicating temperature in fahrenheit.
#' @param cl true class of training data.
#' @param k_nn Integer for number of neighbors.
#' @param k_cv Integer for number of folds in cross validation.
#' @keywords machine learning
#'
#' @return List of 2 outputs: Vector of predicted class for all observations. Numeric for cross validated misclassification error
#'
#' @import class
#' @import dplyr
#'
#' @export
#'
#' @examples
#' penguins2 <- na.omit(my_penguins)
#' my_knn_cv(penguins2[c("flipper_length_mm", "bill_depth_mm")], penguins2["species"], 5, 5)
my_knn_cv <- function(data,cl, k_nn, k_cv){
  output <- list()
  errorList = vector(length = k_cv)
  classList = vector(length = 0)

  # adding this so I can split up the data randomly
  data$rand_obs<-seq(1,nrow(data))
  cl$rand_obs<-seq(1,nrow(cl))
  data$partition <- data$rand_obs %% k_cv +1
  cl$partition <- data$rand_obs %% k_cv +1

  #cross validation
  for (i in 1:k_cv) {
    test <- data[which(data$partition==i),]
    testcl <- cl[which(cl$partition ==i),]
    # train1 is data that isnt in this test
    train1 <- anti_join(data,test)
    cl1 <- anti_join(cl,testcl)

    #remove unneeded columns
    train1 <- train1 %>%
      select(-rand_obs, -partition)
    test <- test %>%
      select(-rand_obs, -partition)

    # change the first column to class to make function more universal
    cl1 <- cl1 %>%
      rename_with(.cols = 1, ~"class")
    cl1 <- cl1$class

    # Predict y useing knn
    test$species_hat <- knn(train = train1, test = test, cl = cl1, k = k_nn)

    test$class = testcl$species
    test$wrong <- ifelse(test$species_hat == test$class,0,1)
    error <- sum(test$wrong)/length(test)

    errorList[i] <- error
    classList <- append(classList,test$species_hat)
  }

  meanError <- mean(errorList)

  output[1] <- meanError
  output[[2]] <- classList

  return(output)
} # works
