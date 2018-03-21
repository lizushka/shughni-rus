library(shiny)
library(DT)

function(input, output) {
  output$filtred_dic <- DT::renderDataTable({
    DT::datatable(read.csv("85-288.csv",sep="\t",header=TRUE)[, input$show_vars, drop = FALSE],
                  options = list(
                    autoWidth = TRUE,
                    columnDefs = list(list(width = '600px', targets = c(-1,-2)),list(visible=FALSE, targets=c(2))),
                    lengthMenu = list(c(10, 30, 50, 100, -1), list('10', '30', '50', '100', 'All')),
                    pageLength = 10,
                    search = list(regex = TRUE),
                    searchHighlight = TRUE))
  })
  output$karam4 <- DT::renderDataTable({
    DT::datatable(read.csv("karam_part1.csv",sep="\t",header=TRUE),
    options = list(
      autoWidth = TRUE,
      columnDefs = list(list(width = '600px', targets = "2")),
      lengthMenu = list(c(10, 30, 50, 100, -1), list('10', '30', '50', '100', 'All')),
      pageLength = 50,
      search = list(regex = TRUE),
      searchHighlight = TRUE))
  })
  output$morph <- DT::renderDataTable({
    DT::datatable(read.csv("morphology.csv",sep=",",header=TRUE),
    options = list(
      autoWidth = TRUE,
      columnDefs = list(list(width = '60%', targets = "5"))))
##    ,
##    options = list(lengthMenu(pageLength = 20)))
  })
}