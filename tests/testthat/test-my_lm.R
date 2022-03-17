test_that("multiplication works", {
  expect_equal(2 * 2, 4)
})

# within test-my_lm.R
test_that("My lm returns a tibble (type list)", {
  expect_type(my_lm(bill_length_mm~bill_depth_mm, my_penguins), 'list')
})
