# CrashN't
A Discord bot to help mitigate the ongoing problem of "crash gifs"

##### *Disclaimer*
*This software is NOT a solution for crash gifs, it is merely a tool to help combat the problem. It does not claim to catch every single crash gif, and should not be used autonomously. It should be used in conjunction with a fully capable moderation team to handle any disputes that arise. The creator of this bot and its code are not responsible for any false positives or negatives.* Additional disclaimed terms available in license.

## Introduction
There has been an ongoing issue on Discord of users sending so-called "crash gifs" into channels of a server that cause their client to crash or restart. Crash gifs are a nuisance for anyone that happens to go into that channel, and the transmission of this content is against Discord Terms of Service:

> RULES OF CONDUCT AND USAGE  
> [...] upload or transmit (or attempt to upload or transmit) files that contain viruses, Trojan horses, worms, time bombs, cancelbots, **corrupted files or data, or any other similar software or programs or engage in any other activity that may damage the operation of the Service or other users' computers**;

These "crash gifs" are actually corrupted .mp4 files, so crash "gif" is kind of a misnomer, and they only got their name because the Discord client labels all autoplaying content with a "Gif" icon. These corrupted videos typically change colorspace or greatly increase their resolution midway through the video, resulting in the underlying framework of the Discord client crashing. This bot aims to detect most crash gifs, and kick those who send them. If you find an undetectable crash gif that is sufficiently popular, please feel free to submit an issue or pull request and I can look into adding it to the bot.

## Requirements
*(This has only been tested on Linux, use other operating systems at your own risk)*
- Python 3
- ffmpeg (`sudo apt install ffmpeg`, or whatever other package manager you have)
- discord.py module (`pip3 install discord.py`)
- requests module (`pip3 install requests`)

## Installation
This bot must be *self-hosted*. Due to the nature of crash gifs, it takes up a lot of memory to parse them. Thus, I cannot offer a service in which you just add the bot to your server. Fortunately, it is easy enough to set up:

1) Create a New Application through the [Discord Developer Portal](https://discord.com/developers/applications)
2) Save the "Application ID" on the General Information tab
3) Click on the bot tab of the new application and Add Bot
4) Click "Reveal Token" and save that.
5) Download/clone this repo
6) Add a file called "owner.txt" that contains your Discord ID (*not* username, this is the 18-digit numeric ID. Search how to enable Developer Mode to find this) on one line.
7) Add a file called "channels.txt" that contains a list of Channel IDs (again, 18-digit IDs) you wish to watch on each line
8) Add a file called "token.txt" that contains the token found in step 4 on one line
9) Run `./start.sh` to run the bot

## Functionality
If a video sent by anyone is detected in any of the watched channels, one of the following things will happen:
1) Nothing; video was parsed find and was deemed legitimate.
2) "Crash gif detected": An anomaly in the video was detected, the message will be deleted, and the user will be kicked
3) "*Possible* crash gif detected": The parser ran out of memory, the message will only be deleted, and the person running the bot (you) will be pinged. The user will not be kicked automatically, because there could be a legitimate reason for running out of memory, but 99% of the time it's likely just a crash gif. You can investigate on your own and kick them, but you likely need to add more memory to your system so that it will continue to auto-kick.

_____
*Thank you to u/PSOwAIDA on Reddit for providing some methods to help detect them!*
