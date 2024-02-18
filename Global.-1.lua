turnCounter = 0
roundCounter = 3

local tableTop = '4ee1f2'
local gameBoard = 'c01d03'

local goalBagGUID = 'a7e97b'

local spareDeckCube = 'd12877' -- Sunk into the table 
local southDeckCubeMidgame = '474d06' -- Sunk into table
local campSnapCube = 'd237ef' -- Sunk into table
local halftimeShowCube = '54ec5b'
local startButtonCubeBlue = '18c30d'

local cardTags = {"West", "North", "South", "East"} 
local deckTags = {'westDeck', 'middleDeck', 'eastDeck'}

local firstPlayerMarker = '03f05d'
local roundTracker = 'f2b0a8'

local turnIndex = {'T1', 'T2', 'T3', 'halftime', 'T4', 'T5', 'T6'} -- 2-3 players
local fourPlayerTurnIndex = {{'T1', 'T2', 'T3', 'T4', 'halftime', 'T5', 'T6', 'T7', 'T8'}}

local setupItems = {
    ["Red"] = {'7c9f52', '6c271c', 'c1452d', '34ec84', '1cef75', 'd7e46d', '6e0905', 'a96f81', '8074e0', '68f5e1', '79a08a', '8e0f7b'},
    ["Yellow"] = {'07641c', '76f9e7', '98bdd0', 'a8933f', 'aacdb2', '314b74', '7e9e53', '685bc2', '0e8eaa', '6823c6', '381f5f', 'afbbaa'},
    ["Green"] = {'884f7c', 'adeb59', '41be25', '97f97a', '83466a', '490927', '73fd56', 'd744e8', 'fda133', '2d5ad6', '86ba44', '2515db'},
    ["Purple"] = {'870713', 'e0f5fc', 'f1468e', '873cf2', '6f50d9', 'c63d7c', '717760', '3ee73a', 'd8e49c', 'aef26e', '59d57e', '09fd42'},
}

local campBoardBag = 'd81846'
local twoPlayerCampBoard = '84346f'
local threePlayerCampBoard = '1ff4ec'
local fourPlayerCampBoard = '32da80'

local redScoringZone = '8e0f7b'
local yellowScoringZone = 'afbbaa'
local greenScoringZone = '2515db'
local purpleScoringZone = '09fd42'

local purplePathTokens = {
    {guid = '717760', snapPoint = {x = 27.78013, y = 1.588443, z = 26.30198}, rotation = {x = 0.0, y = 90, z = 0.0}},
    {guid = '3ee73a', snapPoint = {x = 27.78015, y = 1.588443, z = 27.86568}, rotation = {x = 0.0, y = 90, z = 0.0}},
    {guid = 'd8e49c', snapPoint = {x = 27.78015, y = 1.588443, z = 29.4294}, rotation = {x = 0.0, y = 90, z = 0.0}},
    {guid = 'aef26e', snapPoint = {x = 27.78014, y = 1.588443, z = 30.99315}, rotation = {x = 0.0, y = 90, z = 0.0}},
  }

local redPathTokens = {
    {guid = 'd7e46d', snapPoint = {x = -27.78016, y = 1.588443, z = 32.54876}, rotation = {x = 0.0, y = 270, z = 0.0}},
    {guid = '6e0905', snapPoint = {x = -27.78016, y = 1.588443, z = 30.98509}, rotation = {x = 0.0, y = 270, z = 0.0}},
    {guid = '8074e0', snapPoint = {x = -27.78016, y = 1.588443, z = 29.42134}, rotation = {x = 0.0, y = 270, z = 0.0}},
    {guid = '68f5e1', snapPoint = {x = -27.78015, y = 1.588443, z = 27.85762}, rotation = {x = 0.0, y = 270, z = 0.0}},
  }

local greenPathTokens = {
    {guid = 'adeb59', snapPoint = {x = 27.78011, y = 1.588443, z = -10.53009}, rotation = {x = 0.0, y = 90, z = 0.0}}, 
    {guid = '41be25', snapPoint = {x = 27.78012, y = 1.588443, z = -8.953729}, rotation = {x = 0.0, y = 90, z = 0.0}},
    {guid = '97f97a', snapPoint = {x = 27.78013, y = 1.588443, z = -7.399994}, rotation = {x = 0.0, y = 90, z = 0.0}},
    {guid = '83466a', snapPoint = {x = 27.78015, y = 1.588443, z = -5.840037}, rotation = {x = 0.0, y = 90, z = 0.0}},
  }

