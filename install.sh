#!/usr/bin/env bash
# ----------------------------- VARIÁVEIS ------------------------------ #
MSG=""
PACOTES_PARA_INSTALAR=()
PACOTES_PARA_REMOVER=()
# ---------------------------------------------------------------------- #

# ------------------------------ FUNÇÕES ------------------------------- #
PrintMsg()
{
   echo "########## $MSG ##########"
   MSG=""
}

InstalarPacote()
{
   for nome_do_pacote in ${PACOTES_PARA_INSTALAR[@]}; do
      if ! dpkg -l | grep -q $nome_do_pacote; then
         apt install "$nome_do_pacote" -y
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
         apt purge "$nome_do_pacote" -y
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
sudo apt update -y

PACOTES_PARA_INSTALAR=(
   firmware-linux-nonfree
   firmware-iwlwifi
   network-manager
   xorg
   bspwm
   sxhkd
   bash-completion
   rxvt-unicode
   rofi
   jq
   fonts-font-awesome
   picom
   pcmanfm
   zathura
   sxiv
   geany
   chromium
   chromium-l10n
   hsetroot
   mpv
   alsa-utils
   xarchiver
   p7zip-rar
   zip
   binutils
   ncompress
   plzip
   rar
   unar
   tlp
   light
   dunst
   libglib2.0-bin
   dbus-x11
   telegram-desktop
   flameshot
   git
   nodejs
   npm
   xstow
)
InstalarPacote

# Habilitar serviços
#sudo systemctl enable NetworkManager.service
#sudo systemctl enable tlp.service

PACOTES_PARA_REMOVER=(
   xserver-xorg-video-intel
   xserver-xorg-video-nouveau
   xserver-xorg-video-radeon
   xserver-xorg-video-vesa
   xserver-xorg-video-vmware
   xserver-xorg-video-all
   xserver-xorg-video-qxl
   lemonbar
   system-config-printer
)
RemoverPacote

PACOTES_PARA_INSTALAR=(
   intel-media-va-driver-non-free
   i965-va-driver-shaders
)
InstalarPacote
# ---------------------------------------------------------------------- #

# --------------------------- PÓS-INSTALAÇÃO --------------------------- #
## Finalização e limpeza##
sudo apt autoclean
sudo apt autoremove -y
MSG="Script finalizado"
PrintMsg
MSG="Recomenda-se que o computador seja reiniciado"
PrintMsg
# ---------------------------------------------------------------------- #
