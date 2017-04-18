library(shiny)
library(shinythemes)
library(DT)

dic <- read.csv("85-192_225-243.csv",sep="\t",header=TRUE)

navbarPage(theme = shinytheme("readable"),
  "Shughni Project",
  tabPanel("Dictionary",
    titlePanel("Шугнанско-русский словарь"),
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
  tabPanel("Morphemes",
    titlePanel("Inflectional and Derivational Affixes"),
    p("Специальные символы: á ā ā́ | é ē ḗ ẹ ẹ́ ȇ ȇ́ | í ī ī́ | ó ō ṓ | ú ū ū́ ů ů́ | ɣ ɣ̌ x̌ š č ž ʒ ǰ ð θ"),
    mainPanel(DT::dataTableOutput("morph")
  )),
  tabPanel("About",
  p("Этот словарь представляет собой оцифрованную версию словаря И.И.Зарубина."),
  p(em("Зарубин, И. И. (1960). Шугнанские тексты и словарь. Изд-во Академии наук СССР.")),
  p("Работа была проведена в рамках научно-исследовательского семинара студентами магистратуры НИУ ВШЭ."),
  p("Со всеми вопросами и комментариями пишите на почту shughni.project@gmail.com")
  )
)