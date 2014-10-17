#! /bin/sh
clear
FILE=`zenity --file-selection --title="Select a File to create a shortcut for:"`

case $? in
         0)
                echo "\"$FILE\" selected.";;
         1)
                echo "No file selected."
		exit 0
		;;
        -1)
                echo "An unexpected error has occurred."
		exit 1
		;;
esac

cd $HOME/Desktop

FILE_NAME_WTEXT=${FILE##*/}
FILE_NAME_WOEXT=${FILE_NAME_WTEXT%.*}
FILE_SRTCUT="Shortcut to "$FILE_NAME_WOEXT.desktop
touch "$FILE_SRTCUT"
echo "[Desktop Entry]
Name=$FILE_NAME_WOEXT
Comment=Open Source Browser
Exec="$FILE"
Terminal=false
Type=Application
Icon=firefox
Terminal=false" >> "$FILE_SRTCUT" 
chmod +x "$FILE_SRTCUT"

