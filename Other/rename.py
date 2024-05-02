import os
import requests
from zipfile import ZipFile

# Function to download image from URL and save with given filename
def download_image(url, filename):
    response = requests.get(url)
    if response.status_code == 200:
        with open(filename, 'wb') as f:
            f.write(response.content)
        print(f"Downloaded: {filename}")
    else:
        print(f"Failed to download: {filename}")

# List of image URLs and their respective filenames
image_urls = [
    ("https://cdn.discordapp.com/emojis/963333541112987668.png", "success.png"),
    ("https://cdn.discordapp.com/emojis/963333541226217472.png", "error.png"),
    ("https://cdn.discordapp.com/emojis/963333542442590268.gif", "giveaway.gif"),
    ("https://cdn.discordapp.com/emojis/963333540630646804.png", "discord_logo.png"),
    ("https://cdn.discordapp.com/emojis/963333541305925692.png", "member.png"),
    ("https://cdn.discordapp.com/emojis/963333540244758578.png", "channel.png"),
    ("https://cdn.discordapp.com/emojis/963333541142339605.png", "role.png"),
    ("https://cdn.discordapp.com/emojis/963333542199324692.png", "stage_channel.png"),
    ("https://cdn.discordapp.com/emojis/963333541561790474.png", "rules_channel.png"),
    ("https://cdn.discordapp.com/emojis/963333480899567646.gif", "boosts_animated.gif"),
    ("https://cdn.discordapp.com/emojis/963333479129550889.gif", "discord_badges.gif"),
    ("https://cdn.discordapp.com/emojis/963333541888929842.png", "status_online.png"),
    ("https://cdn.discordapp.com/emojis/963333541846986782.png", "status_idle.png"),
    ("https://cdn.discordapp.com/emojis/844882506587176960.png", "status_dnd.png"),
    ("https://cdn.discordapp.com/emojis/963333542383869952.png", "status_offline.png"),
    ("https://cdn.discordapp.com/emojis/963333540374781972.png", "cpu_icon.png"),
    ("https://cdn.discordapp.com/emojis/963333540844564540.png", "drive_icon.png"),
    ("https://cdn.discordapp.com/emojis/963333541616304128.png", "ram_icon.png"),
    ("https://cdn.discordapp.com/emojis/963333540739694602.png", "discord_partner.png"),
    ("https://cdn.discordapp.com/emojis/856161806199947285.png", "owner_crown.png"),
    ("https://cdn.discordapp.com/emojis/963333479184076810.png", "emoji_bar_1.png"),
    ("https://cdn.discordapp.com/emojis/963333479322517534.png", "emoji_bar_2.png"),
    ("https://cdn.discordapp.com/emojis/963333478982754375.png", "bot_badge_part_1.png"),
    ("https://cdn.discordapp.com/emojis/963333479301545984.png", "bot_badge_part_2.png"),
    ("https://cdn.discordapp.com/emojis/963333541507264512.png", "pikachu.png"),
    ("https://cdn.discordapp.com/emojis/963333542065090630.gif", "loading.gif"),
    ("https://cdn.discordapp.com/emojis/963333540962009168.png", "hypesquad.png"),
    ("https://cdn.discordapp.com/emojis/963333540546752544.png", "hypesquad_balance.png"),
    ("https://cdn.discordapp.com/emojis/963333540840353882.png", "hypesquad_bravery.png"),
    ("https://cdn.discordapp.com/emojis/963333541104586802.png", "hypesquad_brilliance.png"),
    ("https://cdn.discordapp.com/emojis/963333540429303828.png", "verified_bot_developer.png"),
    ("https://cdn.discordapp.com/emojis/963333540844552252.png", "early_supporter.png"),
    ("https://cdn.discordapp.com/emojis/963333479452508190.png", "bug_hunter_1.png"),
    ("https://cdn.discordapp.com/emojis/963333479578357830.png", "bug_hunter_2.png"),
    ("https://cdn.discordapp.com/emojis/963333540756455444.png", "discord_employee.png"),
    ("https://cdn.discordapp.com/emojis/963333541565968384.png", "slash_commands.png"),
    ("https://cdn.discordapp.com/emojis/963333541259792384.png", "mention.png"),
    ("https://cdn.discordapp.com/emojis/963333541716963348.png", "settings.png")
]

# Create a directory to store downloaded images
if not os.path.exists('downloaded_images'):
    os.makedirs('downloaded_images')

# Iterate over each image URL and download
for url, filename in image_urls:
    download_image(url, os.path.join('downloaded_images', filename))

# Create a zip file to store the downloaded images
with ZipFile('downloaded_images.zip', 'w') as zipf:
    # Iterate over downloaded images and add them to the zip file
    for root, dirs, files in os.walk('downloaded_images'):
        for file in files:
            filepath = os.path.join(root, file)
            zipf.write(filepath, arcname=file)

print("All images have been downloaded and compressed into downloaded_images.zip")
