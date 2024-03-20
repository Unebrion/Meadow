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
    for _, thing in pairs(self.getObjects()) do
      if thing.guid == 'c462c2' then
        self.takeObject({position ={30.60, 11.77, 44.12},
                        guid= 'c462c2',
                        rotation = {65.00, 180.00, 0.00}
                      }).setLock(true)
      else
        Global.call("addPromos", self.guid)
      end
    end
  else
    print('Cards have already been added.')
  end
end
