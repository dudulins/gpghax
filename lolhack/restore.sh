#kill running processes
killall -s KILL sonylogo sonyapp ui_menu


#restore original system files
cp -fR /media/data/* /data


#restore original games and database
cp -fR /media/gaadata/* /gaadata


#place cursor back in the first game
sed -i "s/iUiUserSettingLastSelectGameCursorPos.*/iUiUserSettingLastSelectGameCursorPos=0/" /data/AppData/sony/ui/user.pre


#restart ui
/usr/sony/bin/ui_menu --power-off-enable


#sync usb drive
sync
