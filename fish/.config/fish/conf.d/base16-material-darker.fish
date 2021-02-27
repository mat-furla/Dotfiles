set color00 21/21/21 # Base 00 - Black
set color01 F0/71/78 # Base 08 - Red
set color02 C3/E8/8D # Base 0B - Green
set color03 FF/CB/6B # Base 0A - Yellow
set color04 82/AA/FF # Base 0D - Blue
set color05 C7/92/EA # Base 0E - Magenta
set color06 89/DD/FF # Base 0C - Cyan
set color07 EE/FF/FF # Base 05 - White
set color08 4A/4A/4A # Base 03 - Bright Black
set color09 $color01 # Base 08 - Bright Red
set color10 $color02 # Base 0B - Bright Green
set color11 $color03 # Base 0A - Bright Yellow
set color12 $color04 # Base 0D - Bright Blue
set color13 $color05 # Base 0E - Bright Magenta
set color14 $color06 # Base 0C - Bright Cyan
set color15 FF/FF/FF # Base 07 - Bright White
set color16 F7/8C/6C # Base 09
set color17 FF/53/70 # Base 0F
set color18 30/30/30 # Base 01
set color19 35/35/35 # Base 02
set color20 B2/CC/D6 # Base 04
set color21 EE/FF/FF # Base 06
set colorfg $color07 # Base 05 - White
set colorbg $color00 # Base 00 - Black

# set syntax highlighting colors
set -U fish_color_autosuggestion 404346
set -U fish_color_cancel -r
set -U fish_color_command green #white
set -U fish_color_comment 4a4a4a
set -U fish_color_cwd green
set -U fish_color_cwd_root red
set -U fish_color_end brblack #blue
set -U fish_color_error red
set -U fish_color_escape yellow #green
set -U fish_color_history_current --bold
set -U fish_color_host normal
set -U fish_color_match --background=brblue
set -U fish_color_normal normal
set -U fish_color_operator blue #green
set -U fish_color_param B2CCD6
set -U fish_color_quote yellow #brblack
set -U fish_color_redirection cyan
set -U fish_color_search_match bryellow --background=353535
set -U fish_color_selection white --bold --background=353535
set -U fish_color_status red
set -U fish_color_user brgreen
set -U fish_color_valid_path --underline
set -U fish_pager_color_completion normal
set -U fish_pager_color_description yellow --dim
set -U fish_pager_color_prefix white --bold #--underline
set -U fish_pager_color_progress brwhite --background=cyan