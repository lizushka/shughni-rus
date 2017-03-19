library(shiny)
library(DT)

sup <- read.csv("85-173.csv",sep="\t",header=TRUE)

fluidPage(
  titlePanel("Шугнанско-русский словарь"),
  p("Этот словарь представляет собой оцифрованную версию словаря И.И.Зарубина."),
  em("Зарубин, И. И. (1960). Шугнанские тексты и словарь. Изд-во Академии наук СССР."),
  p("Специальные символы:"),
  sidebarLayout(
    sidebarPanel(
      checkboxGroupInput('show_vars', 'Please, select information to show:',
                         names(sup), selected = names(sup)), width = 2
    ),
    mainPanel(
      DT::dataTableOutput("filtred_dic"))
))