turnCounter = 0
roundCounter = 1
local draftIndex = 1 -- used to keep track of how many drats in the advanced setup
local advancedSetupFlag = false

local tableTop = '4ee1f2'
local gameBoard = 'c01d03' -- main game board

local goalBagGUID = 'a7e97b' -- bag with goal tokens
local blockerTokens = '559cd6'

local spareDeckCube = 'd12877' -- Sunk into the table. North Deck is here
local southDeckCubeMidgame = '474d06' -- Sunk into table
local campSnapCube = 'd237ef' -- Sunk into table
local halftimeShowCube = '54ec5b' -- sunk into table
local startButtonCubeBlue = '18c30d' -- sunk into table
local advancedSetupCube = '8b4889'
local scoreButtonBlock = '80959c'-- holds a score calc button. block is sunk into table
local scorebuttonblock2 = '226dac' -- holds a score calc button. block is sunk into table

local setupText = '45a3fa'
local twoPlayerBlockZone = 'b0e123'
local threePlayerBlockZone = '3dddf5'

local deerGoalToken = '3d97c9'
local deerFlag = false

local cardTags = {"West", "North", "South", "East"} 
local deckTags = {'westDeck', 'middleDeck', 'eastDeck'}

local firstPlayerMarker = '03f05d'
local roundTracker = 'f2b0a8'

local turnIndex = {'T1', 'T2', 'T3', 'halftime', 'T4', 'T5', 'T6'} -- 2-3 players
local fourPlayerTurnIndex = {'T1', 'T2', 'T3', 'T4', 'halftime', 'T5', 'T6', 'T7', 'T8'}

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

-- these are sunk into the table. used to spawn buttons for advanced setup
local r1DraftCube = '93db82'
local r2DraftCube = '61f052'
local r3DraftCube = 'ed691d'
local r4DraftCube = '63eb3a'

local scoringZones = {
    ["Red"] = '8e0f7b',
    ["Yellow"] = 'afbbaa',
    ["Green"] = '2515db',
    ["Purple"] = '09fd42',
}
local firstPlayerTokenSpot ={
    ["Red"] = 'c80dee',
    ["Yellow"] = '1bd566',
    ["Green"] = '084062',
    ["Purple"] = 'e1cd1d',
}

