# Set Nickelmenu label & icon
experimental : menu_main_15505_label : Owner
experimental : menu_main_15505_icon : /mnt/onboard/.adds/nm/.profile.png

# MAIN
# Device Owner
menu_item : main : Device Owner : dbg_msg : Please contact me at +4917624277475, if you found this device, I will pay you! Thank you!

# READER
# Bücher
menu_item : reader : Bücher : nickel_open : library:library
# Bildschirmschoner switch
menu_item : reader : ↔ Bildschirmschoner : cmd_output : 500 : quiet : test -e /mnt/onboard/.kobo/screensaver_old
chain_failure : skip : 3
chain_success : cmd_spawn : quiet :mv /mnt/onboard/.kobo/screensaver_old /mnt/onboard/.kobo/screensaver
chain_success : dbg_toast : Modus: Hintergrundbild
chain_always : skip : -1
chain_failure : cmd_spawn : quiet : mv /mnt/onboard/.kobo/screensaver /mnt/onboard/.kobo/screensaver_old
chain_success : dbg_toast : Modus: Lektürebild

# SELECTION
# In Deutsch
menu_item : selection : In Deutsch : nickel_browser : modal : https://translate.google.com/m?sl=auto&tl=de&q={1||%}
# In Englisch
menu_item : selection : In Englisch : nickel_browser : modal : https://translate.google.com/m?sl=auto&tl=en&q={1||%}

# SELECTION SEARCH
# In Deutsch
menu_item : selection_search : In Deutsch : nickel_browser : modal : https://translate.google.com/m?sl=auto&tl=de&q={1||%}
# In Englisch
menu_item : selection_search : In Englisch : nickel_browser : modal : https://translate.google.com/m?sl=auto&tl=en&q={1||%}
# Speichern (-e to recognise the escape sequence \n)
menu_item : selection_search : Speichern : cmd_output : 500 : quiet : echo -e "$(date '+%d.%m.%y %H:%M')\n{1||$}" >> /mnt/onboard/.adds/nm/.InstapaperNotes.txt
chain_success : dbg_toast : Auswahl gespeichert
# Printf (alternative if -e ever makes problems
#menu_item : selection_search : Printf : cmd_output : 500 : quiet : printf "%s\n%s\n" "$(date '+%d.%m.%y %H:%M')" "{1||$}" >> /mnt/onboard/.adds/nm/.InstapaperNotes.txt
#chain_success : dbg_toast : Auswahl gespeichert