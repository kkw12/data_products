#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above. thank you
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(theme="bootstrap.css", 
                  tags$head(
                    tags$style(HTML("
                                    @import url('//fonts.googleapis.com/css?family=Lobster|Cabin:400,700');
                                    "))
                    ),
                  
                  headerPanel(
                    h1("Styled app for data exploration mtcars dataset", 
                       style = "font-family: 'Lobster', cursive;
                       font-weight: 500; line-height: 1.1; 
                       color: #4d3a7d;")),               
               
                
  
  # Application title
  titlePanel("mtcars"),
  
  # Sidebar with a slider input for number of bins 
  
  sidebarLayout(
    sidebarPanel(
       selectInput("variableInput",
                   "Variable:",
                   choices = c(names(mtcars[,2:11])),selected="hp"),
          selectInput("groupedInput",
                               "Grouped:",
                               choices = c(names(mtcars[,2:11])),selected="gear"),
                      selectInput("LM",
                                  "Add linear regression line:",
                                  choices = c("Yes","No"),selected="No")             
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("distPlot"),
       h1('MPG plotted for Variable grouped'),
       p('including a linear regression line')
    )
  )
))
