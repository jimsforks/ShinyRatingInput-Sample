library(shiny)
shinyServer(function(input, output, session) {

  output$rating1 <- renderText({ paste("Rating output from Server", input$rating1) })
  output$rating2 <- renderText({ paste("Rating output from Server", input$rating2) })
  output$rating5 <- renderText({ paste("Rating output from Server", input$rating5) })
  output$rating6 <- renderText({ paste("Rating output from Server", input$rating6) })
  output$rating7 <- renderText({ paste("Rating output from Server", input$rating7) })
  output$rating8 <- renderText({ paste("Rating output from Server", input$rating8) })
  
  output$movieRating <- renderUI({
    ratingInput(inputId = "myratingid",
                label="Rate this movie",
                dataStop=10,
                dataFractions=2)
  })
})