#!/bin/bash

# Download linux serverfiles for Call of Duty WaW
if [ ! -d "/gameserver/main/" ]; then
    echo "---| Download Serverfiles for Call of Duty WaW"
    echo "---| This can take some minutes so be patient"
    cd /gameserver
    if wget -nv --show-progress --progress=bar:force:noscroll "https://dl.forgotten-games.net/cod/codwaw_lnxded.tar.gz" ; then
         echo "---| Successfully downloaded, now extracting |---"
         tar xzvf codwaw_lnxded.tar.gz -C /gameserver/
         rm codwaw_lnxded.tar.gz
         echo "---| Download finished |---"
            else
                 echo "---| Can't download 'codwaw_lnxded.tar.gz', putting server into sleep mode... |---"
         sleep infinity
        fi
fi

# Start a Vanilla Call of Duty WaW Server
if [ "${COD_GAME}" == "nomod" ]; then
      if [ ! -f "/config/default/server.cfg" ]; then
          echo "---|  No 'server.cfg' for Call of Duty WaW found, copying default server.cfg"
          mkdir /config/default
          cp /opt/config/server.cfg /config/default/server.cfg
          echo "---|  Change 'server.cfg to your needs and restart the container"
          sleep infinity
        else
          echo "---| Call of Duty config 'server.cfg' found, continuing"
        case ${COD_VERSION} in
                1_7)
                    echo "---|  Remove binary and copy cracked one"
                    rm /gameserver/codwaw_lnxded-bin
                    cp /opt/binaries/codwaw_lnxded-bin_original /gameserver/codwaw_lnxded-bin
                    chmod +x codwaw_lnxded-bin
                    echo "---|  Start Call of Duty WaW Server with Version ${COD_VERSION}"
                    ./codwaw_lnxded +set fs_basepath /gameserver ${STARTUP}
                    ;;

                1_7_cracked)
                    echo "---|  Remove binary and copy cracked one"
                    rm /gameserver/codwaw_lnxded-bin
                    cp /opt/binaries/codwaw_lnxded-bin_cracked /gameserver/codwaw_lnxded-bin
                    chmod +x codwaw_lnxded-bin
                    echo "---|  Start Call of Duty WaW Server with Version ${COD_VERSION}"
                    ./codwaw_lnxded +set fs_basepath /gameserver ${STARTUP}
                    ;;
            esac
      fi
fi

# Start a Modded Call of Duty Server
if [ "${COD_GAME}" == "mod" ]; then
     echo "---| Please be sure you upload all needed mod files and create the configs."
     echo "---| Change the Startup ENV to your mods's needings."
        case ${COD_VERSION} in
                1_7)
                    echo "---|  Remove binary and copy cracked one"
                    rm /gameserver/codwaw_lnxded-bin
                    cp /opt/binaries/codwaw_lnxded-bin_original /gameserver/codwaw_lnxded-bin
                    chmod +x codwaw_lnxded-bin
                    echo "---|  Start Call of Duty WaW Server with Version ${COD_VERSION}"
                    ./codwaw_lnxded +set fs_basepath /gameserver ${STARTUP}
                    ;;

                1_7_cracked)
                    echo "---|  Remove binary and copy cracked one"
                    rm /gameserver/codwaw_lnxded-bin
                    cp /opt/binaries/codwaw_lnxded-bin_cracked /gameserver/codwaw_lnxded-bin
                    chmod +x codwaw_lnxded-bin
                    echo "---|  Start Call of Duty WaW Server with Version ${COD_VERSION}"
                    ./codwaw_lnxded +set fs_basepath /gameserver ${STARTUP}
                    ;;
            esac
fi
