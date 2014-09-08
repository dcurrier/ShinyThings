#' Modal button
#' 
#' Creates a button that launches a modal.
#' 
#' @param label The contents of the button--usually a text label, but you could 
#'   also use any other HTML, like an image.
#' @param styleclass The Bootstrap styling class of the button--options are 
#'   primary, info, success, warning, danger, inverse, link or blank
#' @param size The size of the button--options are large, small, mini
#' @param block Whehter the button should fill the block
#' @param icon Display an icon for the button
#' @param specify icon set to use
#'   \url{http://www.fontawesome.io/icons} or
#'   \url{http://getbootstrap.com/2.3.2/base-css.html#icons}
#' @param css.class Any additional CSS class one wishes to add to the action 
#'   button
#' @param modal.id The id of the modal that the button should toggle.
#'   
#' @family ShinyThings elements
#'   
#'
#' @export
modalButton <- function(label, styleclass = "", size = "",  block = F, 
                        icon = NULL, icon.library = c("font awesome", "bootstrap"),  
                        css.class = "", modal.id, ...) {
  
  
  if (styleclass %in% c("primary", "info", "success", "warning", 
                        "danger", "inverse", "link")) {
    btn.css.class <- paste("btn", styleclass, sep = "-")
  } else btn.css.class = ""
  
  if (size %in% c("large", "small", "mini")) {
    btn.size.class <- paste("btn", size, sep = "-")
  } else btn.size.class = ""
  
  if (block) {
    btn.block = "btn-block"
  } else btn.block = ""
  
  if (!is.null(icon)) {
    if( !(icon.library[1] %in% c("font awesome", "bootstrap")) ){
      icon.set = "font awesome"
    }else{
      icon.set = icon.library[1]
    }
    set = switch(icon.set,
                 "font awesome" = "fa fa-",
                 "bootstrap" = "icon-")
    icon.code <- HTML(paste0("<i class='", set, icon, "'></i>"))
  } else icon.code = ""
  
  tagList(
    # This makes web page load the CSS file in the HTML head.
    # The call to singleton ensures it's only included once
    # in a page.
    singleton(
      tags$head(
        tags$link(rel = "stylesheet", 
                  type = "text/css", 
                  href = "shared/font-awesome/css/font-awesome.min.css"),
        tags$script(src = "shinythings/actionButton-bindings.js")
      )
    ),
    
    tags$button(type = "button", class = paste("btn action-button", 
                                                btn.css.class, btn.size.class, btn.block, css.class, collapse = " "), 
                icon.code, label, `data-toggle` = "modal", href=paste0("#", modal.id), ...)
  )
} 

