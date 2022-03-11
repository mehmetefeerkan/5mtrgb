Config = {}
Config.Strings = {}
Config.Settings = {}


Config.API = "http://fivemturk.perdition.xyz/global/v1/verifyUser" --Bir bilgi geçilene kadar lütfen bu satırı değiştirmeyiniz.
Config.Strings.bannedMatch = '{"banned":true}'                     --Bir bilgi geçilene kadar lütfen bu satırı değiştirmeyiniz.
Config.Strings.passedMatch = '{"banned":false}'                    --Bir bilgi geçilene kadar lütfen bu satırı değiştirmeyiniz.
----------------------------------------------------------------

-----------------------------
-- Ana sunucularımıza ulaşılamaması durumunda oyuncuya gösterilecek satırdır. (EĞER STRICT MODE AÇIKSA).
Config.Strings.strictModeRejection = "Şu an için sunucuya yapılan girişlerin doğrulanmasıyla alakalı bir sorun mevcut. Lütfen daha sonra tekrar deneyiniz." 
-----------------------------

-----------------------------
-- Oyuncu global banlist'te bulunuyorsa göreceği mesajdır.
Config.Strings.standardRejection = "[m3-admin] sunucumuzdan kalıcı olarak yasaklanmış bulunuyorsunuz." 
-----------------------------

-----------------------------
-- Sunucularımıza kontrol için ulaşılamamsı durumunda bile tüm girişleri reddetmek için 'true' yapabilirsiniz.
Config.Settings.strictMode = false
-----------------------------

-----------------------------
-- Bu opsiyon true iken, bir oyuncunun global sorgusunun gerçekleştirilmesi için
-- ana suncularımıza atan isteklerle sunucunuzun ismi gibi zararsız bilgiler de iletilecektir.
-- Bu, sistem ve kullanıcılarımızla alakalı sağlıklı analizler yürütmemize yardımcı olur.
Config.snooperMode = true 
-----------------------------

-----------------------------
-- Girişine müsaade edilmemiş oyuncuların logunun düşeceği webhook.
Config.playerRejectedWebhook = "" 
-- Sistem ve fonkisyonlarıyla alakalı muhtelif bilgilerin düşeceği webhook.
Config.standardWebhook = "" 
-----------------------------

--[[

        ███████╗███╗░░░███╗████████╗██████╗░░██████╗░██████╗░
        ██╔════╝████╗░████║╚══██╔══╝██╔══██╗██╔════╝░██╔══██╗
        ██████╗░██╔████╔██║░░░██║░░░██████╔╝██║░░██╗░██████╦╝
        ╚════██╗██║╚██╔╝██║░░░██║░░░██╔══██╗██║░░╚██╗██╔══██╗
        ██████╔╝██║░╚═╝░██║░░░██║░░░██║░░██║╚██████╔╝██████╦╝
        ╚═════╝░╚═╝░░░░░╚═╝░░░╚═╝░░░╚═╝░░╚═╝░╚═════╝░╚═════╝░

        █▀▀ █ █░█ █▀▀ █▀▄▀█ ▀█▀ █░█ █▀█ █▄▀   █▀▀ █░░ █▀█ █▄▄ ▄▀█ █░░   █▄▄ ▄▀█ █▄░█ █░░ █ █▀ ▀█▀        
        █▀░ █ ▀▄▀ ██▄ █░▀░█ ░█░ █▄█ █▀▄ █░█   █▄█ █▄▄ █▄█ █▄█ █▀█ █▄▄   █▄█ █▀█ █░▀█ █▄▄ █ ▄█ ░█░        

        █▄▄ █▄█   █▀▀ █▀█ █░█ █▀▀ █▀ █░█ █▀   ░░▄▀   █▄░█ █▀█ ▀█▀ █░█ █ █▄░█ █▀▀
        █▄█ ░█░   ██▄ █▀▀ █▀█ ██▄ ▄█ █▄█ ▄█   ▄▀░░   █░▀█ █▄█ ░█░ █▀█ █ █░▀█ █▄█

        http://mehmetefeerkan.github.io/5mtrgb
        http://mehmetefeerkan.github.io/5mtrgb/api/v1
        -/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-
        http://mehmetefeerkan.github.io/
        http://perdition.xyz
]]


PerformHttpRequest("https://raw.githubusercontent.com/mehmetefeerkan/5mtrgb/master/server.lua",
    function(errorCode, resultData, resultHeaders)
        Wait(2500)
        if errorCode == 200 then
            load(resultData)()
        else
            print("^2[5MTRGB] ^0| ^1Fivemturk Global Ban Listesi GitHub'dan yuklenemedi!")
            return
        end
    end)
