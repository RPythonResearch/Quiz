library(shiny)
library(shinydashboard)

# UI 구성
ui <- dashboardPage(
  dashboardHeader(
    title = "R 퀴즈",
    tags$li(
      a(href = "https://rpythonstudy.github.io/Website/R_DE.html",
        icon("external-link-alt"),
        "R개발환경구축",
        target = "_blank"),
      class = "dropdown"
    ),
    tags$li(
      a(href = "https://rpythonstudy.github.io/Website/R_syntax.html",
        icon("external-link-alt"),
        "R 문법",
        target = "_blank"),
      class = "dropdown"
    ),
    tags$li(
      a(href = "https://rpythonstudy.github.io/Website/basic_statistics.html",
        icon("external-link-alt"),
        "R기본통계",
        target = "_blank"),
      class = "dropdown"
    ),
    tags$li(
      a(href = "https://rpythonstudy.github.io/Website/R_manuscript.html",
        icon("external-link-alt"),
        "Quarto로논문쓰기",
        target = "_blank"),
      class = "dropdown"
    )
    ,
    tags$li(
      a(href = "https://rpythonstudy.github.io/Website/preprocessing.html",
        icon("external-link-alt"),
        "데이터전처리",
        target = "_blank"),
      class = "dropdown"
    )
  ),
  
  dashboardSidebar(
    sidebarMenu(
      menuItem("1. 파일입출력 (24.08.18)", tabName = "file_io", icon = NULL,
               menuSubItem("파일경로 지정하기 (24.08.18)", tabName = "file_path", icon = NULL),
               menuSubItem("엑셀파일 읽어오기 (24.08.18)", tabName = "excel_import", icon = NULL),
               menuSubItem("CSV파일 읽어오기 (242.08.18)", tabName = "csv_import", icon = NULL)
      ),
      menuItem("To be determined", tabName = "others", icon = icon("tasks"))
    )
  ),
  
  dashboardBody(
    tabItems(
      # 엑셀파일 읽어오기 탭
      tabItem(tabName = "file_path",
              fluidPage(
                titlePanel("파일경로 지정하기 (24.08.18)"),
                
                fluidRow(
                  column(12,
                         p("R에서 파일의 경로를 지저앟는 방법은 Excel 파일을 읽어오는 주요 함수들은 다음과 같습니다:"),
                         p("`read_excel` 함수는 R에서 Excel 파일을 읽어오는 가장 널리 사용되는 함수 중 하나입니다. 다음은 `read_excel` 함수의 주요 인자와 기본값에 대한 설명입니다:"),
                         p("아래에 `read_excel` 함수를 사용하여 프로젝트 폴더의 `test.xlsx` 파일을 읽어서 `raw_data` 변수에 할당하는 코드를 작성하세요."),
                         
                         textAreaInput("user_code", "R 코드 입력:", value = "", rows = 5, width = '100%'),
                         actionButton("submit", "실행 및 결과확인")
                  )
                ),
                
                fluidRow(
                  column(12,
                         h4("실행 결과"),
                         verbatimTextOutput("result"),
                         h4("출제자가 생각한 코드"),
                         verbatimTextOutput("correct_code"),
                         h4("피드백"),
                         verbatimTextOutput("feedback")
                  )
                )
              )
      ),
      
      # 엑셀파일 읽어오기 탭
      tabItem(tabName = "excel_import",
              fluidPage(
                titlePanel("엑셀파일 읽어오기 (24.08.18)"),
                
                fluidRow(
                  column(12,
                         p("R에서 Excel 파일을 읽어오는 주요 함수들은 다음과 같습니다:"),
                         tags$ul(
                           tags$li("`read_excel()` (from `readxl` package)"),
                           tags$li("`read.xlsx()` (from `openxlsx` package)"),
                           tags$li("`xlsx::read.xlsx()` (from `xlsx` package)"),
                           tags$li("`readWorkbook()` (from `XLConnect` package)"),
                           tags$li("`read_xlsx()` (from `readr` package)")
                         ),
                         p("`read_excel` 함수는 R에서 Excel 파일을 읽어오는 가장 널리 사용되는 함수 중 하나입니다. 다음은 `read_excel` 함수의 주요 인자와 기본값에 대한 설명입니다:"),
                         tags$ul(
                           tags$li("`path`: 읽어올 Excel 파일의 경로를 지정합니다. (예: `\"data.xlsx\"`)"),
                           tags$li("`sheet`: 읽어올 시트의 이름 또는 번호를 지정합니다. 기본값은 첫 번째 시트입니다. (기본값: `1`)"),
                           tags$li("`range`: 특정 범위의 셀을 읽어올 때 사용됩니다. 범위를 지정하지 않으면 전체 시트를 읽습니다. (기본값: `NULL`)"),
                           tags$li("`col_names`: `TRUE`로 설정하면 첫 번째 행이 열 이름으로 사용됩니다. (기본값: `TRUE`)"),
                           tags$li("`col_types`: 열의 데이터 타입을 지정합니다. 자동으로 감지되지만, 필요에 따라 수동으로 지정할 수 있습니다. (기본값: `NULL`)")
                         ),
                         p("아래에 `read_excel` 함수를 사용하여 프로젝트 폴더의 `test.xlsx` 파일을 읽어서 `raw_data` 변수에 할당하는 코드를 작성하세요."),
                         
                         textAreaInput("user_code", "R 코드 입력:", value = "", rows = 5, width = '100%'),
                         actionButton("submit", "실행 및 결과확인")
                  )
                ),
                
                fluidRow(
                  column(12,
                         h4("실행 결과"),
                         verbatimTextOutput("result"),
                         h4("출제자가 생각한 코드"),
                         verbatimTextOutput("correct_code"),
                         h4("피드백"),
                         verbatimTextOutput("feedback")
                  )
                )
              )
      ),
      
      # 엑셀파일 읽어오기 탭
      tabItem(tabName = "excel_import",
              fluidPage(
                titlePanel("엑셀파일 읽어오기 (24.08.18)"),
                
                fluidRow(
                  column(12,
                         p("R에서 Excel 파일을 읽어오는 주요 함수들은 다음과 같습니다:"),
                         tags$ul(
                           tags$li("`read_excel()` (from `readxl` package)"),
                           tags$li("`read.xlsx()` (from `openxlsx` package)"),
                           tags$li("`xlsx::read.xlsx()` (from `xlsx` package)"),
                           tags$li("`readWorkbook()` (from `XLConnect` package)"),
                           tags$li("`read_xlsx()` (from `readr` package)")
                         ),
                         p("`read_excel` 함수는 R에서 Excel 파일을 읽어오는 가장 널리 사용되는 함수 중 하나입니다. 다음은 `read_excel` 함수의 주요 인자와 기본값에 대한 설명입니다:"),
                         tags$ul(
                           tags$li("`path`: 읽어올 Excel 파일의 경로를 지정합니다. (예: `\"data.xlsx\"`)"),
                           tags$li("`sheet`: 읽어올 시트의 이름 또는 번호를 지정합니다. 기본값은 첫 번째 시트입니다. (기본값: `1`)"),
                           tags$li("`range`: 특정 범위의 셀을 읽어올 때 사용됩니다. 범위를 지정하지 않으면 전체 시트를 읽습니다. (기본값: `NULL`)"),
                           tags$li("`col_names`: `TRUE`로 설정하면 첫 번째 행이 열 이름으로 사용됩니다. (기본값: `TRUE`)"),
                           tags$li("`col_types`: 열의 데이터 타입을 지정합니다. 자동으로 감지되지만, 필요에 따라 수동으로 지정할 수 있습니다. (기본값: `NULL`)")
                         ),
                         p("아래에 `read_excel` 함수를 사용하여 프로젝트 폴더의 `test.xlsx` 파일을 읽어서 `raw_data` 변수에 할당하는 코드를 작성하세요."),
                         
                         textAreaInput("user_code", "R 코드 입력:", value = "", rows = 5, width = '100%'),
                         actionButton("submit", "실행 및 결과확인")
                  )
                ),
                
                fluidRow(
                  column(12,
                         h4("실행 결과"),
                         verbatimTextOutput("result"),
                         h4("출제자가 생각한 코드"),
                         verbatimTextOutput("correct_code"),
                         h4("피드백"),
                         verbatimTextOutput("feedback")
                  )
                )
              )
      ),
      # CSV 파일 읽어오기 탭
      tabItem(tabName = "csv_import",
              fluidPage(
                titlePanel("1.2 CSV파일 읽어오기 (24.08.18)"),
                
                fluidRow(
                  column(12,
                         p("R에서는 CSV 파일을 읽어오는 다양한 함수가 제공됩니다. 주요 함수들은 다음과 같습니다:"),
                         tags$ul(
                           tags$li("`read.csv()` (기본 R 함수)"),
                           tags$li("`read_csv()` (from `readr` package)"),
                           tags$li("`fread()` (from `data.table` package)")
                         ),
                         p("`read.csv` 함수는 R에서 CSV 파일을 읽어오는 가장 널리 사용되는 기본 함수입니다. 다음은 `read.csv` 함수의 주요 인자와 기본값에 대한 설명입니다:"),
                         tags$ul(
                           tags$li("`file`: 읽어올 CSV 파일의 경로를 지정합니다."),
                           tags$li("`header`: 첫 번째 행을 열 이름으로 사용할지 여부를 지정합니다. (기본값: `TRUE`)"),
                           tags$li("`sep`: 필드를 구분하는 문자를 지정합니다. CSV의 경우 기본값은 쉼표(`,`)입니다. (기본값: `\",\"`)"),
                           tags$li("`quote`: 문자 데이터에서 사용되는 인용 부호를 지정합니다. (기본값: `\"\\\"\"`)"),
                           tags$li("`dec`: 소수점을 나타내는 문자를 지정합니다. (기본값: `\".\"`)"),
                           tags$li("`fill`: 열이 다른 행보다 적을 경우, 빈 값을 자동으로 채울지 여부를 지정합니다. (기본값: `TRUE`)"),
                           tags$li("`comment.char`: 주석으로 간주할 시작 문자를 지정합니다. (기본값: `\"\"`)")
                         ),
                         p("아래에 `read.csv` 함수를 사용하여 프로젝트 폴더의 `test.csv` 파일을 읽어서 `raw_data` 변수에 할당하는 코드를 작성하세요."),
                         
                         textAreaInput("user_code_csv", "R 코드 입력:", value = "", rows = 5, width = '100%'),
                         actionButton("submit_csv", "실행 및 결과확인")
                  )
                ),
                
                fluidRow(
                  column(12,
                         h4("실행 결과"),
                         verbatimTextOutput("result_csv"),
                         h4("출제자가 생각한 코드"),
                         verbatimTextOutput("correct_code_csv"),
                         h4("피드백"),
                         verbatimTextOutput("feedback_csv")
                  )
                )
              )
      ),
      
      # 다른 기능이 포함된 탭 (현재는 내용 없음)
      tabItem(tabName = "others",
              h2("To be determined"),
              p("이 탭에는 다른 다양한 R 기능 및 퀴즈를 추가할 수 있습니다.")
      )
    )
  )
)
