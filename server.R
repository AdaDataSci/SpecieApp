#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#


library(shiny)
library(caret)
library(rpart)
data(iris)

shinyServer(function(input, output) {  

  set.seed(123)
  inTrain <- createDataPartition(y=iris$Species,p=0.7, list=FALSE)
  training <- iris[inTrain,]
  rpart <-train(factor(Species) ~ .,method="rpart",data=training)
   Pred<-reactive({
     Sepal.Length <- input$Sepal_L
     Sepal.Width <- input$Sepal_W
     Petal.Length <- input$Petal_L
     Petal.Width <- input$Petal_W
     predict(rpart,newdata = data.frame(Sepal.Length, 
                                    Sepal.Width,Petal.Length,Petal.Width))
   })
     output$Pred <- renderPrint({Pred() })
})