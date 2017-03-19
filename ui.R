library(shiny)
library(shinythemes)
library(DT)

sup <- read.csv("85-173.csv",sep="\t",header=TRUE)

navbarPage(theme = shinytheme("readable"),
  "Шугнанско-русский словарь",
  tabPanel("Dictionary",
    titlePanel("Шугнанско-русский словарь"),
    p("Специальные символы:"),
    sidebarLayout(
      sidebarPanel(
        checkboxGroupInput('show_vars', 'Please, select information to show:',
                          names(sup), selected = names(sup)), width = 2
      ),
      mainPanel(
        DT::dataTableOutput("filtred_dic"))
  )),
  tabPanel("About",
  p("Этот словарь представляет собой оцифрованную версию словаря И.И.Зарубина."),
  p(em("Зарубин, И. И. (1960). Шугнанские тексты и словарь. Изд-во Академии наук СССР."))
  )
)