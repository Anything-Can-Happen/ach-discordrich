config = {}
config.update = 2500 -- Time to update in MS (I recommend 5000)
config.mph = true -- set to false to make it KPH
config.fps = true -- show client's fps? set to false to disable
config.showstate = true -- show what the client is currently doing, wheather it be shooting, swimming, flying, etc.

--This is where you put your DiscordAppID you can get it from here https://discord.com/developers/applications
config.DiscordAppID = 653188008882864148 

config.ImageLink = 'monke'
config.hoverText = 'Monke'
config.richPresenceText = "" ..GetPlayerServerId(PlayerId()).. " | " .. #GetActivePlayers() .. " Players"
config.smallDiscordImageName = 'monke'
config.smallHoverText = 'Monke'

config.button1on = true -- set to false to disable button 1

config.button1 = {
    text = 'Help a Monke!!!',
    url = 'https://www.youtube.com/watch?v=2OCeMSMACEo'
}

config.button2on = true -- set to false to disable button 2

config.button2 = {
    text = 'How to become monke',
    url = 'https://www.youtube.com/watch?v=7jE55zkCPI0'
}
-- you can only have 2 buttons
