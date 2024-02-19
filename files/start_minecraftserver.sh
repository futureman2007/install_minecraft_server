#!/bin/bash

# GLOBAL VARIABLES
## Globals you may edit
SCREEN_HOME="/usr/bin/"
SERVER_HOME_FOLDER="{{ server_home_spigot}}"
SERVER_JARFILE_NAME="{{ server_jarfile_spigot }}"
PRINT_PREFIX= ">>> "
ERROR_PREFIX= "!!! ERROR: "
WARNING_PREFIX= ">>! Warning: "
## Globals you should NOT edit (except you know what youa re doing)

# Return codes:
# 0: Successfully startet the server
# 1: Error starting server
# 10: Server not started (already running)

is_mc_server_already_running(){
	local server_running_state="false"
	
	if $SCREEN_HOME/screen -ls minecraft; then
		server_running_state="true"
	elif $SCREEN_HOME/screen -ls spigot; then
		server_running_state="true"
	fi
	echo "$server_running_state"
}

start_server() {
	if ! $SCREEN_HOME/screen -A -m -d -S minecraft java -Xms1024M -Xmx12G -XX:ParallelGCThreads=4 -XX:MinHeapFreeRatio=5 -XX:MaxHeapFreeRatio=10 -jar $SERVER_HOME_FOLDER/$SERVER_JARFILE_NAME nogui; then
		return 1
	fi
		return 0
}

main(){

	if is_mc_server_already_running == "false"; then
		echo $PRINT_PREFIX "Server not running, starting server"

		if ! start_server; then
			return 1
		fi

	elif is_mc_server_already_running == "true"; then
		echo $PRINT_PREFIX "Server is already running!"
		return 10
		
	else
		echo $ERROR_PREFIX "Could not determine if minecraft server is already running or not. Something went wrong terribly! Abborting..."
		return 1
	fi
	
}

main "$@"

