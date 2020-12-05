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
#sudo rm /var/lib/dpkg/lock-frontend
#sudo rm /var/cache/apt/archives/lock

## Atualizando os repositórios ##
MSG="Atualizando repositórios"
PrintMsg
sudo apt update -y

# Pacotes Gerais
MSG="Instalando pacotes gerais"
PrintMsg
PACOTES_PARA_INSTALAR=(
   firmware-linux-nonfree
   firmware-iwlwifi
   network-manager
   xstow
   xorg
   bspwm
   sxhkd
   rofi
   zsh
   zplug
   jq
   hsetroot
   thunar
   viewnior
   xarchiver
   rar
   zip
   unar
   plzip
   ncompress
   p7zip-rar
   mpv
   obs-studio
   chromium
   chromium-l10n
   zathura
   picom
   flameshot
   tlp
   light
   dbus-x11
   dunst
   libglib2.0-bin
   alsa-utils
   binutils
   fonts-font-awesome
   i965-va-driver-shaders
   intel-media-va-driver-non-free
)
InstalarPacote

# Pacotes para Estudo
MSG="Instalando pacotes para estudo"
PrintMsg
PACOTES_PARA_INSTALAR=(
   octave
   scilab
)
InstalarPacote

# Pacotes para Desenvolvimento
MSG="Instalando pacotes para desenvolvimento"
PrintMsg
PACOTES_PARA_INSTALAR=(
   docker
   docker-compose
   git
   nodejs
   npm
   telegram-desktop
)
InstalarPacote

# Habilitar serviços
#sudo systemctl enable NetworkManager.service
#sudo systemctl enable tlp.service

# Removendo pacotes
MSG="Removendo pacotes"
PrintMsg
PACOTES_PARA_REMOVER=(
   lemonbar
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

# Criando links dos dotfiles
MSG="Criando links dos dotfiles"
PrintMsg
xstow -t $HOME bash bspwm chromium dunst mpv picom rofi sxhkd xorg
# ---------------------------------------------------------------------- #


# --------------------------- PÓS-INSTALAÇÃO --------------------------- #
## Finalização e limpeza
sudo apt autoclean
sudo apt autoremove -y
MSG="Script finalizado"
PrintMsg
MSG="Recomenda-se que o computador seja reiniciado"
PrintMsg
# ---------------------------------------------------------------------- #