local yellowPathTokens = {
    {guid = '685bc2', snapPoint = {x = -27.77788, y = 1.588443, z = -4.273053}, rotation = {x = 0.0, y = 270, z = 0.0}},
    {guid = '7e9e53', snapPoint = {x = -27.77789, y = 1.588443, z = -5.84006}, rotation = {x = 0.0, y = 270, z = 0.0}},
    {guid = '0e8eaa', snapPoint = {x = -27.77786, y = 1.588443, z = -7.400054}, rotation = {x = 0.0, y = 270, z = 0.0}},
    {guid = '6823c6', snapPoint = {x = -27.77785, y = 1.588443, z = -8.960062}, rotation = {x = 0.0, y = 270, z = 0.0}}
  }

local questionTokens = {
    ["Red"] = {guid = 'a96f81', snapPoint = {x = -27.78015, y = 1.588442, z = 26.29393}, rotation = {x = 0.0, y = 270, z = 0.0}},
    ["Yellow"] = {guid = '314b74', snapPoint = {x = -27.78011, y = 1.588443, z = -10.53007}, rotation = {x = 0.0, y = 270, z = 0.0}},
    ["Green"] = {guid = '884f7c', snapPoint = {x = 27.78014, y = 1.588443, z = -4.270022}, rotation = {x = 0.0, y = 90, z = 0.0}},
    ["Purple"] = {guid = 'c63d7c', snapPoint = {x = 27.78015, y = 1.588443, z = 32.55689}, rotation = {x = 0.0, y = 90, z = 0.0}},
  }

