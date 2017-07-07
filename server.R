#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.thank you
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$distPlot <- renderPlot({
    mtcars$gear <- factor(mtcars$gear,levels=c(3,4,5),
                          labels=c("3gears","4gears","5gears")) 
    mtcars$am <- factor(mtcars$am,levels=c(0,1),
                        labels=c("Automatic","Manual")) 
    mtcars$cyl <- factor(mtcars$cyl,levels=c(4,6,8),
                         labels=c("4cyl","6cyl","8cyl"))  
    # generate bins based on input$bins from ui.R
    Variable <- mtcars[,as.character(input$variableInput)]
    Mpg <- mtcars[,'mpg'] 
    Grouped_by<- mtcars[,as.character(input$groupedInput)]
    
    # draw the histogram with the specified number of bins
    #ifelse (input$LM =="Yes" ,qplot(y,x,color=z)+
              #geom_smooth(method="lm"),qplot(y,x,color=z))  
    if (input$LM=="Yes"){
    qplot(Variable,Mpg,color=Grouped_by,colours="Blues")+geom_smooth(method="lm")}
    else {qplot(Variable,Mpg,color=Grouped_by,colours="Blues")}
    #plot(y,x)
    
  })
  
})
