# Modal Example UI


library(shiny)
library(shinythings)

shinyUI(fluidPage(
  div(class="container",
      style="margin-top: 250px; text-align: center;",
      modalButton(label="Show Modal", styleClass="primary", css.class="btn", modal.id="directions")
      ),
  
  modalPanel('directions', header="Directions", body=HTML("<p>Do this</p></br><p>Don't do that!</p>"))
))