#Theorical hack created by dudulins based on the work of madmonkey and justMaku
#No test could be performed due to lack of hardware
#This file is a template for a GUI to generate lolhack.sh based on selected options
#The GUI should be able to add games, artwork and create a regional.db on the thumb drive
#Backup and Restore options can be upgraded to seek available disk space in thumb drive
#Backup and Restore option will use a fair amount of thumb drive space. (highly recomended to backup the system and keep the backup safe)


#kill running processes
killall -s KILL sonylogo sonyapp ui_menu


###[CREATE_BACKUP_IMG]###
	#create a full backup image of the system (it can take up to 10 minutes)
	/bin/dd if=/dev/mmcblk0 of=/media/ps_classic.img bs=4M


###[RESTORE_BACKUP_IMG]###
	#full restore from image



###[BACKUP_ORIGINAL_FILES]###
	#backup original system files and games (it will not overwrite files after the first backup)
	cp -fnR /data/* /media/data
	cp -fnR /gaadata/* /media/gaadata


###[RESTORE_ORIGINAL_FILES]###
	#restore original system files and games
	cp -fR /media/data/* /data
	cp -fR /media/gaadata/* /gaadata


###[BACKUP_ORIGINAL_DB]###
	#backup original games db (it will not overwrite files after the first backup)
	cp -nR /gaadata/databases/regional.db /media/gaadata/databases/regional.db 


###[RESTORE_ORIGINAL_DB]###
	#restore original games db
	cp -f /media/gaadata/databases/regional.db /gaadata/databases/regional.db


###[ADD_TO_ORIGINAL_GAMES]###
	#link thumb drive dirs into the /gaadata (add to original games; game folder needs to start with 21)
	cd /media/lolhack/games
	for D in *; do
		if [ -d "${D}" ]; then
			ln -s /media/lolhack/games/${D} /gaadata/${D}
		fi
	done

	#replace games db (need a interface to create regional.db)
	cp /media/lolhack/databases/regional.db /gaadata/databases/regional.db


###[REPLACE_ORIGINAL_GAMES]###
	#overmount the original games (replace original games; it will not rewrite original games; game folder needs to start with 1; what happens if I start to name the folders with 21? need an interface like hackchi to add games and create regional.db)
	find * -maxdepth 0 -type d -exec mount -o bind /media/lolhack/games/{} /gaadata/{} \;


###[ENABLE_PCSX_MENU]###
	#enable PCSX menu by pressing [SELECT] + [TRIANGLE] on the controller
	export PCSX_ESC_KEY=2


#place cursor back in the first game
sed -i "s/iUiUserSettingLastSelectGameCursorPos.*/iUiUserSettingLastSelectGameCursorPos=0/" /data/AppData/sony/ui/user.pre


#restart ui
/usr/sony/bin/ui_menu --power-off-enable


#sync usb drive
sync
