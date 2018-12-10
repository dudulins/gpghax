#kill running processes
killall -s KILL sonylogo sonyapp ui_menu


#backup original system files (it will not overwrite files after the first backup)
cp -fnR /data/* /media/data


#backup original games and database (it will not overwrite files after the first backup)
cp -fnR /gaadata/* /media/gaadata


#restart ui
/usr/sony/bin/ui_menu --power-off-enable


#sync usb drive
sync
