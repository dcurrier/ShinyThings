# Server script for password input example
library(shinythings)


shinyServer(function(input, output, session) {

  output$shownPass = renderText({
    input$show
    #browser()
    return(paste("Password Entered: ",isolate(input$pass), sep=""))
  })
  
  
  
})