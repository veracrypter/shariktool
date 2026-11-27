local Library, UILibNotifications, UILibThemes = loadstring(game:HttpGet("link"))() -- library link

local Settings = {
    -- main window name
    WindowName = "priv13 | shariktools",

    -- watermarks and placeholders
    Watermark = "priv13 | shariktools | [{build}] | FPS: {fps} | Ping: {ping}",
    IsDev     = false, -- if true writes in build dev, if false writes user or sum shi i dont remember

    
    PetPanel = { -- pet panel with imgs
        Enabled     = true,
        Images      = {
            "https://r2.e-z.host/679dd696-e8cf-4c6c-a895-1a9cb7560b69/szyb54glrozg5wmnaf.jpg", --raw image
            "https://r2.e-z.host/679dd696-e8cf-4c6c-a895-1a9cb7560b69/6pgg5orls0oupfnfp9.jpg",
            "https://r2.e-z.host/679dd696-e8cf-4c6c-a895-1a9cb7560b69/g1n8ew2zmamhm2px1y.png",
        },
        ImageWidth  = 720, -- usually streches
        ImageHeight = 934,
        Width       = 220,
        Name        = "sharik",
    },

    -- update log in script
    UpdateLog = {
        Enabled = true,
        Title   = "Update Log",
        Entries = {
            "+ example",
            "+ example",
            "~ example",
        },
    },
}

--watermark
Library.WatermarkText  = Settings.Watermark
Library.WatermarkIsDev = Settings.IsDev

--main window
local Window = Library:Window({
    Name = Settings.WindowName,
    Size = UDim2.new(0, 455, 0, 680),
})

--pet panel
local PetPanelInstance = Library:PetPanel({
    Enabled     = Settings.PetPanel.Enabled,
    Images      = Settings.PetPanel.Images,
    ImageWidth  = Settings.PetPanel.ImageWidth,
    ImageHeight = Settings.PetPanel.ImageHeight,
    Width       = Settings.PetPanel.Width,
    Name        = Settings.PetPanel.Name,
    AnchorWindow = Window,
    Side         = "Left",
    Gap          = 8,
    AlignY       = "Top",
})

-- update log
if Settings.UpdateLog.Enabled then
    Library:UpdateLog({
        Title        = Settings.UpdateLog.Title,
        Entries      = Settings.UpdateLog.Entries,
        AnchorWindow = Window,
        Side         = "Right",
        Gap          = 8,
        AlignY       = "Top",
    })
end

--tabs
local CombatTab = Window:Tab({ Name = "Combat" })

-- sections
local AimSection = CombatTab:Section({ Name = "Aimbot", Side = "Left" })

-- toggle with req in executor api (broken and semi works)
AimSection:Toggle({
    Name     = "Silent Aim",
    Flag     = "SilentAim",
    Default  = false,
    Requires = { "hookmetamethod", "getrawmetatable" }, -- reqs
    Callback = function(v: boolean)
        -- script here
    end,
})

-- folding
AimSection:Toggle({
    Name     = "Show FOV Circle",
    Flag     = "FovCircle",
    Default  = false,
    Requires = { "Drawing" },
    Folding  = true,
    Callback = function(v: boolean)
        -- script
    end,
})

-- slider
AimSection:Slider({
    Name     = "FOV Radius",
    Flag     = "FovRadius",
    Min      = 0,
    Max      = 500,
    Default  = 150,
    Decimal  = 1,
    Suffix   = "px",
    Callback = function(v: number)
        -- script
    end,
})

-- dropdown
AimSection:Dropdown({
    Name     = "Target Bone",
    Flag     = "AimBone",
    Options  = { "Head", "Neck", "HumanoidRootPart", "UpperTorso", "LowerTorso" },
    Default  = "Head",
    Multi    = false,
    Callback = function(v: string)
        -- script
    end,
})

-- laberl with keypicker
AimSection:Label({ Name = "Aim Key" }):Keypicker({
    Name     = "Aim Key",
    Flag     = "AimKey",
    Mode     = "Hold",   -- hold toggle always
    Callback = function(active: boolean)
        -- script
    end,
})

