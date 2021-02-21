#!/usr/bin/env bash

#  ██▓ ███▄    █   ██████ ▄▄▄█████▓ ▄▄▄       ██▓     ██▓
# ▓██▒ ██ ▀█   █ ▒██    ▒ ▓  ██▒ ▓▒▒████▄    ▓██▒    ▓██▒
# ▒██▒▓██  ▀█ ██▒░ ▓██▄   ▒ ▓██░ ▒░▒██  ▀█▄  ▒██░    ▒██░
# ░██░▓██▒  ▐▌██▒  ▒   ██▒░ ▓██▓ ░ ░██▄▄▄▄██ ▒██░    ▒██░
# ░██░▒██░   ▓██░▒██████▒▒  ▒██▒ ░  ▓█   ▓██▒░██████▒░██████▒
# ░▓  ░ ▒░   ▒ ▒ ▒ ▒▓▒ ▒ ░  ▒ ░░    ▒▒   ▓▒█░░ ▒░▓  ░░ ▒░▓  ░
#  ▒ ░░ ░░   ░ ▒░░ ░▒  ░ ░    ░      ▒   ▒▒ ░░ ░ ▒  ░░ ░ ▒  ░
#  ▒ ░   ░   ░ ░ ░  ░  ░    ░        ░   ▒     ░ ░     ░ ░
#  ░           ░       ░                 ░  ░    ░  ░    ░  ░


# ----------------------------- VARIÁVEIS ------------------------------ #
MSG=""
PACOTES_PARA_INSTALAR=()
PACOTES_PARA_REMOVER=()
# ---------------------------------------------------------------------- #


# ------------------------------ FUNÇÕES ------------------------------- #
PrintMsg()
{
   echo "### $MSG"
   MSG=""
}

InstalarPacote()
{
   for nome_do_pacote in ${PACOTES_PARA_INSTALAR[@]}; do
      if ! dpkg -l | grep -q $nome_do_pacote; then
         sudo apt install "$nome_do_pacote" -y
      else
         MSG="[INSTALADO] - $nome_do_pacote"
         PrintMsg
      fi
   done
   PACOTES_PARA_INSTALAR=()
}

RemoverPacote()
{
   for nome_do_pacote in ${PACOTES_PARA_REMOVER[@]}; do
      if dpkg -l | grep -q $nome_do_pacote; then
         sudo apt purge "$nome_do_pacote" -y
      else
         MSG="[NÃO INSTALADO] - $nome_do_pacote"
         PrintMsg
      fi
   done
   PACOTES_PARA_REMOVER=()
}
# ---------------------------------------------------------------------- #


# ----------------------------- EXECUÇÃO ------------------------------- #
## Atualizando os repositórios ##
MSG="Atualizando repositórios"
PrintMsg
sudo apt update -y


# Pacotes Gerais
MSG="Instalando pacotes gerais"
PrintMsg
PACOTES_PARA_INSTALAR=(
   intel-microcode
   firmware-iwlwifi
   xstow
   xorg
   bspwm
   sxhkd
   fish
   rofi
   mousepad
   nnn
   jq
   file
   fzf
   trash-cli
   hsetroot
   viewnior
   gtk2-engines-murrine
   gnome-themes-standard
   atool
   rar
   zip
   unar
   plzip
   p7zip-rar
   mpv
   zathura
   picom
   flameshot
   tlp
   light
   dbus-x11
   dunst
   alsa-utils
   pulseaudio
   binutils
   fonts-noto-color-emoji
   fonts-font-awesome
   i965-va-driver-shaders
   intel-media-va-driver-non-free
)
InstalarPacote


# Pacotes para Desenvolvimento
MSG="Instalando pacotes para desenvolvimento"
PrintMsg
PACOTES_PARA_INSTALAR=(
   git
   nodejs
   npm
)
InstalarPacote


# Removendo pacotes
MSG="Removendo pacotes"
PrintMsg
PACOTES_PARA_REMOVER=(
   lemonbar
   vlc
   system-config-printer
   xserver-xorg-video-all
   xserver-xorg-video-intel
   xserver-xorg-video-nouveau
   xserver-xorg-video-qxl
   xserver-xorg-video-radeon
   xserver-xorg-video-vesa
   xserver-xorg-video-vmware
)
RemoverPacote


# --------------------------- PÓS-INSTALAÇÃO --------------------------- #
## Finalização e limpeza
sudo apt autoclean
sudo apt autoremove -y
MSG="Script finalizado"
PrintMsg
MSG="Recomenda-se que o computador seja reiniciado"
PrintMsg
# ---------------------------------------------------------------------- #
