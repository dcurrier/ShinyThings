# UI Definition for Password Input Example

library(shiny)
library(shinythings)

shinyUI(fluidPage(
  # Application Title
  titlePanel("Password Input Example"),
  
  sidebarLayout(
    
    # Sidebar
    sidebarPanel(
      passwordInput('pass', label="Choose a Password", value=""),
      actionButton('show', label="Reveal", icon="eye", icon.library="font awesome"),
      br(),
      actionButton('Test', label='Push Me'),
      actionButton('reset', label="", icon="undo", icon.library="font awesome")
      
      ),
    
    # Main Panel
    mainPanel(
      verbatimTextOutput('shownPass'),
      br(),
      verbatimTextOutput('buttonValue')
      )
    )
  
  ))