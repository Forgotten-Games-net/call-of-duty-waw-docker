# Call of Duty 5 - World at War Docker Image!

Here you get a Docker Image for the Game Call of Duty 5 - World at War. You can host easily multiple gameserver instances with one gamedir! 

![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/keinnerd/codwawdocker?style=flat-square) ![Docker Pulls](https://img.shields.io/docker/pulls/keinnerd/codwawdocker?style=flat-square)

## 📦 What you get
 - Well documented Game Configurations
 - Multiple Versions (`1.7`, `1.7 Cracked`)
 - Multiple Server with one install
 - Download latest Serverfiles
 - Easy Mod Support

| :warning: ATTENTION: IF YOU BUY THE GAME ON STEAM AND HAVE THE ONLINE PROFILE CREATION PROBLEM, TRY TO BUY A RETAIL KEY OR USE [PLUTONIUM T4!](https://github.com/Forgotten-Games-net/call-of-duty-wawt4-docker) :warning:|
| --- |

## 🚀 How to start
For a fast start simply 
```
    docker create \
      --name codwawdocker \
      -p 28965:28965 \
      -p 28965:28965/udp \
      -v <your/path/to/game/>:/gameserver \
      -v <your/path/to/game/>:/config \
      -e COD_VERSION="1_7" \
      -e COD_GAME="nomod" \
      -e STARTUP="+set fs_homepath config/default +set fs_localAppData config/default +set dedicated 2 +set net_ip 0.0.0.0 +set net_port "28965" +exec server.cfg +map_rotate" \
    keinnerd/codwawdocker:latest
```
Then Check the `server.cfg` in the `config/default` dir. 




## 🔧 Envs

|Env             |Options                       |Description                         |
|----------------|-------------------------------|-----------------------------|
|COD_VERSION     | Basic: `1_7` or `1.7 Cracked` | Choose your Game Version|
|COD_GAME        | `nomod` or `mod` |`nomod` = Call of Duty WaW Vanilla / `mod` = Call of Duty WaW with Mod Options|
|STARTUP         | "`+set fs_homepath config/default +set fs_localAppData config/default +set dedicated 2 +set net_ip 0.0.0.0 +set net_port "28965" +exec server.cfg +map_rotate`" | Adjust your Start command (fs_basepath is hardcoded to /gameserver)

Hint: if you use the `mod` ENV you must adjust the Startup Comand and have to add `+set fs_game mods/yourmod`

## 📁 Multiple Servers

If you want to host multiple servers, create a new container then create inside your config folder different dirs and change `+set fs_homepath config/default` to `config/server2` the next to `config/server3`. Create Configs or copy the config from `default` Server inside the dirs and spin up the container. 

```
── /config
 ├──> server1 (e.g call of duty 5 ranked)
 ├──────> ranked/server.cfg
 ├──> server2 (e.g call of duty 5 unranked)
 ├──────> unranked/server.cfg
 ├──> server3 (e.g Modded Server)
 └──────> yourmod/server.cfg & yourmod/mod.cfg or mod.cfg
```

Open needed Ports in your firewall! Default Ports: 28965/tcp 28965/udp

## 👾 Mods

If you want to play a Modification you need to upload your mod in the `gamedir` and adjust some ENV's

- Change `COD_GAME` to `mod`
- Change `COD_VERSION` to your needed Version
- Change `STARTUP` to ` +set fs_game mods/YOURMOD +set fs_homepath config/YOURMOD/ +set fs_localAppData config/YOURMOD +set dedicated 2 +set net_ip 0.0.0.0 +set net_port "28965" +exec YOURMOD.cfg +map_rotate`


## 📝 ToDo

- nothing today

## 👐 Contribution

Feel free to fork and make pull requests. This are my first attempts with creating docker images so please give me feedback. 
