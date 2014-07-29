# UI Definition for Password Input Example

source(file.path('U:','Codes','R','ShinyThings','shinythings','R','password-input.R'))

shinyUI(fluidPage(
  tags$head(
    tags$script(type="text/javascript", src="passwordInput-bindings.js")
  ),
  # Application Title
  titlePanel("Password Input Example"),
  
  sidebarLayout(
    
    # Sidebar
    sidebarPanel(
      passwordInput('pass', label="Choose a Password", value=""),
      actionButton('show', label="Reveal")
      ),
    
    # Main Panel
    mainPanel(
      verbatimTextOutput('shownPass')
      )
    )
  
  ))