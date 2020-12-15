#!/bin/bash

printf "Type your GitHub username.\n>> "
read username

printf "\nType your GitHub email.\n>> "
read email

printf "\nDo you want to rebase on pull? [true/false]\n>> "
read rebase

echo "\nConfiguring your github settings ..."

sleep 1

git config --global user.name $username
git config --global user.email $email
git config --global pull.rebase $rebase
