#!/usr/bin/env bash
git submodule update --init --recursive
if [[ -z $(command -v ansible-playbook) ]];then
	echo "ansible-playbook is not installed. Aborting."
	exit 1
fi
ansible-playbook ./dotfiles.yml -i ./hosts.local --ask-become-pass $@
