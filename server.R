
library(shiny)
library(datasets)
library(corrplot)
library(ggplot2)
library(ggbiplot)

shinyServer(function(input, output){
    
    datasetInput <- reactive({
        switch(input$dataset,
               "airquality" = airquality,
               "mtcars" = mtcars,
               "swiss" = swiss)
    })
    
    output$table <- renderTable({
        datasetInput()
    })
    
    output$summary <- renderPrint({
        dataset <- datasetInput()
        summary(na.omit(dataset))
    })
    
    output$corr <- renderPrint({
        dataset <- datasetInput()
        cor(na.omit(dataset))
    })
    
    output$box_plot <- renderPlot({
        dataset <- datasetInput()
        boxplot(na.omit(dataset)) 
    })

    output$corr_plot <- renderPlot({
        dataset <- datasetInput()
        mat_cor = cor(na.omit(dataset))
        corrplot(mat_cor,method = "pie",type = "lower",order = "hclust")
        title("LOWER TRIANGULAR GRAPHICAL CORRELATION MATRIX",line = -0.7)
    })
    
    output$scree_plot <- renderPlot({
        dataset <- datasetInput()
        SCREEPLOT <- prcomp(na.omit(dataset),cor = TRUE, scale = TRUE)
        screeplot(SCREEPLOT,type = "lines")
        abline(h = 1.0,col = "red",lty = 2,lwd = 2)
    })
    
    output$pca_plot <- renderPlot({
        dataset <- datasetInput()
        pca <- prcomp(na.omit(dataset),cor = TRUE, scale = TRUE)
        ggbiplot(pca,scale = 0,varname.size = 6, varname.abbrev = TRUE, 
                 var.scale = 1,circle = TRUE, labels = rownames(na.omit(dataset)))
    })
    
})
    
    