function onload()
  makeButtons()
end

function makeButtons()
  local setupButton1 = {click_function = "scoreCalc", 
                        function_owner = Global, 
                        label = "Print Scores", 
                        position = {-0.68, 0, -0.78}, 
                        rotation = {0, 90, 0}, 
                        scale = {.1, 1.00, .1}, 
                        width = 2200,
                        height = 1000,
                        color = {r=27/255,g=125/255,b=57/255},
                        font_color = {r=1, g=1, b=1},
                        font_size = 400,
                        tooltip = "Prints all players current scores to chat"}
  self.createButton(setupButton1)

  local param = {click_function = "scoreCalc", 
                        function_owner = Global, 
                        label = "Print Scores", 
                        position = {0.67, 0, -0.78}, 
                        rotation = {0, 270, 0}, 
                        scale = {.1, 1.00, .1}, 
                        width = 2200,
                        height = 1000,
                        color = {r=27/255,g=125/255,b=57/255},
                        font_color = {r=1, g=1, b=1},
                        font_size = 400,
                        tooltip = "Prints all players current scores to chat"}
  self.createButton(param)
  
end