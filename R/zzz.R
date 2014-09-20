.onLoad <- function(libname, pkgname) {
  require(shiny)
  shiny::addResourcePath("shinythings", system.file("www", package = "shinythings"))
}

.onAttach <- function(libname, pkgname) {
  require(shiny)    
} 