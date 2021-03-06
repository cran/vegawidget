#' Assert that packages are loaded
#'
#' This function can be useful in writing package functions that use
#' functions from packages that you "suggest". It asserts that these packages
#' are available, and throws an informative error for those packages
#' that are not.
#'
#' @param packages `character` vector of package names to check
#' @param ...      `character` package names to check
#'
#' @return `logical` indicating success
#' @examples
#'   # put packages in a character vector
#'   assert_packages(c("base", "utils"))
#'
#'   # or by themselves
#'   assert_packages("base", "utils")
#'
#' \dontrun{
#'   # intentionally invokes error-behavior
#'   assert_packages("utils2")
#' }
#'
#' @seealso [R Packages book](http://r-pkgs.had.co.nz/description.html#dependencies)
#' @keywords internal
#' @noRd
#'
assert_packages <- function(packages, ...) {

  packages <- c(packages, ...)

  is_missing <-
    vapply(packages, function(x) {!requireNamespace(x, quietly = TRUE)}, TRUE)

  missing_pkgs <- packages[is_missing]

  quote_missing_pkgs <-
    vapply(missing_pkgs, function(x) {paste0('"', x, '"')}, "")

  assertthat::assert_that(
    identical(length(missing_pkgs), 0L),
    msg = paste(
      "Package(s):",
      paste(quote_missing_pkgs, collapse = ", "),
      "needed for this function to work. Please install.",
      sep = " "
    )
  )

}

