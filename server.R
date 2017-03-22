library(shiny)
library(DT)

function(input, output) {
  dic <- read.csv("85-173.csv",sep="\t",header=TRUE)
  output$filtred_dic <- DT::renderDataTable({
    DT::datatable(dic[, input$show_vars, drop = FALSE],
                  options = list(autoWidth = TRUE, columnDefs = list(list(width = '400px', targets = c(1, 3))),
                    lengthMenu = list(c(10, 30, 50, 100, -1), list('10', '30', '50', '100', 'All')), pageLength = 10))
  })
  output$morph <- DT::renderDataTable(DT::datatable(read.csv("morph_2203.csv",sep="\t",header=TRUE)), options = list(lengthMenu(pageLength = 20)))
}