-- none of the tokens use snap Points I just didn't feel like renaming this 
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
    local advancedButtonHolder = getObjectFromGUID(advancedSetupCube)
    buttonHolderCube.editButton({label = "Simple Set Up\n" .. #Player.getPlayers() .. " Player Game"})
    advancedButtonHolder.editButton({label = "Advanced Setup \n" .. #Player.getPlayers() .. " Player Game"})
end

function onLoad()
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

    setupGameButton()
    --scoreButton()
    advancedSetupButton()
    
    local purpleBoard = getObjectFromGUID('59d57e')
    local redBoard = getObjectFromGUID('79a08a')
    local greenBoard = getObjectFromGUID('86ba44')
    local yellowBoard = getObjectFromGUID('381f5f')
    purpleBoard.interactable = false -- purple cube
    redBoard.interactable = false -- red cube
    greenBoard.interactable = false -- green cube
    yellowBoard.interactable = false -- yellow cube
end

function onPlayerTurn(player, previous_player)
    local buttonHolderCube = getObjectFromGUID(halftimeShowCube)
    local r1ButtonHolder = getObjectFromGUID(r1DraftCube)
    if roundCounter ~= 4 and #Player.getPlayers() < 4 then
        restock()
    elseif roundCounter ~= 5 and #Player.getPlayers() == 4 then
        restock()
    end
    turnCounter = turnCounter + 1

    if buttonHolderCube and roundCounter == 4 and #Player.getPlayers() < 4 then -- this logic prevents players from fucking up turn order in the halftime part of the game by passing
        turnCounter = 0
    elseif buttonHolderCube and roundCounter == 5 and #Player.getPlayers() == 4 then
        turnCounter = 0
    end

    if r1ButtonHolder and roundCounter == 1 and advancedSetupFlag == true then -- stops players from messing up turn order by passing in the draft phase. 
        turnCounter = 1
    end

    if #Player.getPlayers() == 2 then -- 10 turns per round
        if turnCounter > 10 then
            Wait.frames(function() nextRound() end, 1) -- needed the wait here for the turn tracking to function properly            
        end
    elseif #Player.getPlayers() == 3 then -- 15 turns per round
        if turnCounter > 15 then
            Wait.frames(function() nextRound() end, 1) -- needed the wait here for the turn tracking to function properly      
        end
    elseif #Player.getPlayers() >= 4 then -- 16 turns per round
        if turnCounter > 16 then
            Wait.frames(function() nextRound() end, 1) -- needed the wait here for the turn tracking to function properly      
        end
    end
end

function onObjectEnterZone(zone, object)

    if zone.guid == twoPlayerBlockZone or zone.guid == threePlayerBlockZone then
        if object.hasTag('Path') then
            Wait.frames(function() object.setPosition(Vector(-4.26, 1.07, 10.84)) end, 75)
            local msg = "That spot is not available in a " .. #Player.getPlayers() .. " player game"
            Wait.frames(function() broadcastToAll(msg) end, 75)
            Wait.frames(function() object.highlightOn("Red", 3) end, 75)
            Wait.frames(function() Player[Turns.turn_color].pingTable(Vector(-4.26, 1.07, 10.84)) end, 75)
        end
    end

end

function setupGameButton() -- Simple setup
    local buttonHolderCube = getObjectFromGUID(startButtonCubeBlue)
    local setupButton = {click_function = "simplifiedSetup", 
                        function_owner = self, 
                        label = "Simple Set Up\n" .. #Player.getPlayers() .. " Player Game", 
                        position = {0, 1, 0}, 
                        rotation = {0, 180, 0}, 
                        scale = {0.5, 0.5, 0.5}, 
                        width = 5000, 
                        height = 3000, 
                        font_size = 1000, 
                        tooltip = "Simplified game setup"}
    buttonHolderCube.createButton(setupButton)
end

function scoreButton()
    local buttonHolderCube = getObjectFromGUID(scoreButtonBlock)
    local buttonHolderCube2 = getObjectFromGUID(scorebuttonblock2)

    local setupButton = {click_function = "scoreCalc", 
                        function_owner = self, 
                        label = "Print Scores", 
                        position = {0, 1, 0}, 
                        rotation = {0, 180, 0}, 
                        scale = {0.5, 0.5, 0.5}, 
                        width = 5000,
                        height = 3000,
                        color = {r=27/255,g=125/255,b=57/255},
                        font_color = {r=1, g=1, b=1},
                        font_size = 600,
                        tooltip = "Prints all players current scores to chat"}
    buttonHolderCube.createButton(setupButton)
    buttonHolderCube2.createButton(setupButton)
end

function scoreCalc()
    local players = Player.getPlayers()
    local colorsInUse = {}
    local campBoardCubeObj = getObjectFromGUID(campSnapCube) -- cube under table with snap point
    local campBoardPos = campBoardCubeObj.getPosition() + Vector(0, 2, 0)
    local campBoardObj = castAndCheckForTag(campBoardPos, 'campBoard')
    local snappies = campBoardObj.getSnapPoints()
    
    -- Determine colors chosen by players
    for _, player in ipairs(players) do
        local color = player.color
        colorsInUse[color] = player.steam_name
    end

    for color, zoneGUID in pairs(scoringZones) do
        if colorsInUse[color] then
            local playerName = colorsInUse[color]
            playerScore = 0
            playerZone = getObjectFromGUID(zoneGUID)
            if playerZone ~= nil then
                allCards = playerZone.getObjects()
                for _, thing in ipairs(allCards) do 
                    if thing.tag == 'Card' then
                        local cardPointValue = tonumber(thing.getGMNotes())
                        if cardPointValue ~= nil then
                            playerScore = playerScore + cardPointValue
                        end
                    elseif thing.type =='Deck' then -- no cards should be stacked as a deck, but if your players are stupid this still scores things. 
                        local objPos = thing.getPosition()

                        for _, card in ipairs(thing.getObjects()) do
                            local cardObj = thing.takeObject({position = objPos})
                            local cardPointValue = tonumber(cardObj.getGMNotes())
                            playerScore = playerScore + cardPointValue
                        end
                    end
                end

                -- Calculates the value of the goal tokens on the campfire board
                for _, point in pairs(snappies) do
                    local oPosition = campBoardObj.positionToWorld(point.position)
                    local hitObject = castAndCheckForTag(oPosition, color)
                    if hitObject then
                        local tokenValue = tonumber(hitObject.getGMNotes())
                        playerScore = playerScore + tokenValue
                    end
                end

                printToAll(playerName .. " has " .. playerScore .. " points", {1, 1, 1})
            else
                printToAll("Zone for " .. playerName .. " not found", {1, 0, 0})
            end
        end
    end
end

function advancedSetupButton()
    local advancedButtonHolder = getObjectFromGUID(advancedSetupCube)
    local advancedButton = {click_function = "advancedSetup", 
                        function_owner = self, 
                        label = "Advanced Setup \n" .. #Player.getPlayers() .. " Player Game", 
                        position = {0, 1, 0}, 
                        rotation = {0, 180, 0}, 
                        scale = {0.5, 0.5, 0.5}, 
                        width = 5200,
                        height = 3000,
                        color = {r=1,g=1,b=1},
                        font_size = 700, 
                        tooltip = "Click this to do the advanced setup of the game. Simple is recommended for your first play"}
    advancedButtonHolder.createButton(advancedButton)
end

function advancedSetup()
    local r1ButtonHolder = getObjectFromGUID(r1DraftCube)
    local r2ButtonHolder = getObjectFromGUID(r2DraftCube)
    local r3ButtonHolder = getObjectFromGUID(r3DraftCube)
    local r4ButtonHolder = getObjectFromGUID(r4DraftCube)
    local helperTextObj = getObjectFromGUID(setupText)
    advancedSetupFlag = true
    cardDraftButtonR1()
    cardDraftButtonR2()
    cardDraftButtonR3()
    cardDraftButtonR4()
    addDeer()

    local gameBoardObject = getObjectFromGUID(gameBoard)
    local spareDeckCubeObject = getObjectFromGUID(spareDeckCube) -- north deck
    local northDeck = getDeck(spareDeckCubeObject, 'North')
    local westDeck = getDeck(gameBoardObject, 'westDeck')
    local southDeck = getDeck(gameBoardObject, 'middleDeck')
    local eastDeck = getDeck(gameBoardObject, 'eastDeck')

    northDeck.shuffle()
    westDeck.shuffle()
    southDeck.shuffle()
    eastDeck.shuffle()



    
    gameSetup()

    r1ButtonHolder.editButton({color = Turns.order[draftIndex]})
    r2ButtonHolder.editButton({color = Turns.order[draftIndex]})
    r3ButtonHolder.editButton({color = Turns.order[draftIndex]})
    r4ButtonHolder.editButton({color = Turns.order[draftIndex]})

    helperTextObj.destruct()
end

function cardDraft(tag)
    local gameBoardObject = getObjectFromGUID(gameBoard)
    local snappies = gameBoardObject.getSnapPoints()
    local currentColor = Turns.order[draftIndex]
    local spareDeckCubeObject = getObjectFromGUID(spareDeckCube) -- north deck
    local northDeck = getDeck(spareDeckCubeObject, 'North')


    local r1ButtonHolder = getObjectFromGUID(r1DraftCube)
    local r2ButtonHolder = getObjectFromGUID(r2DraftCube)
    local r3ButtonHolder = getObjectFromGUID(r3DraftCube)
    local r4ButtonHolder = getObjectFromGUID(r4DraftCube)

        for _, point in pairs(snappies) do
            local oPosition = gameBoardObject.positionToWorld(point.position)
            for _, label in pairs (point.tags) do
                if label == tag then
                    local card = nil
                    local hitlist = Physics.cast({
                        origin = (Vector(oPosition) + Vector(0,-2,0)),
                        direction = {0,1,0},
                        max_distance = 3,
                        type = 1, -- Ray
                        debug = false,
                    })
                
                    for _, v in pairs(hitlist) do
                        if v.hit_object.type == 'Card' then
                            card = v.hit_object
                        end
                    end
                    card.deal(1, currentColor)
                end
            end
        end
        northDeck.deal(1, currentColor)
        draftIndex = draftIndex + 1
        currentColor = Turns.order[draftIndex]
        r1ButtonHolder.editButton({color = currentColor})
        r2ButtonHolder.editButton({color = currentColor})
        r3ButtonHolder.editButton({color = currentColor})
        r4ButtonHolder.editButton({color = currentColor})

        if draftIndex > #Player.getPlayers() then
            r1ButtonHolder.destruct()
            r2ButtonHolder.destruct()
            r3ButtonHolder.destruct()
            r4ButtonHolder.destruct()
        end
end

function cardDraftButtonR1()
    local r1ButtonHolder = getObjectFromGUID(r1DraftCube)
    local r1Draft = {click_function = "handleR1Draft", 
                        function_owner = self, 
                        label = "Row 1", 
                        position = {0, 1, 0}, 
                        rotation = {0, 180, 0}, 
                        scale = {0.5, 0.5, 0.5}, 
                        width = 3000,
                        height = 1500,
                        color = {r=1,g=1,b=1},
                        font_size = 5000, 
                        tooltip = "Click this to draft this row of cards"}
        r1ButtonHolder.createButton(r1Draft)
end

function cardDraftButtonR2()
    local r2ButtonHolder = getObjectFromGUID(r2DraftCube)
    local r2Draft = {click_function = "handleR2Draft", 
                        function_owner = self, 
                        label = "Row 2", 
                        position = {0, 1, 0}, 
                        rotation = {0, 180, 0}, 
                        scale = {0.5, 0.5, 0.5}, 
                        width = 3000,
                        height = 1500,
                        color = {r=1,g=1,b=1},
                        font_size = 5000, 
                        tooltip = "Click this to draft this row of cards"}
        r2ButtonHolder.createButton(r2Draft)
end

function cardDraftButtonR3()
    local r3ButtonHolder = getObjectFromGUID(r3DraftCube)
    local r3Draft = {click_function = "handleR3Draft", 
                        function_owner = self, 
                        label = "Row 3", 
                        position = {0, 1, 0}, 
                        rotation = {0, 180, 0}, 
                        scale = {0.5, 0.5, 0.5}, 
                        width = 3000,
                        height = 1500,
                        color = {r=1,g=1,b=1},
                        font_size = 5000, 
                        tooltip = "Click this to draft this row of cards"}
        r3ButtonHolder.createButton(r3Draft)
end

function cardDraftButtonR4()
    local r4ButtonHolder = getObjectFromGUID(r4DraftCube)
    local r4Draft = {click_function = "handleR4Draft", 
                        function_owner = self, 
                        label = "Row 4", 
                        position = {0, 1, 0}, 
                        rotation = {0, 180, 0}, 
                        scale = {0.5, 0.5, 0.5}, 
                        width = 3000,
                        height = 1500,
                        color = {r=1,g=1,b=1},
                        font_size = 5000, 
                        tooltip = "Click this to draft this row of cards"}
        r4ButtonHolder.createButton(r4Draft)
end

function handleR1Draft()
    cardDraft('R1')
    Wait.frames(function() restock() end, 5)

    if draftIndex > #Player.getPlayers() then -- this sets the person who was selected as first back to first if anyone passes in the draft phase. Also resets the turn counter to 1
        if Turns.turn_color ~= Turns.order then
            Turns.turn_color = Turns.order[1]
            turnCounter = 1
        end
    end
end

function handleR2Draft()
    cardDraft('R2')
    Wait.frames(function() restock() end, 5)

    if draftIndex > #Player.getPlayers() then -- this sets the person who was selected as first back to first if anyone passes in the draft phase. Also resets the turn counter to 1
        if Turns.turn_color ~= Turns.order then
            Turns.turn_color = Turns.order[1]
            turnCounter = 1
        end
    end
end

function handleR3Draft()
    cardDraft('R3')
    Wait.frames(function() restock() end, 5)

    if draftIndex > #Player.getPlayers() then -- this sets the person who was selected as first back to first if anyone passes in the draft phase. Also resets the turn counter to 1
        if Turns.turn_color ~= Turns.order then
            Turns.turn_color = Turns.order[1]
            turnCounter = 1
        end
    end
end

function handleR4Draft()
    cardDraft('R4')
    Wait.frames(function() restock() end, 5)

    if draftIndex > #Player.getPlayers() then -- this sets the person who was selected as first back to first if anyone passes in the draft phase. Also resets the turn counter to 1
        if Turns.turn_color ~= Turns.order then
            Turns.turn_color = Turns.order[1]
            turnCounter = 1
        end
    end
end

function setupCampBoard()
    local campBoardBagObj = getObjectFromGUID(campBoardBag)
    local campBoardCubeObj = getObjectFromGUID(campSnapCube)
    local campBoardPos = campBoardCubeObj.getPosition()

    if #getSeatedPlayers() == 1 then
        --solo mode needs done still
    elseif #getSeatedPlayers() == 2 then
        local board = campBoardBagObj.takeObject({
            position = campBoardPos + Vector(0, 2, 0),
            guid = twoPlayerCampBoard,
        })
        Wait.frames(function() board.lock() end, 100)
    elseif #getSeatedPlayers() == 3 then
        local board = campBoardBagObj.takeObject({
            position = campBoardPos + Vector(0, 2, 0),
            guid = threePlayerCampBoard,
        })
        Wait.frames(function() board.lock() end, 100)
    else -- 4 players  
        local board = campBoardBagObj.takeObject({
            position = campBoardPos + Vector(0, 2, 0),
            guid = fourPlayerCampBoard,
        })
        Wait.frames(function() board.lock() end, 100)
    end
    setBlockers()
end

function roundTrackerSetup()
    local trackerPawn = getObjectFromGUID(roundTracker)
    local campBoardCubeObj = getObjectFromGUID(campSnapCube)
    local campBoardPos = campBoardCubeObj.getPosition() + Vector(0, 2, 0)
    local campBoardObj = castAndCheckForTag(campBoardPos, 'campBoard')
    local snappies = campBoardObj.getSnapPoints()

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

    if #getSeatedPlayers() == 1 then
        Wait.time(function () restock() end, 0.7)
        broadcastToAll('Solo mode not currently scripted')

    elseif #getSeatedPlayers() < 4 then
        Wait.time(function () restock() end, 0.7)
        randomizeTurnOrderAndEnableTurns()
    else
        Wait.time(function () restock() end, 0.7)
        fourPlayerChanges()
        randomizeTurnOrderAndEnableTurns()
    end
    removeSetupItems() -- Destorys unused assets
    removeEnvelopes()

    local buttonHolderCube = getObjectFromGUID(startButtonCubeBlue)
    local advancedButtonHolder = getObjectFromGUID(advancedSetupCube)
    buttonHolderCube.destruct()
    advancedButtonHolder.destruct()

    setupCampBoard()
    moveFirstPlayerMarker()
    Wait.frames(function() goalTokens() end, 100)
    Wait.frames(function() roundTrackerSetup() end, 100)
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

    -- Place North deck in the position of the South deck
    if northDeck then
        northDeck.setPosition(southDeckPosition) -- Place North deck where South deck was
    end

    -- Places north cards on the empty spaces
    Wait.frames(function () restock() end, 50) -- need to wait here for west and east cards to get off the board

    returnPathTiles()
    roundCounter = roundCounter + 1
    moveTracker()
    moveFirstPlayerMarker()
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

function moveFirstPlayerMarker()
    local firstPlayerObj = getObjectFromGUID(firstPlayerMarker)
    local firstPlayerColor = Turns.order[1]
    local firstPlayerHolder = getObjectFromGUID(firstPlayerTokenSpot[firstPlayerColor]) -- cube where marker should be
    local firstPlayerMarkerPos = firstPlayerHolder.getPosition() + Vector(0, 2, 0)
    local hasMarker = castAndCheckForTag(firstPlayerMarkerPos, 'First')

    if not hasMarker then
        firstPlayerObj.setPositionSmooth(firstPlayerMarkerPos, false, true)
        if firstPlayerColor == 'Red' or firstPlayerColor =='Yellow' then
            firstPlayerObj.setRotationSmooth(Vector(0,270,0))
        elseif firstPlayerColor == 'Purple' or firstPlayerColor == 'Green' then
            firstPlayerObj.setRotationSmooth(Vector(0,90,0))
        end
    end
end

function nextRound()
    -- Reset turn counter at the start of each round
    turnCounter = 0
    roundCounter = roundCounter + 1
    moveTracker()

    local firstPlayer = Turns.order[1]

    -- If there is only one player, just return
    if #Turns.order < 2 then
        return
    end



    -- Adjust the turn order for the new round
    local newTurnOrder = {}
    for i = 2, #Turns.order do
        table.insert(newTurnOrder, Turns.order[i])
    end
    table.insert(newTurnOrder, firstPlayer)

    -- Set the new turn order
    Turns.order = newTurnOrder

    -- Enable turn for the new first player
    Turns.enable = true
    Turns.turn_color = Turns.order[1]

    if roundCounter ~= 4 and #Player.getPlayers() < 4 then
        returnPathTiles()    
    elseif roundCounter ~= 5 and #Player.getPlayers() >= 4 then
        returnPathTiles()
    end
    
    moveFirstPlayerMarker()
    print("Round Complete")
end

function moveTracker()
    local trackerPawn = getObjectFromGUID(roundTracker)
    local campBoardCubeObj = getObjectFromGUID(campSnapCube) -- cube under table with snap point
    local campBoardPos = campBoardCubeObj.getPosition() + Vector(0, 2, 0)
    local campBoardObj = castAndCheckForTag(campBoardPos, 'campBoard')
    local snappies = campBoardObj.getSnapPoints()

    -- If campBoard and its snap points are found, proceed to move the trackerPawn
    if campBoardObj and snappies then
        -- 2 - 3 players 
        if #getSeatedPlayers() < 4 then
            local targetTag = turnIndex[roundCounter]
            for _, snap in pairs(snappies) do 
                for _, tag in pairs(snap.tags) do
                    if tag == targetTag then
                        local newPosition = campBoardObj.positionToWorld(snap.position) + Vector(0, 2, 0)
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
            for _, snap in pairs(snappies) do 
                for _, tag in pairs(snap.tags) do 
                    if tag == targetTag then
                        local newPosition = campBoardObj.positionToWorld(snap.position) + Vector(0, 2, 0)
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
        debug = false,
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
end

function simplifiedSetup()
    local gameBoardObject = getObjectFromGUID(gameBoard)
    local spareDeckCubeObject = getObjectFromGUID(spareDeckCube) -- north deck
    local helperTextObj = getObjectFromGUID(setupText)

    local northDeck = getDeck(spareDeckCubeObject, 'North')
    local westDeck = getDeck(gameBoardObject, 'westDeck')
    local southDeck = getDeck(gameBoardObject, 'middleDeck')
    local eastDeck = getDeck(gameBoardObject, 'eastDeck')

    northDeck.shuffle()
    westDeck.shuffle()
    southDeck.shuffle()
    eastDeck.shuffle()
    addDeer()


    helperTextObj.destruct()
    gameSetup()

    for _, player in ipairs(getSeatedPlayers()) do
        northDeck.deal(1, player)
        westDeck.deal(1, player)
        southDeck.deal(2, player)
        eastDeck.deal(1, player)
    end

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

function removeEnvelopes()
    local envelopes = {'900e95', '665fe1', '2c3984', '2a954f', '8e2be1', 'c6a3fa', 'da904c'}
    for _, packet in pairs(envelopes) do 
        local obj = getObjectFromGUID(packet)
        if obj ~= nil then
            obj.destruct()
        end
    end
end

function addDeer()
    local goalTokenBag = getObjectFromGUID('a7e97b')
    local deerGoal = getObjectFromGUID(deerGoalToken)
    print(deerGoal.guid)
    if deerFlag then

        goalTokenBag.putObject(deerGoal)
    end
end

function deerFlip()
    deerFlag = true
end

function castOnly(position)
    local hitlist = Physics.cast({
        origin = (Vector(position) + Vector(0,-2,0)),
        direction = {0,1,0}, 
        max_distance = 3,
        type = 1, -- Ray
        debug = false,
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
        debug = false,
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
                if value == 'West' and not cardDrawn then
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
                elseif value == 'East' and not cardDrawn then
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

function setBlockers()
    blockerBag = getObjectFromGUID(blockerTokens)

    if #Player.getPlayers() == 3 then

        local blocker = blockerBag.takeObject({
            position = Vector(-5.566, 1, 25.527),
            rotation = Vector(0.03, 66.8, 0),
        })
        local twoPlayerZone = getObjectFromGUID(twoPlayerBlockZone)
        twoPlayerZone.destruct()
        blocker.lock()

    elseif #Player.getPlayers() == 2 then

       local blocker1 = blockerBag.takeObject({
            position = Vector(-5.566, 1, 25.527),
            rotation = Vector(0.03, 66.8, 0),
        })

        local blocker2 = blockerBag.takeObject({
            position = Vector(-3.457, 1, 22.817),
            rotation = Vector(0.05, 36.5, 0),
        })
        blocker1.lock()
        blocker2.lock()
    end
end

function addPromos(obj)
    local gameBoardObject = getObjectFromGUID(gameBoard)
    local spareDeckCubeObject = getObjectFromGUID(spareDeckCube)
    local northDeck = getDeck(spareDeckCubeObject, 'North')
    local westDeck = getDeck(gameBoardObject, 'westDeck')
    local southDeck = getDeck(gameBoardObject, 'middleDeck')
    local eastDeck = getDeck(gameBoardObject, 'eastDeck')
    local northDeckPos = northDeck.getPosition()
    local southDeckPos = southDeck.getPosition()
    local eastDeckPos = eastDeck.getPosition()
    local westDeckPos = westDeck.getPosition()
    local tempObj = getObjectFromGUID(obj)
    local tempPos = tempObj.getPosition()
    local tempDeck = tempObj.takeObject({position = tempPos + Vector(0,2,0)})
    local tempDeckObj = getObjectFromGUID(tempDeck.guid)



    for _, card in ipairs(tempDeckObj.getObjects()) do
        for _, tag in pairs(card.tags) do
            if tag == 'South' then
                tempDeckObj.takeObject({position = southDeckPos, rotation = Vector(0,180,180)})
            elseif tag == 'North' then
                tempDeckObj.takeObject({position = northDeckPos, rotation = Vector(0,180,180)})
            elseif tag == 'West' then
                tempDeckObj.takeObject({position = westDeckPos, rotation = Vector(0,180,180)})
            elseif tag == 'East' then
                tempDeckObj.takeObject({position = eastDeckPos, rotation = Vector(0,180,180)})
            end

        end
    end

end

-- function getBoardAndDecks()
--     local gameBoardObject = getObjectFromGUID(gameBoard)
--     local spareDeckCubeObject = getObjectFromGUID(spareDeckCube)
--     local northDeck = getDeck(spareDeckCubeObject, 'North')
--     local westDeck = getDeck(gameBoardObject, 'westDeck')
--     local southDeck = getDeck(gameBoardObject, 'middleDeck')
--     local eastDeck = getDeck(gameBoardObject, 'eastDeck')
-- end

-- function onScriptingButtonDown(index, player_color)
--     if index == 3 then
--         addPromos()
--     end

--     if index == 4 then
--         removeEnvelopes()
--     end
--     if index == 5 then 
--         addDeer()
--     end
-- end