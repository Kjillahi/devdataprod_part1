library(shiny)

shinyUI(
  navbarPage("Car Make Dataset",
             tabPanel("Prediction",
                      fluidPage(
                        titlePanel("Relationship of Varriables with Miles Per Gallon (MPG)"),
                        sidebarLayout(
                          sidebarPanel(
                            selectInput("variable", "Variable:",
                                        c("Number of cylinders" = "cyl",
                                          "Displacement (cu.in.)" = "disp",
                                          "Gross horsepower" = "hp",
                                          "Rear axle ratio" = "drat",
                                          "Weight (lb/1000)" = "wt",
                                          "1/4 mile time" = "qsec",
                                          "V/S" = "vs",
                                          "Transmission" = "am",
                                          "Number of forward gears" = "gear",
                                          "Number of carburetors" = "carb"
                                        )),
                            
                            checkboxInput("outliers", "Show BoxPlot's outliers", FALSE)
                          ),
                          
                          mainPanel(
                            h3(textOutput("caption")),
                            
                            tabsetPanel(type = "tabs", 
                                        tabPanel("Regression model", 
                                                 plotOutput("mpgPlot"),
                                                 verbatimTextOutput("fit")
                                        ),
                                        tabPanel("BoxPlot", plotOutput("mpgBoxPlot"))
                            )
                          )
                        )
                      )
             ),
             tabPanel("Doumentation",
                      h3("Documentation "),
                      h4("Goals"),
                      p("Looking at a data set of a collection of cars, We are interested in exploring the relationship between other variables and miles per gallon (MPG)"),
                      p("We are particularly interested in the following two questions:"),
                      p("Does MPG incerase or decrease with increase in other varriables"),
                      p("What is the unit of change in MPG associated with a unit of change in other varriables"),
                      h4("Usage"),
                      p("Select any other varriable on the side bar to see its relationship with MPG"),
                      p("the Regression Model Tab show the actual relationship with the model info beneath"),
                      p("The box plot shows a plot of distribution of the varriable in relationship to MPG"),
                      p("The Show Outliers Check box shows other data point which are outliers in the box plot ")
             ),
             tabPanel("Dataset",
                      h2("Motor Trend Car Road Tests"),
                      hr(),
                      h3("Description"),
                      helpText("The data was extracted from the 1974 Motor Trend US magazine,",
                               " and comprises fuel consumption and 10 aspects of automobile design and performance",
                               " for 32 automobiles (1973–74 models)."),
                      h3("Format"),
                      p("A data frame with 32 observations on 11 variables."),
                        
                      p("  [, 1]   mpg	 Miles/(US) gallon"),
                      p("  [, 2]	 cyl	 Number of cylinders"),
                      p("  [, 3]	 disp	 Displacement (cu.in.)"),
                      p("  [, 4]	 hp	 Gross horsepower"),
                      p("  [, 5]	 drat	 Rear axle ratio"),
                      p("  [, 6]	 wt	 Weight (lb/1000)"),
                      p("  [, 7]	 qsec	 1/4 mile time"),
                      p("  [, 8]	 vs	 V/S"),
                      p("  [, 9]	 am	 Transmission (0 = automatic, 1 = manual)"),
                      p("  [,10]	 gear	 Number of forward gears"),
                      p("  [,11]	 carb	 Number of carburetors"),
                      
                      h3("Source"),
                      p("Henderson and Velleman (1981), Building multiple regression models interactively. Biometrics, 37, 391–411.")
             )
  )
)