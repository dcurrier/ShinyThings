formatNoSci <- function(x) {
  if (is.null(x)) return(NULL)
  format(x, scientific = FALSE, digits = 15)
}

`%AND%` <- function(x, y) {
  if (!is.null(x) && !is.na(x))
    if (!is.null(y) && !is.na(y))
      return(y)
  return(NULL)
}


#' Numeric Input
#' 
#' Creates a numeric input element
#' 
#' @param inputId Specifies the input slot that will be used to access the 
#'   value.
#' @param label The contents of the button--usually a text label, but you could 
#'   also use any other HTML, like an image.
#' @param value of the input element
#' @param minimum of the input element
#' @param maximum of the input element
#' @param step between values of the input element
#'   
#' @family ShinyThings elements
#'   
#'   
#' @export
numericInput <- function (inputId, label, value, min = NA, max = NA, step = NA) {
  
  bindings <- singleton(tags$head(tags$script(src="shinythings/numericInput-bindings.js")))
  
  inputTag <- tags$input(id = inputId, type = "number", value = formatNoSci(value))
  if (!is.na(min)) 
    inputTag$attribs$min = min
  if (!is.na(max)) 
    inputTag$attribs$max = max
  if (!is.na(step)) 
    inputTag$attribs$step = step
  tagList(bindings, label %AND% tags$label(label, `for` = inputId), inputTag)
}


updateNumericInput <- function (session, inputId, label = NULL, value = NULL, min = NULL, 
          max = NULL, step = NULL) {
  message <- dropNulls(list(label = label, value = formatNoSci(value), 
                            min = formatNoSci(min), max = formatNoSci(max), step = formatNoSci(step)))
  session$sendInputMessage(inputId, message)
}