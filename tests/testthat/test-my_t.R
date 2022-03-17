test_that("multiplication works", {
  expect_equal(2 * 2, 4)
})
x <- 5
test_that("My t gives warning for wrong alt input", {
  expect_error(my_t.test(x,x,x),"Alt was not two.sided, less, or greater")
})
