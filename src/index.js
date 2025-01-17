require('dotenv').config();
const { Client, GatewayIntentBits } = require('discord.js');

// Initialize the bot client
const client = new Client({ intents: [GatewayIntentBits.Guilds] });

client.once('ready', () => {
    console.log(`Bot is online as ${client.user.tag}`);
});

client.login(process.env.TOKEN);
