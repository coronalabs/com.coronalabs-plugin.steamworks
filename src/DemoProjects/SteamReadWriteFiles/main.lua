local steamworks = require("plugin.steamworks")
local json = require("json")
local widget = require("widget") -- For buttons

-- Ensure Steam is logged in
if not steamworks.isLoggedOn then
    local function onAlertHandler(event)
        if event.action == "clicked" and event.index == 1 then
            system.openURL("steam:")
        end
        native.requestExit()
    end

    native.showAlert(
        "Warning",
        "You must log into Steam in order to play this game.\nAfter logging in, relaunch this app.",
        { "Log In", "Close" },
        onAlertHandler
    )
    return
end

-- Save player data
local function savePlayerData()
    local saveData = {
        level = 5,
        score = 12345,
        items = { "sword", "shield", "potion" }
    }
    local jsonData = json.encode(saveData)
    if steamworks.writeFile("playerData.json", jsonData) then
        print("Player data saved to Steam Cloud!")
    else
        print("Failed to save player data.")
    end
end

-- Load player data
local function loadPlayerData()
    if not steamworks.fileExists("playerData.json") then
        print("No saved data found.")
        return
    end
    local contents = steamworks.readFile("playerData.json")
    if contents then
        local saveData = json.decode(contents)
        print("Loaded player data:")
        print("Level:", saveData.level)
        print("Score:", saveData.score)
        print("Items:", table.concat(saveData.items, ", "))
    else
        print("Failed to read player data.")
    end
end

-- Delete player data
local function deletePlayerData()
    if steamworks.fileExists("playerData.json") then
        if steamworks.deleteFile("playerData.json") then
            print("Player data deleted from Steam Cloud.")
        else
            print("Failed to delete player data.")
        end
    else
        print("No file to delete.")
    end
end

-- Create buttons
local buttonY = display.contentCenterY - 60
local spacing = 80

local saveButton = widget.newButton({
    label = "Save Data",
    x = display.contentCenterX,
    y = buttonY,
    width = 200,
    height = 40,
    onRelease = savePlayerData
})

local loadButton = widget.newButton({
    label = "Load Data",
    x = display.contentCenterX,
    y = buttonY + spacing,
    width = 200,
    height = 40,
    onRelease = loadPlayerData
})

local deleteButton = widget.newButton({
    label = "Delete Data",
    x = display.contentCenterX,
    y = buttonY + spacing * 2,
    width = 200,
    height = 40,
    onRelease = deletePlayerData
})
