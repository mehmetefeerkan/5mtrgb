Config = {}
Config.API = "http://fivemturk.perdition.xyz/global/v1/verifyUser" --Bir bilgi geçilene kadar lütfen bu satırı değiştirmeyiniz.

Config.Strings = {}
Config.Settings = {}
Config.Strings.bannedMatch = '{"banned":true}' --Bir bilgi geçilene kadar lütfen bu satırı değiştirmeyiniz.
Config.Strings.passedMatch = '{"banned":false}' --Bir bilgi geçilene kadar lütfen bu satırı değiştirmeyiniz.
Config.Strings.strictModeRejection = "Şu an için sunucuya yapılan girişlerin doğrulanmasıyla alakalı bir sorun mevcut. Lütfen daha sonra tekrar deneyiniz." -- Ana sunucularımıza ulaşılamaması
    --durumunda oyuncuya gösterilecek satır (EĞER STRICT MODE AÇIKSA)
Config.Strings.standardRejection = "[m3-admin] sunucumuzdan kalıcı olarak yasaklanmış bulunuyorsunuz." --Oyuncu global banlist'te bulunuyorsa göreceği mesajdır.

Config.Settings.strictMode = false

Config.snooperMode = true -- Bu opsiyonu true iken, bir oyuncunun global sorgusunun gerçekleştirilmesi için ana suncularımıza atan isteklerle sunucunuzun ismi gibi zararsız bilgiler de iletilecektir.
-- Bu, sistem ve kullanıcılarımızla alakalı sağlıklı analizler yürütmemize yardımcı olur.
Config.playerRejectedWebhook = "" -- Girişine müsaade edilmemiş oyuncuların logunun düşeceği webhook
Config.standardWebhook = "" -- Girişine müsaade edilmemiş oyuncuların logunun düşeceği webhook

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
]]
