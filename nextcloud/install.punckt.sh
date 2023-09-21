#!/bin/bash

if punckt_pack_is "apt"; then
	sudo add-apt-repository ppa:nextcloud-devs/client -y
	sudo apt update
	sudo apt install nextcloud-desktop
else
	punckt_pack_install "nextcloud-desktop"
fi

