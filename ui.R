library(shiny)

shinyUI(
    pageWithSidebar(
        headerPanel('Iris Classification (with Decision Trees)'),
        sidebarPanel(
            sliderInput('SL', 'Sepal Length', value=4.9, 
                        min=4.0, max=8.0, step=0.1),
            sliderInput('SW', 'Sepal Width', value=3.0, 
                        min=2.0, max=5.0, step=0.1),
            sliderInput('PL', 'Petal Length', value=1.4, 
                        min=1.0, max=7.0, step=0.1),
            sliderInput('PW', 'Petal Width', value=0.2, 
                        min=0.0, max=3.0, step=0.1),

            tags$div(class="header", checked=NA,
                     tags$img(src='iris.png',width=300,height=300)
            )            
            
        ),
        mainPanel(
            tabsetPanel(type="tab",
                        tabPanel("ReadMe",
                                 p('This is an expository shiny app, and it demonstrates classification of the three types of the flower iris using the decision tree method.'),
                                 p('The app trains the model with the famous (Fisher\'s or Anderson\'s) iris data set as soon as the webpage is loaded. The "Classification Tree" and "Fitted Model" tabs show you the fitted model. As a user, you can use the sliders on the left to input the value of the average length and width of the sepals and petals you measured from an iris flower to be classified. The "Prediction" and "Classification Result" tabs show you the class probability and the classification result. In the latter tab, in addition to the classification result, you can also compare the flower you have with the corresponding picture.'),
                                 p("This shiny app is written by Chuan Zhang for his data science course project: Developing Data Products. All the pictures are from internet.")
                                 
                                 ),
                        tabPanel("Classification Tree",plotOutput("CTree")),
                        tabPanel("Fitted Model",verbatimTextOutput("Fit")),
                        tabPanel("Prediction",verbatimTextOutput("prob")),
                        tabPanel("Classification Result",
                                 p('Output Sepal Length'),
                                 h4(textOutput('SL')),
                                 p('Output Sepal Width'),
                                 h4(textOutput('SW')),
                                 p('Output Petal Length'),
                                 h4(textOutput('PL')),
                                 p('Output Petal Width'),
                                 h4(textOutput('PW')),
                                 
                                 p('This flower is a'),
                                 h3(textOutput('pred')),
                                 img(src='iris-3.png',align="center")
                        ),
                        tabPanel("Training Dataset",tableOutput("data"))
                )            
        )
    )
)
