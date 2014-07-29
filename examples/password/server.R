# Server script for password input example

shinyServer(function(input, output, session) {
  
  # Generate and store the user ID
  userid = paste( isolate(session$clientData$url_port), format( Sys.time(), "%s" ), sep="")
  
  output$shownPass = renderText({
    input$show
    browser()
    return(paste("Password Entered: ",isolate(input$pass), sep=""))
  })
  
})