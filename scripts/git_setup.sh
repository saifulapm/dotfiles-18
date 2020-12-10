#!/bin/bash

echo "Type your GitHub username.\n>> "
read username

echo "Type your GitHub email.\n>> "
read email

echo "Do you want to rebase on pull? [true/false]\n>> "
read rebase

echo "Configuring your github settings ..."

sleep 1

git config --global user.name $username
git config --global user.email $email
git config --global pull.rebase $rebase
