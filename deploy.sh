#!/usr/bin/env bash
if [[ -z $(command -v ansible-playbook) ]];then
	echo "ansible-playbook i's not installed. Aborting."
	exit 1
fi
ansible-playbook ./dotfiles.yml -i ./hosts.local --ask-become-pass $@
