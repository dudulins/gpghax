# gpghax

>Disclaimer: THIS CAN BRICK YOUR CONSOLE. Don't use if you don't understand every piece of how it works. Most of the new code in lolhack.sh could not be tested due to unavailable hardware to do so.

This uses lolhack, a payload launcher created by madmonkey.

What if PlayStation Classic, but with a game library that's actually fun to play?

# BACKUP YOUR SYSTEM!!!

By editing the lolhack.sh you can enable partial or full backup/restore of your system.

You can backup or restore your system by replacing "lolhack.sh" by "backup.sh" or "restore.sh" (the file must be renamed "lolhack.sh" to work)

It's highly recommended that you use an empty 16Gb USB drive to backup your system and keep the backup safe in case of disaster.


# Adding Custom Games:

You can add as many games as you want by following the steps below.

1. Open "lolhack/databases/custom.db" in an SQLite Editor of your choice (I use SQLiteStudio 3.2.1 for Windows).

2. Add new entry to the GAME table as follows:
* GAME_ID = numerical identifier, has to be unique (it will be used later to name the game folder)
* GAME_TITLE_STRING = Name of the game
* PUBLISHER_NAME = self explanatory
* RELEASE_YEAR = self explanatory
* PLAYERS = number of players
* RATING_IMAGE = Has to be "CERO_A"
* GAME_MANUAL_QR_IMAGE = Has to be "QR_Code_GM"
* LINK_GAME_ID = leave empty

3. Open DISC table and add new entry per each disc for the game:
* GAME_ID = GAME_ID from the GAME table
* DISC_NUMBER = disc number
* BASENAME = base name for the cue/bin file pair, i.e: SCUS-94426

4. Commit the changes (save the file).

5. In "lolhack/games" create as many folders as you added games in the database and rename them with the GAME_ID used in the database for each game. (i.e 21.)

6. Place the BIN/CUE files of your games in the correct folder. You need to make sure that you CUE file points to the correct BIN file (You may need to edit the CUE file in a text editor).

You will need at least the files listed below for each game (use the "21" sample folder as a template).
* BASENAME.cue (use the BASENAME value from the DISC table, i.e SCUS-99999.cue)
* BASENAME.bin (use the BASENAME value from the DISC table, i.e SCUS-99999.bin)
* BASENAME.png (use the BASENAME value from the DISC table, i.e SCUS-99999.png)
* pcsx.cfg (you can use the file provided in the "21" sample folder in every game)


# Running:
Put everything onto an empty USB drive (FAT32) named SONY, plug the USB drive into the port 2 and power cycle the system (remove the power plug and reatach). If everything worked fine, you should see your custom game in the menu.


# Uninstall:
If you brick your system or want to uninstall the hack just follow the steps bellow

1. Go to "lolhack/databases" folder and rename the file "default_us.db" (for US consoles) or "default_jp.db" (for japanese consoles) to "default.db".

2. Go to "lolhack" folder, delete the "lolhack.sh" file and rename the "uninstall.sh" to "lolhack.sh"

3. Format a USB drive and name it "SONY".

4. Copy the this content to the root of your USB drive.

5. Plug your USB drive into the 2nd controller port of your PlayStation Classic (keep the power cord unplugged).

6. Plug the power cord and wait the console to boot.

7. After it shuts down, you can remove the USB drive and plug the power again (the console should be restored to its original state).


# NOTES:
If you don't want to/don't know how to edit the database file, you can just replace the empty SCUS-99999.cue and SCUS-94426.bin files from this repo with your game (just make sure you keep the same name for the files) and it should work somewhat fine. This will limit adding just one game that uses only one disc on the "21" folder.


# UPDATES:
12-11-18:
Incorporates justMaku uninstall procedure.

12-10-18:

You can now access the PCSX menu by pressing [select] + [triangle] on your control pad.

Folder structure was changed to keep the hack and the backup separated.

It is possible to overmount the original games folder and show only the games on the USB drive.

A new file (lolhack_template.sh) was added to be the base of a GUI to make the process of backup/restore the system and adding/removing games easier.

12-09-18:

Backup the original games database before replacing it.


# Credits:
madmonkey, DanTheMan827, skogaby, justMaku, dudulins