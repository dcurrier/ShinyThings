#' Layout a Modal
#'
#' Adds a modal to the current shiny app.
#'
#' @param outputId Element id.
#' @param header Text to use as the modal header.  
#' @param body Elements to use as the modal body.
#' @param footer Elements to use as the modal footer.
#' 
#'
#' 
#'
#' @export
modalPanel <- function(outputId, header=NULL, body=NULL, footer=NULL){
  tagList(    
    #Set up carousel
    div(id=outputId, class="modal hide fade", tabindex="-1", role="dialog", `aria-labelledby`="myModalLabel", `aria-hidden`="true",
       # Insert Header
        if(!is.null(header)){
         HTML(paste0('<div class="modal-header">
           <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>',
           header,
         '</div>' ))
       },
       
      # Insert Body
       if(!is.null(body)){
         HTML(paste0('<div class="modal-body">', 
                     if(is.null(header)) '<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>',
                     body, '</div>') )
       },

      # Insert Footer
       if(!is.null(footer)){
         HTML(paste0('<div class="modal-footer">', footer, '</div>'))
       }
    ))
  }