#!/bin/bash
OS=$(uname -s)
if [ $OS == "Linux" ]
then
	check=$(rsync --version || echo "Unknown");
	if [ "$check" != "Unknown" ]
	then
		echo "rsync already installed"
		exit
	fi
	echo "Installing rsync on Linux"
	OS=$(hostnamectl | grep "Operating System" | awk -F ': ' '{print $2}');
	if [ "$OS" == "Arch Linux" ]
	then
		pacman -S rsync
	else
		apt-get update
		apt install rsync 
	fi	
else
	echo "installing rsync on Windows"
	cp "rsync.exe" "C:\Program Files\Git\usr\bin\rsync.exe"
	echo "installing dependent packages"
	cp "msys-xxhash-0.8.0.dll" "C:\Program Files\Git\usr\bin\msys-xxhash-0.8.0.dll"
	cp "msys-zstd-1.dll" "C:\Program Files\Git\usr\bin\msys-zstd-1.dll"
fi
echo "DONE!"
read -p "Press any key to exit..."
