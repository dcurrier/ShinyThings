#' Action button/link
#' 
#' Creates an action button whose value is initially zero, and increments by one
#' each time it is pressed.
#' 
#' @param inputId Specifies the input slot that will be used to access the 
#'   value.
#' @param label The contents of the button--usually a text label, but you could 
#'   also use any other HTML, like an image.
#' @param type The Bootstrap style of the button--options are 
#'   primary, info, success, warning, danger, inverse, link or blank
#' @param size The size of the button--options are large, small, mini
#' @param block Whether the button should fill the block
#' @param icon An optional \code{\link{icon}} to appear on the button.
#' @param icon.library specify icon set to use
#'   \url{http://www.fontawesome.io/icons} or
#'   \url{http://getbootstrap.com/2.3.2/base-css.html#icons}
#' @param class Any additional CSS class one wishes to add to the action 
#'   button
#' @param ... Named attributes to be applied to the button or link.
#'
#' @family input elements
#'
#' @examples
#' \dontrun{
#' # In server.R
#' output$distPlot <- renderPlot({
#'   # Take a dependency on input$goButton
#'   input$goButton
#'
#'   # Use isolate() to avoid dependency on input$obs
#'   dist <- isolate(rnorm(input$obs))
#'   hist(dist)
#' })
#'
#' # In ui.R
#' actionButton("goButton", "Go!", icon="space-shuttle", type="success")
#' }   
#' @export
actionButton <- function(inputId, label, type = c("", "primary", "info", "success", "warning", 
                         "danger", "inverse", "link"), size = c("", "large", "small", "mini"), block = F, icon = NULL, 
                         icon.library = c("font awesome", "bootstrap"), class = "", ...) {
 
  
  type <- match.arg(type, c("", "primary", "info", "success", "warning", "danger", "inverse", "link"))
  btn.css.class <- if( type != "" ) paste("btn", type, sep = "-") else type
  
  size <- match.arg(size, c("", "large", "small", "mini"))
  btn.size.class <- if(size != "") paste("btn", size, sep = "-") else size
  
  btn.block <- if (block) "btn-block" else ""
  
  icon.set <- match.arg(icon.library, c("font awesome", "bootstrap"))
  if (!is.null(icon)) {
    set <- switch(icon.set,
                 "font awesome" = "fa fa-",
                 "bootstrap" = "icon-")
    icon.code <- HTML(paste0("<i class='", set, icon, "'></i>"))
  } else icon.code <- ""
  
  tagList(
    tags$head(
      singleton(tags$link(rel = "stylesheet", type = "text/css", href = "shared/font-awesome/css/font-awesome.min.css")),
      singleton(tags$script(src = "shinythings/actionButton-bindings.js"))
    ),
    
    tags$button(id = inputId, type = "button", 
                class = paste("btn action-button", btn.css.class, btn.size.class, btn.block, class, collapse = " "), 
                icon.code, label, ...)
  )
} 


#' updateActionButton
#' 
#' Used in server.R. Show an alert placed in ui.R with shinyalert
#' 
#' @param id Specifies the alert id that will be used to access the
#'   
#' @family ShinyThings elements
#'   
#' @seealso actionButton
#' 
#'   
#' @export
updateActionButton <- function(session, inputId, value=NULL) {
  message <- dropNulls(list(value = value))
  session$sendInputMessage(inputId, message)
}