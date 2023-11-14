#!/bin/bash

if punkt_pack_is "apt"; then
	sudo add-apt-repository ppa:nextcloud-devs/client -y
	sudo apt update
	sudo apt install nextcloud-desktop
else
	punkt_pack_install "nextcloud-desktop"
fi

