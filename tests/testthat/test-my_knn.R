test_that("multiplication works", {
  expect_equal(2 * 2, 4)
})

penguins2 <- na.omit(my_penguins)
# within test-my_knn.R
test_that("Make sure my KNN output has 2 parts, class and error", {
  expect_true(length(my_knn_cv(penguins2[c("flipper_length_mm", "bill_depth_mm")], penguins2["species"], 5, 5)) == 2)
})