-- setction
local AimExtraSection = CombatTab:Section({ Name = "Prediction", Side = "Right" })

AimExtraSection:Toggle({
    Name     = "Velocity Prediction",
    Flag     = "VelocityPred",
    Default  = false,
    Callback = function(v: boolean) end,
})

AimExtraSection:Slider({
    Name     = "Smoothness",
    Flag     = "AimSmooth",
    Min      = 0,
    Max      = 100,
    Default  = 50,
    Decimal  = 1,
    Suffix   = "%",
    Callback = function(v: number) end,
})

AimExtraSection:Slider({
    Name     = "Ping Compensation",
    Flag     = "PingComp",
    Min      = 0,
    Max      = 300,
    Default  = 0,
    Decimal  = 1,
    Suffix   = "ms",
    Callback = function(v: number) end,
})

-- visuals
local VisualsTab = Window:Tab({ Name = "Visuals" })

-- multi selection
local EspMulti = VisualsTab:MultiSection({
    Tabs = { "Players", "World", "Misc" },
    Side = "Left",
})

-- player tab
local PlayersSection = EspMulti:Tab("Players")

PlayersSection:Toggle({
    Name     = "ESP Boxes",
    Flag     = "EspBoxes",
    Default  = false,
    Requires = { "Drawing" },
    Callback = function(v: boolean) end,
})

-- label
PlayersSection:Label({ Name = "Box Color" }):Colorpicker({
    Flag     = "BoxColor",
    Color    = Color3.fromRGB(255, 255, 255),
    Alpha    = 0,
    Mode     = "Keypicker",
    Callback = function(color: Color3, alpha: number) end,
})

PlayersSection:Toggle({
    Name     = "ESP Names",
    Flag     = "EspNames",
    Default  = false,
    Requires = { "Drawing" },
    Callback = function(v: boolean) end,
})

PlayersSection:Toggle({
    Name     = "ESP Health",
    Flag     = "EspHealth",
    Default  = false,
    Requires = { "Drawing" },
    Callback = function(v: boolean) end,
})

PlayersSection:Slider({
    Name     = "ESP Distance",
    Flag     = "EspDistance",
    Min      = 100,
    Max      = 5000,
    Default  = 1000,
    Decimal  = 50,
    Suffix   = "st",
    Callback = function(v: number) end,
})

-- world
local WorldSection = EspMulti:Tab("World")

WorldSection:Toggle({
    Name     = "Chests",
    Flag     = "EspChests",
    Default  = false,
    Requires = { "Drawing" },
    Callback = function(v: boolean) end,
})

-- label with colorpicker
WorldSection:Label({ Name = "Chest Color" }):Colorpicker({
    Flag     = "ChestColor",
    Color    = Color3.fromRGB(255, 200, 50),
    Alpha    = 0,
    Mode     = "Animation",
    Callback = function(color: Color3, alpha: number) end,
})

-- misc
local MiscVisualsSection = EspMulti:Tab("Misc")

MiscVisualsSection:Toggle({
    Name     = "Crosshair",
    Flag     = "Crosshair",
    Default  = false,
    Requires = { "Drawing" },
    Callback = function(v: boolean) end,
})

-- section
local EspStyleSection = VisualsTab:Section({ Name = "Style", Side = "Right" })

EspStyleSection:Dropdown({
    Name     = "Box Type",
    Flag     = "BoxType",
    Options  = { "2D", "3D", "Corner" },
    Default  = "2D",
    Callback = function(v: string) end,
})

EspStyleSection:Toggle({
    Name     = "Filled Boxes",
    Flag     = "EspFilled",
    Default  = false,
    Callback = function(v: boolean) end,
})

EspStyleSection:Slider({
    Name     = "Box Thickness",
    Flag     = "BoxThickness",
    Min      = 1,
    Max      = 5,
    Default  = 1,
    Decimal  = 0.5,
    Suffix   = "px",
    Callback = function(v: number) end,
})

-- player
local PlayerTab = Window:Tab({ Name = "Player" })

local MovementSection = PlayerTab:Section({ Name = "Movement", Side = "Left" })

