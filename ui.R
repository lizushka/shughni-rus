library(shiny)
library(shinythemes)
library(DT)

dic <- read.csv("85-288.csv",sep="\t",header=TRUE)

navbarPage(theme = shinytheme("readable"),
  "Shughni Project",
  tabPanel("Shughni-Russian dictionary",
    titlePanel("Шугнанско-русский словарь"),
    p("Это электронная версия словаря Зарубина (Зарубин 1960)."),
    p("Поиск осуществляется по всем полям словаря"),
    p("Вы можете воспользоваться точным поиском, поиском с упрощенной орфографией (все гласные лишены диакритических символов, вместо ǰ используется j, вместо x̌ - x, а также использовать регулярные выражения"),
    p("Специальные символы: á ā ā́ | é ē ḗ ẹ ẹ́ ȇ ȇ́ | í ī ī́ | ó ō ṓ | ú ū ū́ ů ů́ | ɣ ɣ̌ x̌ š č ž ʒ ǰ ð θ"),
    sidebarLayout(
      sidebarPanel(
        checkboxGroupInput('show_vars', 'Please, select columns to show:',
                          names(dic), selected = names(dic)), width = 2
      ),
      mainPanel(
        DT::dataTableOutput("filtred_dic"))
  )),
  tabPanel("Russian-Shughni dictionary",
           titlePanel("Русско-шугнанский словарь"),
           p("Это электронная версия 4 тома словаря Карамшоева (Карамшоев 2005)."),
           p("Специальные символы: á ā ā́ | é ē ḗ ẹ ẹ́ ȇ ȇ́ | í ī ī́ | ó ō ṓ | ú ū ū́ ů ů̌ | ɣ ɣ̌ x̌ š č ž ʒ ǰ ð θ"),
           mainPanel(DT::dataTableOutput("karam4")
           )),
  tabPanel("Morphemes",
    titlePanel("Inflectional and Derivational Affixes"),
    p("Специальные символы: á ā ā́ | é ē ḗ ẹ ẹ́ ȇ ȇ́ | í ī ī́ | ó ō ṓ | ú ū ū́ ů ů̌ | ɣ ɣ̌ x̌ š č ž ʒ ǰ ð θ"),
    mainPanel(DT::dataTableOutput("morph")
  )),
  tabPanel("About",
  p(em("Зарубин, И. И. (1960). Шугнанские тексты и словарь. Изд-во Академии наук СССР.")),
  p(em("Карамшоев Д. Русско-шугнанский словарь (четвертый том) под ред. И.М. Стеблин-Каменского. Душанбе, 2005.")),
  tags$br(),
  tags$br(),
  p("Работа была проведена в рамках научно-исследовательского семинара студентами магистратуры НИУ ВШЭ в 2015-2018гг."),
  tags$hr(),
  p("Со всеми вопросами и комментариями пишите на почту"), tags$a(href="mailto:shughni.project@gmail.com", "shughni.project@gmail.com")
  )
)