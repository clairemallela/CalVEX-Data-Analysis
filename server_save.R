library(shiny)
library(haven)
library(sqldf)
library(ggplot2)

server <- function(input, output) {
  
  # Data organization
  calvex2023 <- read.csv("data/CalVEX2023.csv")
  calvex2022 <- read.csv("data/CalVEX2023.csv")
  calvex2021 <- read.csv("data/CalVEX2023.csv")
  calvex2020 <- read.csv("data/CalVEX2023.csv")

  calvex2023_pv <- subset(calvex2023, pv_ever == 1)

  # Lookup tables / labels for graph
  # GENDER_2
  gender_labels <- c("1" = "Woman", 
                    "2" = "Man")
  # LGB_2
  sexuality_labels <- c("1" = "LGB/other identity", 
                        "2" = "Straight")
  # AGE_6
  age_labels <- c("1" = "18–24",
                  "2" = "25–34",
                  "3" = "35–44",
                  "4" = "45–54",
                  "5" = "55–64",
                  "6" = "65+")
  # RACE_5
  race_labels <- c("1" = "White, NH",
                  "2" = "Black, NH",
                  "3" = "Asian, NH",
                  "4" = "Hispanic",
                  "5" = "Other/multiple races, NH")

  output$histogram <- renderPlot({
    filtered <- calvex2023_pv
    
    # Filter for GENDER_2
    if (!is.null(input$GENDER_2) && length(input$GENDER_2) > 0) {
      filtered <- subset(filtered, GENDER_2 %in% as.numeric(input$GENDER_2))
    }
    # Filter for LGB_2
    if (!is.null(input$LGB_2) && length(input$LGB_2) > 0) {
      filtered <- subset(filtered, LGB_2 %in% as.numeric(input$LGB_2))
    }
    # Filter for AGE_6
    if (!is.null(input$AGE_6) && length(input$AGE_6) > 0) {
      filtered <- subset(filtered, AGE_6 %in% as.numeric(input$AGE_6))
    }
    #Filter for RACE_5
    if (!is.null(input$RACE_5) && length(input$RACE_5) > 0) {
      filtered <- subset(filtered, RACE_5 %in% as.numeric(input$RACE_5))
    }
    
    # Plot age distribution among those who experienced violence
    ggplot(filtered, aes(x = factor(AGE_6), fill = factor(GENDER_2))) +
      geom_bar(position = "dodge") +
      labs(
        title = "Age Distribution of Respondents Experiencing Violence",
        x = "Age Group",
        y = "Count",
        fill = "Gender"
      ) +
      theme_minimal()
  })

}  

