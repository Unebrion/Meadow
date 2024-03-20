function onload()
  makeButton()

end

function makeButton()
  parameters = {
    click_function  = 'promoHelper',
    function_owner  = self,
    label           = 'ADD PACK', 
    position        = {0,1,0.5}, 
    width           = 800, 
    height          = 300,
    font_size       = 125,
    scale           = {.5, .5, .5},
    color           = {59/255, 185/255, 191/255},

  }
  self.createButton(parameters)
end

function promoHelper()
  if #self.getObjects() ~= 0 then
   Global.call("addPromos", self.guid)
  else  
    print('Cards have already been added.')
  end

end
