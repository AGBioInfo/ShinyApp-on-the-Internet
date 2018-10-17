# Load libraries
library(shiny)

shinyUI(
    pageWithSidebar(
        headerPanel("Regression Explorer"),
        
        # Select inputs
        sidebarPanel(
        
            # User enters name of dat.frame here.
            textInput(
                inputId = "dataName",
                label   = "Enter data.frame name"
            ),
            
            # Select menu for independent variable, available once
            # the user has selected a valid data.frame
            uiOutput(outputId = "yVarSelector"),
            # Checkbox group for independent variables, available once
            # the user has selected a valid data.frame, and includes
            # all variables in the data.frame EXCEPT the dependent variable.
            uiOutput(outputId = "xVarSelector")
        ),
        
        # Regression output goes here
        mainPanel(
            # Reminder of the model being evaluated.
            p(htmlOutput(outputId = "regHeader")),
            # Include an HTML horizontal line above tab panel.
            tabsetPanel(
                tabPanel("Model Summary",
                    verbatimTextOutput(outputId = "regSummary")),
                tabPanel("Diagnostic Plots",
                    selectInput(
                        inputId = "regPlotType",
                        label   = "Select diagnostic plot",
                        choices = list(
                            "Residuals vs Fitted"   = 1,
                            "Normal Q-Q"            = 2,
                            "Scale-Location"        = 3,
                            "Cook's Distance"       = 4,
                            "Residuals vs Leverage" = 5,
                            "Cook's Dist vs Leverage" = 6)
                    ),
                    plotOutput(outputId = "regPlot"))
            )
        )
    )
)
