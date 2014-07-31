# Server script for password input example
library(shinythings)


shinyServer(function(input, output, session) {

  output$shownPass = renderText({
    input$show
    #browser()
    return(paste("Password Entered: ",isolate(input$pass), sep=""))
  })
  
  output$buttonValue = renderText({
    input$reset
    return(paste0("Button Value: ", input$Test))
  })
  
  observe({
    input$reset
    updateActionButton(session, 'Test', value=0)
  })
  
})