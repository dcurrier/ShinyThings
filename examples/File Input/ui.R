require(shinythings)

shinyUI(fluidPage(
  titlePanel("File Input Example"),
  
  fileInput('test', label="My Label", styleclass="primary")
  
  
))