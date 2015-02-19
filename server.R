x <- seq(-5, 5, by = 0.1)
y <- seq(-5, 5, by = 0.1)

f <- function(x, y) {sin(x^2 / 1.7 + y^2 / 1.7)}
     
g <- function(x, y) {sin(x) * cos(y) * 2}

sinc <- function(x) { y <- sin(x)/x ; y[is.na(y)] <- 1; y }

h <- function(x, y) {5 * sinc( sqrt(x^2+y^2)*3 )}

i <- function(x, y) {sin(x * 2 + y / 1.5)}

shinyServer(
  function(input, output) {
    
    output$draw <- renderPlot({
      if(input$selected != "Volcano") {
      persp(x, y, z <- outer(x, y, FUN = input$selected),  
            theta = input$theta, scale = FALSE,
            phi = input$phi, r = 1, col = "lightgreen",
            shade = .5, expand=1, box = FALSE, d = 0.8, border = NA,
            )
      }
      else {
      persp(volcano, theta = input$theta, phi = input$phi, 
            shade = .5, expand = 0.7, col = "lightgreen", 
            axes = FALSE, box = FALSE, border = NA)
     }
    }, width = 600, height = 600)
    
  }
)