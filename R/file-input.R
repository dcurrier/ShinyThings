#' File Upload Control
#'
#' Create a file upload control that can be used to upload one or more files.  This 
#' input incorporates method of Trevor Davis to allow the 'Browse' button to be styled: 
#' \url{https://gist.github.com/davist11/645816}  
#'
#' Whenever a file upload completes, the corresponding input variable is set
#' to a dataframe. This dataframe contains one row for each selected file, and
#' the following columns:
#' \describe{
#'   \item{\code{name}}{The filename provided by the web browser. This is
#'   \strong{not} the path to read to get at the actual data that was uploaded
#'   (see
#'   \code{datapath} column).}
#'   \item{\code{size}}{The size of the uploaded data, in
#'   bytes.}
#'   \item{\code{type}}{The MIME type reported by the browser (for example,
#'   \code{text/plain}), or empty string if the browser didn't know.}
#'   \item{\code{datapath}}{The path to a temp file that contains the data that was
#'   uploaded. This file may be deleted if the user performs another upload
#'   operation.}
#' }
#'
#' @family input elements
#'
#' @param inputId Input variable to assign the control's value to.
#' @param label Display label for the control.
#' @param multiple Whether the user should be allowed to select and upload
#'   multiple files at once. \bold{Does not work on older browsers, including
#'   Internet Explorer 9 and earlier.}
#' @param accept A character vector of MIME types; gives the browser a hint of
#'   what kind of files the server is expecting.
#' @param styleclass A character vector containing a Bootstrap button class: 
#'  "primary", "info", "success", "warning", "danger", "inverse", "link".
#'
#' @export
fileInput <- function(inputId, label, multiple = FALSE, accept = NULL, styleclass = NULL) {
  styleclass <- match.arg(styleclass, c("primary", "info", "success", "warning", 
                                         "danger", "inverse", "link"))
  buttonClass <- paste0("btn btn-", styleclass, " browse-btn")
  buttonTag <- tags$button(class=buttonClass, "Browse")
  inputTag <- tags$input(id = inputId, name = inputId, type = "file")
  if (multiple)
    inputTag$attribs$multiple <- "multiple"
  if (length(accept) > 0)
    inputTag$attribs$accept <- paste(accept, collapse=',')
  
  tagList(
    tags$head(
      singleton(tags$script(src="shinythings/fileInput-script.js", type="text/javascript")),
      singleton(tags$link(rel = "stylesheet", type="text/css", 
                          href="shinythings/fileInput-style.css"))
    ),
    label %AND% tags$label(label),
    tags$span(class="file-wrapper", inputTag, buttonTag),
    tags$div(
      id=paste(inputId, "_progress", sep=""),
      class="progress progress-striped active shiny-file-input-progress",
      tags$div(class="bar"),
      tags$label()
    )
  )
}