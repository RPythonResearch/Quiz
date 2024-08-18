library(shiny)
library(readxl)

server <- function(input, output) {
  # 엑셀파일 읽어오기
  observeEvent(input$submit, {
    user_code <- input$user_code
    
    correct_code <- 'raw_data <- read_excel("test.xlsx")'
    output$correct_code <- renderText({ correct_code })
    
    result <- tryCatch({
      eval(parse(text = user_code))
    }, error = function(e) {
      paste("코드 실행 중 오류가 발생했습니다:", e$message)
    })
    
    output$result <- renderPrint({
      if (is.character(result) && grepl("오류", result)) {
        print(result)
      } else if (identical(result, read_excel("test.xlsx"))) {
        cat("주의사항: 실행결과가 없는 코드이지만 변수에 적절히 할당된 것을 아래에서 알 수 있습니다.\n\n")
        str(result)
      } else if (is.null(result)) {
        cat("실행결과가 없는 코드입니다.")
      } else {
        print(result)
      }
    })
    
    output$feedback <- renderText({
      if (is.character(result) && grepl("오류", result)) {
        "코드에 오류가 있습니다. 다시 시도해 보세요."
      } else if (!is.null(result) && identical(result, read_excel("test.xlsx"))) {
        "일치합니다."
      } else if (exists("raw_data")) {
        "데이터는 할당되었지만, 내용이 올바르지 않습니다. 파일 경로와 인자를 확인하세요."
      } else {
        "raw_data에 데이터를 할당하지 못했습니다."
      }
    })
  })
  
  # CSV 파일 읽어오기
  observeEvent(input$submit_csv, {
    user_code_csv <- input$user_code_csv
    
    correct_code_csv <- 'raw_data <- read.csv("test.csv")'
    output$correct_code_csv <- renderText({ correct_code_csv })
    
    result_csv <- tryCatch({
      eval(parse(text = user_code_csv))
    }, error = function(e) {
      paste("코드 실행 중 오류가 발생했습니다:", e$message)
    })
    
    output$result_csv <- renderPrint({
      if (is.character(result_csv) && grepl("오류", result_csv)) {
        print(result_csv)
      } else if (identical(result_csv, read.csv("test.csv"))) {
        cat("주의사항: 실행결과가 없는 코드이지만 변수에 적절히 할당된 것을 아래에서 알 수 있습니다.\n\n")
        str(result_csv)
      } else if (is.null(result_csv)) {
        cat("실행결과가 없는 코드입니다.")
      } else {
        print(result_csv)
      }
    })
    
    output$feedback_csv <- renderText({
      if (is.character(result_csv) && grepl("오류", result_csv)) {
        "코드에 오류가 있습니다. 다시 시도해 보세요."
      } else if (!is.null(result_csv) && identical(result_csv, read.csv("test.csv"))) {
        "일치합니다."
      } else if (exists("raw_data")) {
        "데이터는 할당되었지만, 내용이 올바르지 않습니다. 파일 경로와 인자를 확인하세요."
      } else {
        "raw_data에 데이터를 할당하지 못했습니다."
      }
    })
  })
}

