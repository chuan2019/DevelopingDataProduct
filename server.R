library(caret)
library(shiny)
library(rattle)
library(RColorBrewer)
library(lattice)
library(ggplot2)
library(rpart)
library(rpart.plot)

flower <- iris
modFit <- rpart(Species ~ ., data=flower)

shinyServer(
    function(input,output)
    {
        output$pred <- renderText({
            test <- data.frame('Sepal.Length' = 
                                   as.numeric(renderText({input$SL})()),
                               'Sepal.Width' = 
                                    as.numeric(renderText({input$SW})()),
                               'Petal.Length' = 
                                    as.numeric(renderText({input$PL})()),
                               'Petal.Width' = 
                                    as.numeric(renderText({input$PW})())
            )
            ftype <- predict(modFit,newdata=test)
            colnames(ftype)[ftype==max(ftype)]
        })
        
        output$prob <- renderPrint({
            test <- data.frame('Sepal.Length' = 
                                   as.numeric(renderText({input$SL})()),
                               'Sepal.Width' = 
                                   as.numeric(renderText({input$SW})()),
                               'Petal.Length' = 
                                   as.numeric(renderText({input$PL})()),
                               'Petal.Width' = 
                                   as.numeric(renderText({input$PW})())
            )
            predict(modFit,newdata=test)
        })

        output$data <- renderTable({flower})

        output$SL <- renderText({input$SL})
        output$SW <- renderText({input$SW})
        output$PL <- renderText({input$PL})
        output$PW <- renderText({input$PW})
        
        output$Fit <- renderPrint({modFit})

        output$CTree <- renderPlot({
            fancyRpartPlot(modFit)
        })
    }
)