MovementSection:Toggle({
    Name     = "Infinite Jump",
    Flag     = "InfJump",
    Default  = false,
    Requires = { "hookfunction" },
    Callback = function(v: boolean) end,
})

MovementSection:Slider({
    Name     = "Walk Speed",
    Flag     = "WalkSpeed",
    Min      = 16,
    Max      = 200,
    Default  = 16,
    Decimal  = 1,
    Suffix   = "st/s",
    Callback = function(v: number)
        local lp = game:GetService("Players").LocalPlayer
        if lp and lp.Character and lp.Character:FindFirstChild("Humanoid") then
            lp.Character.Humanoid.WalkSpeed = v
        end
    end,
})

MovementSection:Slider({
    Name     = "Jump Power",
    Flag     = "JumpPower",
    Min      = 50,
    Max      = 500,
    Default  = 50,
    Decimal  = 5,
    Suffix   = "",
    Callback = function(v: number)
        local lp = game:GetService("Players").LocalPlayer
        if lp and lp.Character and lp.Character:FindFirstChild("Humanoid") then
            lp.Character.Humanoid.JumpPower = v
        end
    end,
})

MovementSection:Button({
    Name     = "Reset Character",
    Callback = function()
        local lp = game:GetService("Players").LocalPlayer
        if lp and lp.Character and lp.Character:FindFirstChild("Humanoid") then
            lp.Character.Humanoid.Health = 0
        end
    end,
})

local AntiCheatSection = PlayerTab:Section({ Name = "Anti-Cheat", Side = "Right" })

AntiCheatSection:Toggle({
    Name     = "Anti-Kick",
    Flag     = "AntiKick",
    Default  = false,
    Requires = { "hookmetamethod", "hookfunction" },
    Callback = function(v: boolean) end,
})

AntiCheatSection:Toggle({
    Name     = "Anti-Detect",
    Flag     = "AntiDetect",
    Default  = false,
    Requires = { "hookmetamethod", "getrawmetatable" },
    Callback = function(v: boolean) end,
})

-- misc
local MiscTab = Window:Tab({ Name = "Misc" })

local AutoFarmSection = MiscTab:Section({ Name = "Auto Farm", Side = "Left" })

AutoFarmSection:Toggle({
    Name     = "Auto Farm",
    Flag     = "AutoFarm",
    Default  = false,
    Callback = function(v: boolean) end,
})

-- multi
AutoFarmSection:Dropdown({
    Name     = "Farm Targets",
    Flag     = "FarmTargets",
    Options  = { "Mobs", "Bosses", "Chests", "NPCs" },
    Default  = "Mobs",
    Multi    = true,
    Callback = function(v: {string})
        -- 
    end,
})

AutoFarmSection:Toggle({
    Name     = "Auto Collect",
    Flag     = "AutoCollect",
    Default  = false,
    Requires = { "firetouchinterest" },
    Callback = function(v: boolean) end,
})

AutoFarmSection:Toggle({
    Name     = "Auto Click NPC",
    Flag     = "AutoClickNPC",
    Default  = false,
    Requires = { "fireclickdetector" },
    Callback = function(v: boolean) end,
})

-- textbox
AutoFarmSection:Textbox({
    Name        = "Player Tag",
    Flag        = "PlayerTag",
    Default     = "",
    Placeholder = "enter",
    Callback    = function(text: string) end,
})

local UtilsSection = MiscTab:Section({ Name = "Utilities", Side = "Right" })

UtilsSection:Label({ Name = "Notification Test" })

UtilsSection:Button({
    Name     = "Send Notification",
    Callback = function()
        UILibNotifications:Create({
            Name     = "test",
            LifeTime = 3,
        })
    end,
})

UtilsSection:Button({
    Name     = "Print Compat Table",
    Callback = function()
        -- self expl
        for name, supported in Library.Compat do
            print(("[Compat] %-40s = %s"):format(name, tostring(supported)))
        end
    end,
})

UtilsSection:Toggle({
    Name     = "Debug Mode",
    Flag     = "DebugMode",
    Default  = false,
    Callback = function(v: boolean)
        getgenv()._debug = v
    end,
})

Library:Configs(Window)
