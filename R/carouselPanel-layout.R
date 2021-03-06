#' Layout a Carousel Panel
#'
#' Adds a carousel panel to the current shiny app.
#'
#' @param ... Elements of the carousel.  Can be multiple elements wrapped in a 
#'   div(), or single output elements.
#' @param auto.advance Wheather the carousel should automatically advance to the 
#'   next element, of it it should only advance when the user clicks the navigation 
#'   arrows.
#'
#' @examples
#' # Define UI
#' shinyUI(fluidPage(
#'
#'   # Application title
#'   titlePanel("Hello Shiny!"),
#'
#'   sidebarLayout(
#'
#'     # Sidebar with a slider input
#'     sidebarPanel(
#'       sliderInput("obs",
#'                   "Number of observations:",
#'                   min = 0,
#'                   max = 1000,
#'                   value = 500)
#'     ),
#'
#'     # Show a plot of the generated distribution
#'     mainPanel(
#'       carouselPanel(
#'          plotOutput("distPlot"),
#'          plotOutput("xyPlot"),
#'          auto.advance=TRUE
#'        )
#'     )
#'   )
#' ))
#'
#' @export
carouselPanel <- function(..., auto.advance=FALSE){
  n = paste(strsplit(paste(strsplit(as.character(rnorm(1)), "[.]")[[1]], collapse=""), "-")[[1]], collapse="")
  contents = list(...)
  tagList(
    # Import Font Awesome CSS
    singleton(tags$head(tags$link(rel="stylesheet", type="text/css", 
                                  href = "shared/font-awesome/css/font-awesome.min.css"))),
    
    # Overwrite the stock white indicators
    singleton(tags$head(tags$style(".carousel-indicators li {
                                      background-color: #DDD;
                                      background-color: rgba(70,70,70,.25);
                                    }
                                    .carousel-indicators .active {
                                      background-color: #999;
                                    }
                                    .carousel-indicators {
                                      bottom: 15px !important;
                                      top: auto;
                                      list-style: none outside none;
                                      margin: 0;
                                      position: absolute;
                                      right: 70px;
                                      z-index: 5;
                                    }
                                    .carousel-control {
                                      opacity: 0.2;
                                      border: none;
                                    }" ))),
    
    # Set up Javascript to call carousel when document is ready
    if( !auto.advance ){
      singleton(tags$head(tags$script("$(document).ready(function(){
                                        $('.carousel').carousel({
                                            interval: false
                                        });
                                      });")))
      }else{
      singleton(tags$head(tags$script("$(document).ready(function(){
                                        $('.carousel').carousel({
                                            interval: 2000
                                        });
                                      });")))
      },
    
    #Set up carousel
    div(id=paste0("carousel-", n), class="carousel slide", `data-interval`=tolower(as.character(auto.advance)),  
        # Coursel Inner Div - contains the content to display
        div(class="carousel-inner",
            div(class="item active", contents[[1]], style="padding: 0px 70px 30px;"),
            mapply(function(elm){
                list(div(class="item", elm, style="padding: 0px 70px;"))
            }, contents[2:length(contents)], SIMPLIFY=F, USE.NAMES=F)),
        
      # Carousel controls
      a(class="left carousel-control", 
        `data-slide`="prev", 
        href=paste0("#carousel-", n),
        style="background: transparent; color: #000",
        HTML(paste0("<i class='fa fa-chevron-left'></i>")) ),
      
      a(class="right carousel-control", 
        `data-slide`="next", 
        href=paste0("#carousel-", n),
        style="background: transparent; color: #000",
        HTML(paste0("<i class='fa fa-chevron-right'></i>")) ),
      
      # Generate the carousel indicators
      HTML("<ol class='carousel-indicators'>"),
      tag('li', list(class='active', `data-slide-to`=paste(0), 
                     `data-target`=paste0("#carousel-", n))),
      mapply(function(i){
        list(tag('li', list(class='', `data-slide-to`=paste(i), 
                            `data-target`=paste0("#carousel-", n))) )
      }, 1:(length(contents)-1), SIMPLIFY=F, USE.NAMES=F),
      HTML("</ol>")
    )
  )
}