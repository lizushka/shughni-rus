library(shiny)
library(DT)

function(input, output) {
  sup <- read.csv("85-173.csv",sep="\t",header=TRUE)
  output$filtred_dic <- DT::renderDataTable({
    DT::datatable(sup[, input$show_vars, drop = FALSE],
                  options = list(lengthMenu = list(c(10, 30, 50, 100, -1), list('10', '30', '50', '100', 'All')), pageLength = 10))
  })
}