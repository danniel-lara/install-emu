#!/bin/bash
yad --center --width=400 --height=100 --title= "AVISO" \  --text="Execute usando o comando  ' sudo ' \ 
ou o logado com usuário ' root ' para executar este software! "  --button=gtk-ok:0
exit 1
fi

INSTALL=$(yad --center --form --width=400 --height=500 --title "Instalar Emuladores, Jogos e Steam" \
 --field "Atari:CHK" \
 --field "Nes:CHK" \
 --field "Master Sytem - GameGear:CHK" \
 --field "MegaDriver - 32X - SegaCD:CHK" \
 --field "SuperNes:CHK" \
 --field "GameBoy, GameBoy-Color, GameBoy-Advance:CHK" \
 --field "N64:CHK" \
 --field "PS1:CHK" \
 --field "PS2:CHK" \
 --field "PSP:CHK" \
 --field "Sega Saturn:CHK" \
 --field "Dreamcast:CHK" \
 --field "Wii , GameGube:CHK" \
 --field "Arcade M.A.M.E:CHK" \
 --field "Steam:CHK" \
 --field "Fedora Games:CHK" \
 ""); 
echo "$INSTALL" > /tmp/tmp
 STELLA=$(cat /tmp/tmp | awk 'BEGIN { FS="|" } { print $1 }' )
 NES=$(cat /tmp/tmp | awk 'BEGIN { FS="|" } { print $2 }' )
 MASTER=$(cat /tmp/tmp | awk 'BEGIN { FS="|" } { print $3 }' )
 MEGA=$(cat /tmp/tmp | awk 'BEGIN { FS="|" } { print $4 }' )
 SNES=$(cat /tmp/tmp | awk 'BEGIN { FS="|" } { print $5 }' )
 GAMEBOY=$(cat /tmp/tmp | awk 'BEGIN { FS="|" } { print $6 }' )
 N64=$(cat /tmp/tmp | awk 'BEGIN { FS="|" } { print $7 }' )
 PS1=$(cat /tmp/tmp | awk 'BEGIN { FS="|" } { print $8 }' )
 PS2=$(cat /tmp/tmp | awk 'BEGIN { FS="|" } { print $9 }' )
 PSP=$(cat /tmp/tmp | awk 'BEGIN { FS="|" } { print $10 }' )
 SATURN=$(cat /tmp/tmp | awk 'BEGIN { FS="|" } { print $11 }' )
 DREAM=$(cat /tmp/tmp | awk 'BEGIN { FS="|" } { print $12 }' )
 WII=$(cat /tmp/tmp | awk 'BEGIN { FS="|" } { print $13 }' )
 MAME=$(cat /tmp/tmp | awk 'BEGIN { FS="|" } { print $14 }' )
 STEAM=$(cat /tmp/tmp | awk 'BEGIN { FS="|" } { print $15 }' )
 FG=$(cat /tmp/tmp | awk 'BEGIN { FS="|" } { print $16 }' )

 if [ "$STELLA" = "TRUE" ]; then
    dnf install stella -y
fi

 if [ "$NES" = "TRUE" ]; then
    dnf install Nestopia -y
fi

 if [ "$NES" = "TRUE" ]; then
    dnf install osmose -y
fi

 if  [ "$MEGA" = "TRUE" ]; then
    dnf install gens -y
fi

 if [ "$SNES" = "TRUE" ]; then
    dnf install snes9x -y
fi

 if [ "$GAMEBOY" = "TRUE" ]; then
    dnf install vbam-gtk -y
fi
   if [ "$N64" = "TRUE" ]; then
    dnf install mupen64plus m64py -y
fi

if [ "$PS1" = "TRUE" ]; then
    dnf install pcsxr -y
fi

 if [ "$PS2" = "TRUE" ]; then
    dnf install pcsx2 -y
fi

 if [ "$PSP" = "TRUE" ]; then
    dnf install ppsspp-dev -y
fi

 if [ "$SATURN" = "TRUE" ]; then
    dnf install yabause -y
fi

 if [ "$DREAM" = "TRUE" ]; then
    dnf install lxdream -y
fi

 if [ "$WII" = "TRUE" ]; then
    dnf install dolphin-emu-git -y
fi

 if [ "$MAME" = "TRUE" ]; then
    dnf install mame qmc2-sdlmame -y
fi
 
 if [ "$STEAM" = "TRUE" ]; then
    dnf install steam -y
fi

  if [ "$FG" = "TRUE" ]; then
    dnf groupinstall "Games and Entertainment" -y

 else 
  echo "erro"
fi
