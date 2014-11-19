
library(shiny)

shinyUI(fluidPage(
    
    titlePanel("BP, GC and PCA"),
    p(em("Developing Data Products Course Project")),
    p("by Eugenio Del Prete, ",Sys.Date()),
    
    sidebarLayout(
        
        sidebarPanel(
            
            p(strong(em("Basic exploratory data analysis with boxplot (BP), graphical correlation (GC) 
                        and Principal Component Analysis (PCA)")),align = "justify"),
            br(),
            h4("Choose your dataset"),
            selectInput("dataset",label = "",
                choices = c("airquality","mtcars","swiss"),selected = "airquality"),
            p("Datasets are available in RStudio integrated library",strong("datasets"),
              "and for further information about them, you can write on your R console:",
              align = "justify"),
            code("help(name_dataset)"),
            br(),br(),
            p("where",strong("name_dataset"),"has the same name of your choice. Moreover,
              you can write on your R console:",
              align = "justify"),
            code("citation(name_library)"),
            br(),br(),
            p("to obtain libraries reference. Finally, it is recommended to read the",strong("GUIDE"),"in the last panel.",
              align = "justify")
        ),
        
        mainPanel(
            
            tabsetPanel(type = "tabs",
                        
                        tabPanel("DATA", 
                                 tableOutput("table")
                        ),
                        
                        tabPanel("BOXPLOT",
                                 verbatimTextOutput("summary"),
                                 plotOutput("box_plot")
                                 ),
                        
                        tabPanel("CORRELATION",
                                 verbatimTextOutput("corr"),
                                 plotOutput("corr_plot")
                                 ), 
                        
                        tabPanel("PCA",
                                 plotOutput("scree_plot"),
                                 plotOutput("pca_plot")
                                 ),
                        
                        tabPanel("GUIDE",
                                 h4("Summary"),
                                 p("1.Introduction; 2.Statistical Methods; 3.Reactive Results: Data Panel, Boxplot Panel, Correlation Panel, Pca Panel; 4.References: Theory, R Libraries."),
                                 br(),
                                 h4("1. Introduction"),
                                 p(span("Exploratory data analysis (EDA)",style = "color:blue"), "is a graphical/statistical approach, almost a philosophy of research,
                                   applied to data in order to answer some questions about them. At first, data are collected in a readable form, as a spreadsheet
                                   or a database, usually with one observation for row and one feature/variable for column. A pure number or category is not so 
                                   informative in itself: EDA makes some data aspects more clear. Making a short summary, EDA can be univariate or multivariate and 
                                   can use graphical or not graphical methods. A simple workflow for this kind of analysis could be: problem -> data collection ->
                                   exploratory analysis -> model definition (hypothesis) -> conclusions.",align = "justify"),
                                 br(),
                                 h4("2. Statistical Methods"),
                                 p(span("Boxplot",style = "color:blue"), "is a graphical representation used for describing samples distribution with measures of central 
                                   tendency and quartiles. It is just a data description: there is no assumptions about underlying statistical distribution. Usually the plotted 
                                   information are lower (first) quartile, second (median) quartile, upper (third) quartile ->", em("box"), ",minimum and maximum values ->",
                                   em("whiskers"), ",outliers ->", em("points."),align = "justify"),
                                 p(span("Correlation",style = "color:blue"), "is a well-known measure of dependance between two or more variables (features). In particular, 
                                   the most common measure of this kind is Pearson's correlation coefficient, obtained by dividing the covariance of the two variables by 
                                   the product of their standard deviations. It is very important to know that it is not sufficient to demostrate the presence of a causal
                                   realtionship between the variables:", em("correlation does not imply causation."),align = "justify"),
                                 p(span("Principal Component Analysis",style = "color:blue"), "is a statistical method that transforms old variables in new variables linear
                                   combination of the old ones: it is possible to keep a subset of them and to have, however, a good approximate data representation. Morever,
                                   it can be used as a sort of data clustering and in seeking of possible outliers. A computational method, to perform it, is", em("Single Value
                                   Decomposition (SVD)"), ",that resolves a standard matrix eigenvalues problem.",align = "justify"),
                                 br(),
                                 h4("3. Reactive Results"),
                                 p("The choice of dataset is really simple. In the select box there are three datasets: when one of these have been chosen, automatically results 
                                   are obtained in a",em("reactive"),"mode. Same details have been explained below.",align = "justify"),
                                 h5("a) Data Panel"),
                                 p("An overview of data is shown in a tabular format. There are: number and kind of observations, number and kind of features, blank squares if 
                                   data are not available. All the NA (Not Available) data have been ignored in following computations.",align = "justify"),
                                 h5("b) Boxplot Panel"),
                                 p("In ther first box there is a summary of dataset features main statistics in a",em("text output"),"format. Below there is a boxplot representation 
                                   of the previous statistics. It is possible to notice how data are scattered and possible presence of outliers. Attention: some data have not a
                                   clear box because of their intrinsic nature (for example, if they are boolean).",align = "justify"),
                                 h5("c) Correlation Panel"),
                                 p("In the first box there is a complete matrix correlation in a",em("text output"),"format. Below there is a lower triangular graphical correlation
                                   matrix where the color specifies the kind (blu = correlation, red = anticorrelation) and the piechart specifies the strength. All the correlations
                                   have been grouped in a sort of clustering about colors.",align = "justify"),
                                 h5("d) Pca Panel"),
                                 p("First figure shows a screeplot: it is an help in number of principal components choice, that is quantity of explained variance by every principal
                                   component. Usually, the threshold is 1.0. Below there is a so called",em("biplot"),",where observations and features are shown in the same plot. It is
                                   possible to see the composition of the principal component and the distribution of data about them.",align = "justify"),
                                 br(),
                                 h4("4. References"),
                                 h5("I) Theory"),
                                 p("For further information about theory, you can click on these links:",
                                   a("Exploratory Data Analysis",href = "http://en.wikipedia.org/wiki/Exploratory_data_analysis"),",",
                                   a("Boxplot",href = "http://en.wikipedia.org/wiki/Box_plot"),",",
                                   a("Correlation",href = "http://en.wikipedia.org/wiki/Correlation_and_dependence"),",",
                                   a("Pca",href = "http://en.wikipedia.org/wiki/Principal_component_analysis")
                                 ),
                                 h5("II) R Libraries"),
                                 p(strong(em("Shiny:"))," RStudio and Inc. (2014). shiny: Web Application Framework for R. R package version 0.10.2.1.
                                                          http://CRAN.R-project.org/package=shiny"),
                                 p(strong(em("datasets:")),"R Core Team (2014). R: A language and environment for statistical computing. R Foundation for Statistical
                                                            Computing, Vienna, Austria. URL http://www.R-project.org/."),
                                 p(strong(em("corrplot:"))," Taiyun Wei (2013). corrplot: Visualization of a correlation matrix. R package version 0.73.
                                                             http://CRAN.R-project.org/package=corrplot"),
                                 p(strong(em("ggplot2:")),"H. Wickham. ggplot2: elegant graphics for data analysis. Springer New York, 2009."),
                                 p(strong(em("ggbiplot:")),"Vincent Q. Vu (2011). ggbiplot: A ggplot2 based biplot. R package version 0.55. http://github.com/vqv/ggbiplot"),
                                 br(),br(),br()
                                 
                        )
            )
                                
        )
    )
 
))