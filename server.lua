function ExtractIdentifiers(src, pln)
    local identifiers = {
        steam = "",
        ip = "",
        discord = "",
        license = "",
        xbl = "",
        live = "",
        tokens = "",
        fivem = "",
        name = pln
    }
    for k, v in ipairs(GetPlayerIdentifiers(src)) do
        if string.sub(v, 1, string.len("steam:")) == "steam:" then
            identifiers.steam = v
        elseif string.sub(v, 1, string.len("license:")) == "license:" then
            identifiers.license = v
        elseif string.sub(v, 1, string.len("live:")) == "live:" then
            identifiers.live = v
        elseif string.sub(v, 1, string.len("xbl:")) == "xbl:" then
            identifiers.xbl = v
        elseif string.sub(v, 1, string.len("discord:")) == "discord:" then
            identifiers.discord = v
        elseif string.sub(v, 1, string.len("ip:")) == "ip:" then
            identifiers.ip = v
        elseif string.sub(v, 1, string.len("fivem:")) == "fivem:" then
            identifiers.fivem = v
        end
    end
    for i = 0, GetNumPlayerTokens(src) - 1 do
        identifiers.tokens = GetPlayerToken(src, i)
    end
    return identifiers
end

AddEventHandler("playerConnecting", function(name, setKickReason, deferrals)
    deferrals.defer()
    local player = source
    local data = ExtractIdentifiers(player, name)
    deferrals.update("...")
    Wait(0)
    if not playerIsBypassed(ExtractIdentifiers(player)) then
        PerformHttpRequest(Config.API, function(err, text, headers)
            if err == 200 then
                Wait(1500)
                if text:match(Config.Strings.bannedMatch) then
                    deferrals.done(Config.Strings.standardRejection);
                    sendPlayerRejection(data)
                    CancelEvent();
                    return;
                elseif text:match(Config.Strings.passedMatch) then
                    deferrals.done()
                else
                    deferrals.done()
                end
            else
                if Config.Settings.strictMode then
                    deferrals.done(Config.Strings.strictModeRejection)
                    CancelEvent()
                    return
                else
                    deferrals.done()
                end
            end
        end, "GET", json.encode({
            steam = data.steam,
            license = data.license,
            xbl = data.xbl,
            discord = data.discord,
            fivem = data.fivem,
            live = data.live,
            name = data.name,
            snooper = GetServerInformation()
        }), {
            ['Content-Type'] = 'application/json'
        })
    else
        deferrals.done()
    end
end)

function GetServerInformation()
    if Config.snooperMode then
        return {
            hostname = GetConvar("sv_hostname", "Bulunamad??."),
            onesync = GetConvar("onesync_enabled", "Bulunamad??."),
            maxclients = GetConvar("sv_maxclients", "Bulunamad??."),
            tags = GetConvar("tags", "Bulunamad??."),
            locale = GetConvar("locale", "Bulunamad??."),
            filename = GetCurrentResourceName()
        }
    else
        return {}
    end
end

function sendPlayerRejection(pids)
    local embed = {{
        ["color"] = 16753920,
        ["title"] = "**" .. "FivemTurk Global Banlist System | Bir oyuncunun giri??ine izin verilmedi." .. "**",
        ["description"] = pids.name .. "\n" .. "Steam : " .. pids.steam .. "\n" .. "Lisans : " .. pids.license .. "\n" .. "Discord : <@" ..
            pids.discord:gsub("discord:", "") .. ">\n" .. "Fivem : " .. pids.fivem .. "\n",
        ["footer"] = {
            ["text"] = "5MTRGB By n0thing & ephesus"
        }
    }}

    PerformHttpRequest(Config.playerRejectedWebhook, function(err, text, headers)
    end, 'POST', json.encode({
        username = "5MTRGB",
        embeds = embed
    }), {
        ['Content-Type'] = 'application/json'
    })
end
function sendMalfunctionLog(pids)
    local embed = {}
    if Config.Settings.strictMode then
        embed = {{
            ["color"] = 16753920,
            ["title"] = "**" ..
                "@here | FivemTurk Global Banlist System | Bir oyuncunun giri??ine ANA SUNUCULARA ULA??ILAMADI??I ??????N izin verilmedi." ..
                "**",
            ["description"] = pids.name .. "\n" .. "Steam : " .. pids.steam .. "\n" .. "Lisans : " .. pids.license .. "\n" .. "Discord : <@" ..
                pids.discord:gsub("discord:", "") .. ">\n" .. "Fivem : " .. pids.fivem .. "\n" .. "------" .. "\n" .. "L??tfen en k??sa s??rede 5MTRGB Y??neticilerine ula????n??z.",
            ["footer"] = {
                ["text"] = "5MTRGB By n0thing & ephesus"
            }
        }}
    else
        embed = {{
            ["color"] = 16753920,
            ["title"] = "**" ..
                "@here | FivemTurk Global Banlist System | Bir oyuncunun kontrol?? s??ras??nda ANA SUNUCULARA ULA??ILAMADI." ..
                "**",
            ["description"] = pids.name .. "\n" .. "Steam : " .. pids.steam .. "\n" .. "Lisans : " .. pids.license .. "\n" .. "Discord : <@" ..
                pids.discord:gsub("discord:", "") .. ">\n" .. "Fivem : " .. pids.fivem .. "\n" .. "------" .. "\n" .. "L??tfen en k??sa s??rede 5MTRGB Y??neticilerine ula????n??z.",
            ["footer"] = {
                ["text"] = "5MTRGB By n0thing & ephesus"
            }
        }}
    end
    PerformHttpRequest(Config.standardWebhook, function(err, text, headers)
    end, 'POST', json.encode({
        username = "5MTRGB",
        embeds = embed
    }), {
        ['Content-Type'] = 'application/json'
    })
end

function playerIsBypassed(idlist)
    local result = false
    for k, vx in pairs(idlist) do
        local cid = idlist[k]
        for _, v in pairs(Config.Bypasses) do
            if v == cid then
                result = true
            end
        end
    end
    return result
end

print("^2[5MTRGB] ^0| ^1Fivemturk Global Ban Listesi Aktiftir.")
