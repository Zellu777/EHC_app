#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

#stats <- data.frame(read_excel("Studium/Semester 6/Test Shiny/Hockey Stats.xlsx"))
#stats
getwd()
library(shiny)


stats <- read.csv("hockey-stats.csv", sep = ";")


# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("EHC Frauenfeld Stats Saison 19/20"),
   
     # Sidebar with a slider input for number of bins 
  #   selectInput(inputId = "Position", label = strong("Position"),
  #               choices = c("Stuermer","Verteidiger", "Alle"),
  #               selected = "Alle"),
  tags$img(src = "EHC_logo.png", height = 300, width = 300, align = "right"),
    selectInput(inputId = "xcol", label = strong("X Variable"),
                  choices = c("GP","G", "A","PTS","P.GP", "PIM.Total"),
                  selected = "Auswahl"),
    selectInput(inputId = "ycol", label = strong("Y Variable"),
                choices = c("GP","G", "A","PTS","P.GP", "PIM.Total"),
                selected = "Auswahl"),

    
  
  
        # Show a plot of the generated distribution
        mainPanel(
          
          plotOutput("plot1"),
          h6(icon("f25d", class = "far fa-registered")," Zelli")
        )
  )
  
# Define server logic required to draw a histogram
server <- function(input, output,session) {

    output$plot1 <- renderPlot({

      plot(stats[, input$xcol], stats[, input$ycol],
           xlim = c(0, max(stats[, input$xcol])+1),
           ylim = c(0, max(stats[, input$ycol])+1),
           xlab = input$xcol,
           ylab = input$ycol)
      
      text(stats[, input$xcol], stats[, input$ycol], labels = stats$Spieler,cex= 0.7, pos= 3)
        
        
      })

    
  }



# Run the application 
shinyApp(ui = ui, server = server)


