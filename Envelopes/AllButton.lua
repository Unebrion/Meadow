local flag = true
function onload()
  makeButton()
end

function makeButton()
  parameters = {
    click_function  = 'allPacks',
    function_owner  = self,
    label           = 'ADD ALL', 
    position        = {0,1,0.5}, 
    width           = 900, 
    height          = 400,
    font_size       = 150,
    color           = {59/255, 185/255, 191/255},

  }
  self.createButton(parameters)
end

function allPacks()
  if flag then
    local envelopes = {'900e95', '665fe1', '2c3984', '2a954f', '8e2be1', 'c6a3fa'}
    for _, envelope in pairs(envelopes) do
      local obj = getObjectFromGUID(envelope)
      obj.call("promoHelper", envelope)
    end
    Global.call("deerFlip")
    flag = false
  end
end
