library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("SpectaculaR"),
  
  sidebarPanel(
    
    radioButtons(inputId = "selected", label = h5("Object type"), 
                 choices = c("Pebble in water" = "f", 
                             "Hills" = "g", "Drop falls into water" = "h", "Waves" = "i", "Volcano"), 
                          selected = "f"),
    sliderInput("phi", "View angle", value = 45, min = 0, max = 90, step = 5),
    sliderInput("theta", "Rotation", value = 45, min = 0, max = 90, step = 5),
    
    h5("Help"),
    helpText(p("This app demonstrates the 3d graphical capabilities of R."),
             p("Choose an object to see it in 3D.",
             "You can rotate the object or change viewpoint vertical angle with sliders."))
  ),
  mainPanel(
    plotOutput("draw")
  )
))
