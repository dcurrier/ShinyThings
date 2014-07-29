#' Password Input
#' 
#' Creates a password input element that obscures any text entered.  The value is 
#' not encrypted before transmission to the server.  This is intended to provide 
#' the look and feel of typical password field to those who know that there is 
#' absolutely NO SECURITY in using it within your app.  The data transmitted is 
#' PLAIN, UNENCRYPTED TEXT.
#' 
#' @param inputId Specifies the input slot that will be used to access the 
#'   value.
#' @param label The contents of the button--usually a text label, but you could 
#'   also use any other HTML, like an image.
#' @param value of the input element
#'   
#' @family ShinyThings elements
#'   
#'   
#' @export
passwordInput <- function(inputId, label, value = "") {
  tagList(
    # This makes web page load the JS file in the HTML head.
    # The call to singleton ensures it's only included once
    # in a page.
    shiny::singleton(
      shiny::tags$head(
        shiny::tags$script(src = "shinythings/passwordInput-bindings.js")
      )
    ),
    shiny::tags$label(label, `for` = inputId),
    shiny::tags$input(id = inputId, type = "password", value = value)
  )
}


#' Update Password Input
#' 
#' Updates a password input element.
#' 
#' @param session identifier
#' @param inputId Specifies the input slot that will be used to access the 
#'   value.
#' @param new label The contents of the button--usually a text label, but you could 
#'   also use any other HTML, like an image.
#' @param new value of the input element
#'   
#' @family ShinyThings elements
#'   
#'   
#' @export
# Send an update message to a password input on the client.
# This update message can change the value and/or label.
updatePasswordInput <- function(session, inputId,
                           label = NULL, value = NULL) {
  
  message <- dropNulls(list(label = label, value = value))
  session$sendInputMessage(inputId, message)
}


#' Remove Null Values
#' 
#' Drops NULL values from the list suuplied.
#' 
#' @param a vector or list of values that might contain 
#' NULL values
#' 
#' @family ShinyThings helpers
#' 
# Given a vector or list, drop all the NULL items in it
dropNulls <- function(x) {
  x[!vapply(x, is.null, FUN.VALUE=logical(1))]
}