function onPlayerChangeColor()
    local buttonHolderCube = getObjectFromGUID(startButtonCubeBlue)
    buttonHolderCube.editButton({label = "Set Up A " .. #Player.getPlayers() .. " Player Game"})
end

function onLoad()
    setupGameButton()
    local purpleBoard = getObjectFromGUID('59d57e')
    local redBoard = getObjectFromGUID('79a08a')
    local greenBoard = getObjectFromGUID('86ba44')
    local yellowBoard = getObjectFromGUID('381f5f')
    -- purpleBoard.interactable = false -- purple cube
    -- redBoard.interactable = false -- red cube
    -- greenBoard.interactable = false -- green cube
    -- yellowBoard.interactable = false -- yellow cube
end

function onPlayerTurn(player, previous_player)
    local buttonHolderCube = getObjectFromGUID(halftimeShowCube)
    if roundCounter ~= 4 then
        Wait.frames(function () restock() end, 75) -- refills any cards missing from the middle. 
        print("we are in round " .. roundCounter)
    end
    turnCounter = turnCounter + 1 

    if buttonHolderCube and roundCounter == 4 then
        turnCounter = 0
    end

    if turnCounter > 10 then 
        Wait.frames(function() nextRound() end, 1) -- needed the wait here for the turn tracking to function properly
    end
end

function setupGameButton()
    local buttonHolderCube = getObjectFromGUID(startButtonCubeBlue)
    local setupButton = {click_function = "gameSetup", 
                        function_owner = self, 
                        label = "Set Up A " .. #Player.getPlayers() .. " Player Game", 
                        position = {0, 1, 0}, 
                        rotation = {0, 180, 0}, 
                        scale = {0.5, 0.5, 0.5}, 
                        width = 5000, 
                        height = 3000, 
                        font_size = 400, 
                        tooltip = "Set Up Game"}
    buttonHolderCube.createButton(setupButton)
end

function setupCampBoard()
    local campBoardBagObj = getObjectFromGUID(campBoardBag)
    local campBoardCubeObj = getObjectFromGUID(campSnapCube)
    local campBoardPos = campBoardCubeObj.getPosition()

    if #getSeatedPlayers() == 1 then
        --solo mode needs done still
    elseif #getSeatedPlayers() == 2 then
        campBoardBagObj.takeObject({
            position = campBoardPos + Vector(0, 2, 0),
            guid = twoPlayerCampBoard,
        })
    elseif #getSeatedPlayers() == 3 then
        campBoardBagObj.takeObject({
            position = campBoardPos + Vector(0, 2, 0),
            guid = threePlayerCampBoard,
        })
    else -- 4 players  
        campBoardBagObj.takeObject({
            position = campBoardPos + Vector(0, 2, 0),
            guid = fourPlayerCampBoard,
        })
    end
end

function roundTrackerSetup()
    local trackerPawn = getObjectFromGUID(roundTracker)
    local campBoardCubeObj = getObjectFromGUID(campSnapCube)
    local campBoardPos = campBoardCubeObj.getPosition() + Vector(0, 2, 0)
    local campBoardObj = castAndCheckForTag(campBoardPos, 'campBoard')
    local snappies = campBoardObj.getSnapPoints()

    print(campBoardObj.guid)
    if campBoardObj then
        for _, snap in pairs(snappies) do -- iterate though all snaps on object
            local oPosition = campBoardObj.positionToWorld(snap.position)
            for _, snapTag in pairs(snap.tags) do  -- iterate though tags on each snap point 
                if snapTag == 'T1' then
                    trackerPawn.setPosition(oPosition + Vector(0, 2, 0))
                    break
                end
            end
        end
    end
end

function gameSetup()
    local gameBoardObject = getObjectFromGUID(gameBoard)
    local spareDeckCubeObject = getObjectFromGUID(spareDeckCube) -- north deck

    local northDeck = getDeck(spareDeckCubeObject, 'North')
    local westDeck = getDeck(gameBoardObject, 'westDeck')
    local southDeck = getDeck(gameBoardObject, 'middleDeck')
    local eastDeck = getDeck(gameBoardObject, 'eastDeck')

    northDeck.shuffle()
    southDeck.shuffle()
    westDeck.shuffle()
    eastDeck.shuffle()

    if #getSeatedPlayers() == 1 then
        Wait.time(function () restock() end, 0.7)
        print('Solo Mode Baybeee')

    elseif #getSeatedPlayers() < 4 then
        Wait.time(function () restock() end, 0.7)

        randomizeTurnOrderAndEnableTurns()
    else
        Wait.time(function () restock() end, 0.7)
        fourPlayerChanges()
        randomizeTurnOrderAndEnableTurns()
    end
    removeSetupItems() -- Destorys unused assets
    local buttonHolderCube = getObjectFromGUID(startButtonCubeBlue)
    buttonHolderCube.destruct()

    setupCampBoard()
    Wait.frames(function() goalTokens() end, 100)
    Wait.frames(function() roundTrackerSetup() end, 100)

   -- removeButton()
end

function halftimeShowButton()
    local buttonHolderCube = getObjectFromGUID(halftimeShowCube)
    local halftimeShow = {click_function = "halftimeShow", 
                        function_owner = self, 
                        label = "Halfway Point", 
                        position = {0, 1, 0}, 
                        rotation = {0, 180, 0}, 
                        scale = {0.5, 0.5, 0.5}, 
                        width = 7500, 
                        height = 3000,
                        color = {r=255/255,g=0/255,b=0/255},
                        font_size = 5000, 
                        tooltip = "Click this to swap S and N decks and refresh middle"}
    buttonHolderCube.createButton(halftimeShow)

    halftimeTruth = Turns.order


end

function halftimeShow()
    local gameBoardObject = getObjectFromGUID(gameBoard)
    local spareDeckCubeObject = getObjectFromGUID(spareDeckCube)
    local southDeckCube = getObjectFromGUID(southDeckCubeMidgame)
    local northDeck = getDeck(spareDeckCubeObject, 'North')
    local southDeck = getDeck(gameBoardObject, 'middleDeck')
    local eastDeck = getDeck(gameBoardObject, 'eastDeck')
    local westDeck = getDeck(gameBoardObject, 'westDeck')
    local gameBoardSnaps = gameBoardObject.getSnapPoints()
    local southDeckPosition = southDeck.getPosition()    
    local southDeckCubePos = southDeckCube.getPosition()

    local buttonHolderCube = getObjectFromGUID(halftimeShowCube)
    buttonHolderCube.destruct()


    for _, point in pairs(gameBoardSnaps) do 
        local oPosition = gameBoardObject.positionToWorld(point.position)
        local hitObject = castAndCheckForTag(oPosition, 'South')
        if hitObject then
            hitObject.setPosition(southDeckCubePos) -- Move the object off the board
            if not hitObject.is_face_down then
                hitObject.flip() 
            end
        end
    end

    for _, point in pairs(gameBoardSnaps) do 
        local oPosition = gameBoardObject.positionToWorld(point.position)
        local hitObject = castAndCheckForTag(oPosition, 'East') or castAndCheckForTag(oPosition, 'West')

        if hitObject then
            if hitObject.hasTag('East') and hitObject.type == 'Card' then
                hitObject.flip()
                hitObject.putObject(eastDeck)

            elseif hitObject.hasTag('West') and hitObject.type == 'Card' then
                hitObject.flip()
                hitObject.putObject(westDeck)
            end
        end
    end
    --Wait.frames(function() print("delay") end, 200)
    -- Place North deck in the position of the South deck
    if northDeck then
        northDeck.setPosition(southDeckPosition) -- Place North deck where South deck was
    end

    -- Places north cards on the empty spaces
    --Wait.frames(function () restock() end, 100)
    returnPathTiles()
    roundCounter = roundCounter + 1
    moveTracker()
    Turns.turn_color = Turns.order[1]
    turnCounter = 1
    
end

function returnPathTiles()
    local currentPlayers = Player.getPlayers()
    
    for _, player in ipairs(currentPlayers) do
        local pathTokens
        local color = player.color
        -- Determine which path tokens table to use based on player's color
        if color == 'Green' then
            pathTokens = greenPathTokens
        elseif color == 'Purple' then
            pathTokens = purplePathTokens
        elseif color == 'Yellow' then
            pathTokens = yellowPathTokens
        elseif color == 'Red' then
            pathTokens = redPathTokens
        else
            -- Handle other colors or errors
            print("Unknown color:", color)
            return
        end

        for _, tokenData in ipairs(pathTokens) do
            local token = getObjectFromGUID(tokenData.guid)
            if token ~= nil then
                token.setPositionSmooth(tokenData.snapPoint, false, true) -- no snap points used. I was lazy and didn't update the name
                token.setRotationSmooth(tokenData.rotation, false, true)
            else
                print("Token not found with GUID:", tokenData.guid)
            end
        end
    end
    -- this bit only fires if the question mark tiles are being used
    if #currentPlayers < 4 then
        local wildTokens = questionTokens
        for color, tokenData in pairs(wildTokens) do 
            local token = getObjectFromGUID(tokenData.guid)
            if token ~= nil then
                token.setPositionSmooth(tokenData.snapPoint, false, true)
                token.setRotationSmooth(tokenData.rotation, false, true)
            end
        end
    end

end

function nextRound()
    -- Reset turn counter at the start of each round
    turnCounter = 0

    roundCounter = roundCounter + 1
    moveTracker()


    -- Move object from first player to next player in turn order
    local objectGuid = "03f05d"
    local firstPlayer = Turns.order[1]
    local nextPlayerIndex = 2  -- Index of the next player in turn order

    -- If there is only one player, just return
    if #Turns.order < 2 then
        return
    end

    -- Move the object from the first player to the next player
    local firstPlayerHand = Player[firstPlayer].getHandObjects()
    for _, obj in ipairs(firstPlayerHand) do
        if obj.getGUID() == objectGuid then
            obj.deal(1, Turns.order[nextPlayerIndex])
            break
        end
    end

    -- Adjust the turn order for the new round
    local newTurnOrder = {}
    -- if roundCounter == 5 then
    --     for i = 2, #Turns.order do
    --         table.insert(newTurnOrder, halftimeTruth[i])
    --     end
    --     table.insert(newTurnOrder, halftimeTruth[1])
    -- else 
        for i = 2, #Turns.order do
            table.insert(newTurnOrder, Turns.order[i])
        end
        table.insert(newTurnOrder, firstPlayer)
    -- end
    -- Set the new turn order
    Turns.order = newTurnOrder

    -- Enable turn for the new first player
    Turns.enable = true
    Turns.turn_color = Turns.order[1]

    if roundCounter ~= 4 then
        returnPathTiles()    
    end


    print("Round Complete")
end

function moveTracker()
    local trackerPawn = getObjectFromGUID(roundTracker)
    local campBoard = nil 
    local campBoardSnaps = nil
    local campBoardCube = getObjectFromGUID(campSnapCube) -- cube under table with snap point

    local hitlist = Physics.cast({
        origin = (Vector(campBoardCube.getPosition()) + Vector(0, -2, 0)),
        direction = {0, 1, 0}, 
        max_distance = 4,
        type = 1, -- Ray
        debug = true,
    })

    -- Find the camp board and its snap points
    for _, thing in pairs(hitlist) do 
        if thing.hit_object.hasTag('campBoard') then
            campBoard = thing.hit_object
            campBoardSnaps = campBoard.getSnapPoints()
            break
        end
    end

    -- If campBoard and its snap points are found, proceed to move the trackerPawn
    if campBoard and campBoardSnaps then 

        -- 2 - 3 players 
        if #getSeatedPlayers() < 4 then
            local targetTag = turnIndex[roundCounter]
            for _, snap in pairs(campBoardSnaps) do 
                for _, tag in pairs(snap.tags) do 
                    if tag == targetTag then
                        local newPosition = campBoard.positionToWorld(snap.position) + Vector(0, 2, 0)
                        trackerPawn.setPositionSmooth(newPosition)
                        if tag == 'halftime' then
                            halftimeShowButton()
                        end
                        return  -- Exit the function after moving the trackerPawn
                    end
                end
            end
            -- 4 players fourPlayerTurnIndex
        elseif #getSeatedPlayers() == 1 then
            local targetTag = fourPlayerTurnIndex[roundCounter]
            for _, snap in pairs(campBoardSnaps) do 
                for _, tag in pairs(snap.tags) do 
                    if tag == targetTag then
                        local newPosition = campBoard.positionToWorld(snap.position) + Vector(0, 2, 0)
                        trackerPawn.setPositionSmooth(newPosition)
                        if tag == 'halftime' then
                            halftimeShowButton()
                        end
                        return  -- Exit the function after moving the trackerPawn
                    end
                end
            end
        end
    end

end

function goalTokens()
    local goalTokenBag = getObjectFromGUID(goalBagGUID)
    local campBoardObject = castUp(campSnapCube, 'campBoard')
    local campBoardSnaps = campBoardObject.getSnapPoints()

    goalTokenBag.shuffle()

    for _, point in pairs(campBoardSnaps) do 
        for _, tag in pairs(point.tags) do 
            local oPosition = campBoardObject.positionToWorld(point.position) + Vector(0, 2, 0)
            if tag == 'Goal' then
                local token = goalTokenBag.takeObject({ -- Can't get flip == true to work here so did the bullshit with the Vector below
                    position = oPosition,
                })
                -- Define the rotation vector to rotate the token 180 degrees around the Y-axis
                local rotation = Vector(0, 180, 0)
                token.setRotation(rotation)
            end
        end
    end
end

function castUp(guid, tags)
    local target = getObjectFromGUID(guid)
    local hitlist = Physics.cast({
        origin = (Vector(target.getPosition()) + Vector(0, -2, 0)),
        direction = {0, 1, 0},
        max_distance = 4,
        type = 1, -- Ray
        debug = true,
    })

    if type(tags) == "string" then
        tags = {tags}  -- Cast string tag into a table containing that single tag
    end

    for _, thing in pairs(hitlist) do
        local hit_object = thing.hit_object
        if hit_object then
            for _, tag in ipairs(tags) do
                if hit_object.hasTag(tag) then
                    return hit_object
                end
            end
        end
    end
end

function randomizeTurnOrderAndEnableTurns()
    local playerColors = {}  -- Table to store player colors

    -- Get all player colors
    for _, player in ipairs(Player.getPlayers()) do
        if player.seated then
            table.insert(playerColors, player.color)
        end
    end

    -- Randomize player order
    for i = #playerColors, 2, -1 do
        local j = math.random(1, i)
        playerColors[i], playerColors[j] = playerColors[j], playerColors[i]
    end

    -- Set the turn order using Turns.order
    Turns.order = playerColors

    -- Get the first player color after shuffling
    local firstPlayerColor = playerColors[1]

    -- Enable turn for the first player
    Turns.enable = true
    broadcastToAll(playerColors[1] .. " Is the first player", Pink)

    -- Draw object into the hand of the first player
    local objectGuid = "03f05d"
    local playerHand = Player[firstPlayerColor].getHandObjects()
    if playerHand == nil or #playerHand == 0 then
        getObjectFromGUID(objectGuid).deal(1, firstPlayerColor)
    end
end

function simplifiedSetup()
    local gameBoardObject = getObjectFromGUID(gameBoard)
    local spareDeckCubeObject = getObjectFromGUID(spareDeckCube) -- north deck

    local northDeck = getDeck(spareDeckCubeObject, 'North')
    local westDeck = getDeck(gameBoardObject, 'westDeck')
    local southDeck = getDeck(gameBoardObject, 'middleDeck')
    local eastDeck = getDeck(gameBoardObject, 'eastDeck')

    for _, player in ipairs(getSeatedPlayers()) do 
        northDeck.deal(1)
        westDeck.deal(1)
        southDeck.deal(2)
        eastDeck.deal(1)
    end

end

function removeButton()
    local button = getObjectFromGUID(tableTop)
    if button then button.destruct() end

end

function fourPlayerChanges()
    local players = Player.getPlayers()
    local toDelete = { '314b74', 'a96f81', '884f7c', 'c63d7c' } -- GUIDS of the ? tiles. These are not used in 4 player game

    for _, guid in ipairs(toDelete) do
        local obj = getObjectFromGUID(guid)
        if obj then
            obj.destroy()
        else
            print("Object with GUID " .. guid .. " not found!")
        end
    end
end

function removeSetupItems()
    local players = Player.getPlayers()
    local colorsInUse = {}
    -- Determine colors chosen by players
    for _, player in ipairs(players) do
        local color = player.color
        colorsInUse[color] = true
    end
    -- Remove setup items for colors that no player has chosen
    for color, items in pairs(setupItems) do
        if not colorsInUse[color] then
            for _, guid in ipairs(items) do
                local obj = getObjectFromGUID(guid)
                if obj ~= nil then
                    obj.destruct()
                else
                    print("Object with GUID " .. guid .. " not found!")
                end
            end
        end
    end
end

function castOnly(position)
    local hitlist = Physics.cast({
        origin = (Vector(position) + Vector(0,-2,0)),
        direction = {0,1,0}, 
        max_distance = 3,
        type = 1, -- Ray
        debug = true,
    })

    for _, v in pairs(hitlist) do
        if v['hit_object'].type == 'Deck' then
            return v.hit_object
        end
    end  
end

function castAndCheckForTag(position, tag)
    local hitlist = Physics.cast({
        origin = (Vector(position) + Vector(0,-2,0)),
        direction = {0,1,0}, 
        max_distance = 3,
        type = 1, -- Ray
        debug = true,
    })
  
    if type(tag) == "string" then
        tag = {tag} -- Convert single tag string to a table
    end

    for _, v in pairs(hitlist) do
        for _, t in ipairs(tag) do
            if v['hit_object'].hasTag(t) then
                return v.hit_object
            end
        end
    end
  
    return nil
end

function restock()
    local gameBoardObject = getObjectFromGUID(gameBoard)
    local snappies = gameBoardObject.getSnapPoints()
    local westDeck = getDeck(gameBoardObject, 'westDeck')
    local northSouthDeck = getDeck(gameBoardObject, 'middleDeck')
    local eastDeck = getDeck(gameBoardObject, 'eastDeck')

    for _, point in pairs(snappies) do 
        local oPosition = gameBoardObject.positionToWorld(point.position)
        local cardDrawn = false
        if not castAndCheckForTag(oPosition, cardTags) then
            for _, value in pairs(point.tags) do
                if value == 'West' then
                        westDeck.takeObject({
                        position = oPosition,
                        flip = true,
                    })
                elseif (value == 'South' or value == 'North') and not cardDrawn then
                    -- Check if a card has not been drawn yet for this snap point
                        northSouthDeck.takeObject({
                        position = oPosition,
                        flip = true,
                    })
                    cardDrawn = true -- Set the flag to true after drawing a card
                elseif value == 'East' then
                        eastDeck.takeObject({
                        position = oPosition,
                        flip = true,
                    })
                end
            end
        end
    end
end

function getDeck(obj, tag)
    local snappies = obj.getSnapPoints()

    for i, point in pairs(snappies) do 
        if point.tags then -- Check if the snap point's type matches the desired tag
            for _, t in pairs(point.tags) do 
                if t == tag then
                    local oPosition = obj.positionToWorld(point.position)
                    local hitDeck = castOnly(oPosition)
                    if hitDeck then
                        return hitDeck
                    end
                end
            end
        end
    end
    return nil
end

function onScriptingButtonDown(index, player_color)
    local currentPlayer = Player.getPlayers()[1]
    local selectedObject = currentPlayer.getSelectedObjects()

    if index == 1 then
        local sourceObj = Player[player_color].getHoverObject()
       -- print(sourceObj.getGUID())
        log(sourceObj.getRotation())
    end

    if index == 2 then 
      local sourceObj = Player[player_color].getHoverObject()
      print(sourceObj.getPosition())
      log(sourceObj.getPosition())
    end

    if index == 3 then
        roundTrackerSetup()
    end

    if index == 4 then
         -- Get the GUID of the object that triggered the event
         local sourceObj = Player[player_color].getHoverObject() 
         if sourceObj then
             local guid = sourceObj.getGUID()
             if guid then
                 -- Append the GUID to the notebook tab
                 local notebook = self.getNotebookTabs()[1] -- Accessing the first (and only) notebook tab
                 local notebookText = notebook.body
                 notebookText = notebookText .. "\n" .. guid
                 notebook.body = notebookText
             end
         end
    end

    if index == 5 then
        print(turnCounter)
    end

    -- if index == 6 then -- used to tag decks
    --   local sourceObj = Player[player_color].getHoverObject()
    --     if sourceObj.type == 'Deck' then
    --       local objPos = sourceObj.getPosition()
    --        for _, card in ipairs(sourceObj.getObjects()) do
    --          local cardObj = sourceObj.takeObject({position = objPos})
    --          cardObj.addTag("North")
    --        end
    --     end
    -- end

    if index == 7 then
        for _, pTurns in pairs(Turns.order) do
            print(pTurns)
        end
    end
    
    if index == 8 then
        print(roundCounter)
    end

    if index == 9 then
        testFunction()
    end

end

function testFunction()
   -- local object = getObjectFromGUID(gameBoard)
    
    print ("The current vlaue of roundCounter is: " .. turnCounter)
    for _, pTurns in pairs(halftimeTruth) do
        print(pTurns)
    end
end

function printSnapTableContents(snapsTable)
    if type(snapsTable) == "table" then
        print("Snap table contents:")
        for index, snap in ipairs(snapsTable) do
            print("Snap #" .. index)
            for key, value in pairs(snap) do
                print(key, value)
            end
        end
    else
        print("Not a valid table.")
    end
end

-- function listPositions()
--     local board = getObjectFromGUID(gameBoard)
--     note = "pointData ={\n"
--     if board then
--         local points = board.getSnapPoints()
--         for _, point in ipairs(points) do
--            note = note .. tostring(point.position)
--            note = note .. ",\n"
--            print("Position:", point.position)
--         end
--         note = note .. "}"
--     else
--         print("Board not found.")
--     end
--     Notes.addNotebookTab({title="data", body=note, color="White"})
-- end

function printSnapPointsLocations(obj)
    local snapPoints = obj.getSnapPoints()
    if snapPoints == nil then
        print("No snap points found for the object.")
        return
    end

    print("Snap points locations for object '" .. obj.getName() .. "':")
    for _, snapPoint in ipairs(snapPoints) do
        local worldPos = obj.positionToWorld(snapPoint.position, snapPoint.rotation)
        print("Snap Point " .. snapPoint.index .. ": (" .. worldPos.x .. ", " .. worldPos.y .. ", " .. worldPos.z .. ")")
    end
end