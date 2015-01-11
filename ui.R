library(shiny)
library(ShinyRatingInput)

shinyUI(fluidPage(
  
  tags$head(
    # add some custom CSS
    tags$style(HTML('
      /* @import url("//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css");*/

      .orange {
        color: #ff6600;
      }

      .red {
        color: red;
      }
    '))
  ),
  
  h3("Using a Rating Input Controls in Shiny with the Bootstrap Rating Plugin and ShinyRatingInput"),
  
  tabsetPanel(
  tabPanel("",
  div(
    h3("Default rating"),
    ratingInput("rating1", label="Select Rating"),   htmlOutput("rating1"),
    
    h3("Half rating"),
    ratingInput("rating2", label="Select Rating", dataFractions=2), htmlOutput("rating2"),
    
    h3("Disabled rating"),
    ratingInput("rating3", label="Select Rating", disabled=TRUE), 
    
    h3("Readonly rating with a value"),
    ratingInput("rating4", label="", readonly=TRUE, value=3), 
    
    h3("Readonly rating with a fractional value"),
    ratingInput("rating5", label="", readonly=TRUE, value=2.5), htmlOutput("rating5"),
    
    h3("Customized heart rating"),
    ratingInput("rating6", label="Select Rating", dataFilled="glyphicon glyphicon-heart red", dataEmpty="glyphicon glyphicon-heart-empty red"), htmlOutput("rating6"),
    
    h3("Customize tooltips"),
    ratingInput("rating7", label="Select Rating", class="rating-tooltip"), htmlOutput("rating7"),
    
    h3("Set stop rate to 10 [1..10]"),
    ratingInput("rating8", label="Select Rating", dataStop=10),  htmlOutput("rating8"),
    
    h3("Set start rate to 5 [6..10]"),
    ratingInput("rating9", label="Select Rating", dataStart=5, dataStop=10),
    
    h3("Set start and stop rate [2..10]"),
    ratingInput("rating10", label="Select Rating", dataStart=1, dataStop=10),
    
    h3("Set start and stop rate [2..10] with step 2"),
    ratingInput("rating11", label="Select Rating", dataStop=10, dataStep=2),
    
    h3("Set start and stop rate [-2..-10] with step -2"),
    ratingInput("rating12", label="Select Rating", dataStop=-10, dataStep=-2),
    
    h3("Font Awesome icons"),
    ratingInput("rating13", label="Select Rating", dataFilled="fa fa-bell fa-3x", dataEmpty="fa fa-bell-o fa-3x", dataFractions="3"),
    
    h3("Fractional rating"),
    ratingInput("rating14", label="Select Rating", dataFilled="fa fa-star fa-3x orange", dataEmpty="fa fa-star-o fa-3x orange", dataFractions="3") ,
    
    h3("Custom CSS icons"),
    ratingInput("rating14", label="Select Rating", dataFilled="symbol symbol-filled", dataEmpty="symbol symbol-empty")
  )
  ),
  
  tabPanel("About",
    p("This example shows how to use the ",
    a(href="https://github.com/stefanwilhelm/ShinyRatingInput", "ShinyRatingInput package"),
    " to build rating input controls in Shiny apps.",
    "ShinyRatingInput uses the ",
    a(href="https://github.com/dreyescat/bootstrap-rating", "https://github.com/dreyescat/bootstrap-rating"),
    "JavaScript library, so the credits should go there."
    )
  )
  
  ),
  
  HTML("
    <script>
      $(function () {
        $('input.check').on('change', function () {
          alert('Rating: ' + $(this).val());
        });
        $('.rating-tooltip').rating({
          extendSymbol: function (rate) {
            $(this).tooltip({
              container: 'body',
              placement: 'bottom',
              title: 'Rate ' + rate
            });
          }
        });
        $('.rating').each(function () {
          $('<span class=\"label label-default\"></span>')
            .text($(this).val() || ' ')
            .insertAfter(this);
        });
        $('.rating').on('change', function () {
          $(this).next('.label').text($(this).val());
        });
      });
    </script>  
   ")
))