#!/bin/bash

printf "Type your GitHub username.\n>> "
read username
git config --global user.name $username

printf "\nType your GitHub email.\n>> "
read email
git config --global user.email $email

printf "\nDo you want to rebase on pull? [true/false]\n>> "
read rebase
git config --global pull.rebase $rebase

echo "\nConfiguring the last settings ..."
git config --global init.defaultbranch "main"

echo "\nSaving the configuration ..."

sleep 1

echo "\nGit initial configuration done. You may want to add a signing key later!"
