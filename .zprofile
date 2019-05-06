source $COLORSCHEME_FILE

colorcode_to_rgbspec() {
  echo "$1"| sed -E 's/^#([0-9a-fA-F]{2})([0-9a-fA-F]{2})([0-9a-fA-F]{2})$/rgb:\1\/\2\/\3/'
}

colorcode_to_hex() {
  echo "$1"| sed -E 's/^#([0-9a-fA-F]{6})$/\1/'
}

if [ -n "$TMUX" ]; then
  set_ansi_color() { printf '\ePtmux;\e\e]4;%d;%s\e\e\\\e\\' $1 $(colorcode_to_rgbspec $2); }
  set_main_color() { printf '\ePtmux;\e\e]%d;%s\e\e\\\e\\' $1 $(colorcode_to_rgbspec $2); }
  set_custom_option() { printf '\ePtmux;\e\e]%s%s\e\e\\\e\\' $@; }
elif [ "${TERM%%-*}" = 'linux' ]; then
  set_ansi_color() { [ $1 -lt 16 ] && printf '\e]P%x%s' $1 $(echo $2| sed 's/#//g'); }
  set_main_color() { true; }
  set_custom_option() { true; }
else
  set_ansi_color() { printf '\e]4;%d;%s\e\\' $1 $(colorcode_to_rgbspec $2); }
  set_main_color() { printf '\e]%d;%s\e\\' $1 $(colorcode_to_rgbspec $2); }
  set_custom_option() { printf '\e]%s%s\e\\' $@; }
fi

set_ansi_color 0 $COLORSCHEME_SELECTION
set_ansi_color 1 $COLORSCHEME_RED
set_ansi_color 2 $COLORSCHEME_GREEN
set_ansi_color 3 $COLORSCHEME_YELLOW
set_ansi_color 4 $COLORSCHEME_BLUE
set_ansi_color 5 $COLORSCHEME_PURPLE
set_ansi_color 6 $COLORSCHEME_AQUA
set_ansi_color 7 $COLORSCHEME_FOREGROUND
set_ansi_color 8 $COLORSCHEME_SELECTION
set_ansi_color 9 $COLORSCHEME_RED
set_ansi_color 10 $COLORSCHEME_GREEN
set_ansi_color 11 $COLORSCHEME_YELLOW
set_ansi_color 12 $COLORSCHEME_BLUE
set_ansi_color 13 $COLORSCHEME_PURPLE
set_ansi_color 14 $COLORSCHEME_AQUA
set_ansi_color 15 $COLORSCHEME_FOREGROUND

if [ -n "$ITERM_SESSION_ID" ]; then
  set_custom_option Pg $(colorcode_to_hex $COLORSCHEME_FOREGROUND)
  set_custom_option Ph $(colorcode_to_hex $COLORSCHEME_BACKGROUND)
  set_custom_option Pi $(colorcode_to_hex $COLORSCHEME_FOREGROUND)
  set_custom_option Pj $(colorcode_to_hex $COLORSCHEME_SELECTION)
  set_custom_option Pk $(colorcode_to_hex $COLORSCHEME_FOREGROUND)
  set_custom_option Pl $(colorcode_to_hex $COLORSCHEME_FOREGROUND)
  set_custom_option Pm $(colorcode_to_hex $COLORSCHEME_BACKGROUND)
else
  set_main_color 10 $COLORSCHEME_FOREGROUND
  set_main_color 11 $COLORSCHEME_BACKGROUND
  if [ "${TERM%%-*}" = 'rxvt' ]; then
    set_main_color 708 $COLORSCHEME_BACKGROUND
  fi
  set_custom_option 12 ';7'
fi

unset -f set_ansi_color
unset -f set_main_color
unset -f set_custom_option
