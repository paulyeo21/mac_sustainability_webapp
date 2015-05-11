library(dygraphs)

# shinyUI(fluidPage(
#   
#   titlePanel("Predicted Deaths from Lung Disease (UK)"),
#   
#   sidebarLayout(
#     sidebarPanel(
#       numericInput("months", label = "Months to Predict", 
#                    value = 72, min = 12, max = 144, step = 12),
#       selectInput("interval", label = "Prediction Interval",
#                   choices = c("0.80", "0.90", "0.95", "0.99"),
#                   selected = "0.95"),
#       checkboxInput("showgrid", label = "Show Grid", value = TRUE)
#     ),
#     mainPanel(
#       dygraphOutput("dygraph")
#     )
#   )
# ))

library(shinydashboard)

header <- dashboardHeader(
  title = "Mac Sustainability"
)

body <- dashboardBody(
  fluidPage(
    fluidRow(
      column(width= 12,
        box(width = NULL, solidHeader = T,
          dygraphOutput("dygraph")
        )
      )
    ),
    fluidRow(
      shiny::column(4, offset = 4,
        selectInput("plotType", label = "Diversion Rate or Waste Types",
        choices = c("Diversion Rate", "Waste Types"), selected = "1")
      )
    )
  )
)

dashboardPage(
  header,
  dashboardSidebar(disable = TRUE),
  body
)
