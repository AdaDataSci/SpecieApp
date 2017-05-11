#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Predict Specie Based on Leaf Features

  shinyUI(fluidPage(
    titlePanel("Predict Specie from Leaf Features"),
    sidebarLayout(
      sidebarPanel(
        numericInput("Sepal_L", "Enter Sepal Length", 
                     value = 2.5, min = 0, max = 10, step = .1),
        sliderInput("Sepal_W", "Enter Sepal Width",
                    0, 10, 2),
        sliderInput("Petal_L", "Enter Petal Length",
                    0, 10, 2),
        sliderInput("Petal_W", "Enter Petal Width",
                    0, 5, 2)
        ),
    
    # Show the Predicted Specie
    mainPanel(h3("Specie"),
              textOutput("Pred")
    )
  )
))
