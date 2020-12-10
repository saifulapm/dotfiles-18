#!/bin/bash

#=============
# Variables
#=============
bold=$(tput bold)
normal=$(tput sgr0)
red="\e[91m"
green="\e[92m"
folders=("Python" "Nodejs" "Go" "Misc")
packages=("git" "gh" "git-delta" "wget" "curl" "neovim" "build-essential" "clang""python" "nodejs" "golang" "tmux" "lsd" "zsh" "ctags" "tar" "zip" "unzip" "unrar" "sqlite" "neofetch" "bat")

#=============
# Functions
#=============
installation_help() {
  echo -e "${bold}Installation and Configuration${normal}
Install and configure your packages and environment.
=========================================

${bold}Usage:${normal}
  ./install [OPTIONS]

${bold}Options:${normal}
  --distro <distro>
    Set the package manager for your distribution."

  exit 0
}

log() {
  script_name=${0##*/}
  timestamp=$(date -u +"[${bold}%Y-%m-%d${normal} – ${bold}%H:%M:%S${normal}]")
  echo -e "=== ${bold}$script_name${normal} $timestamp $1"
}

setup() {
  if [[ -z "$1" ]]; then
    if [[ "$OSTYPE" == "linux-android" ]]; then
      log "${bold}Starting package installation ...${normal}"
      sleep 1
      log "${bold}Setting up storage ...${normal}"
      termux-setup-storage
      log "${bold}Updating sources and installed packages ...${normal}"
      apt update && apt upgrade -y
      for pkg in "${packages[@]}"; do
        log "${bold}Installing ${pkg} ...${normal}"
        apt install "${pkg}" -y
        sleep 1
      done
      log "${bold}All packages were installed successfully.${normal}"
      sleep 1
      log "${bold}Starting package configuration ...${normal}"
      configuration
    elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
      log "${bold}You are running this script on a GNU/Linux distribution. You must run it with the --distro <distro> option.${normal}"
      installation_help
      exit 1
    fi
  else
    case $1 in
      --distro)
        if [[ "$OSTYPE" == "linux-gnu"* ]]; then
          distro_name="$2"
          # I'm only putting the distros I use.
          # If you use other distro you must need to add it manually.
          if [[ "$distro_name" == "arch" ]]; then
            log "${bold}Starting package installation ...${normal}"
            sleep 1
            log "${bold}Updating sources and installed packages ...${normal}"
            sudo pacman -Syu
            for pkg in "${packages[@]}"; do
              log "${bold}Installing ${pkg} ...${normal}"
              sudo pacman -S "${pkg}"
              sleep 1
            done
            log "${bold}All packages were installed successfully.${normal}"
            sleep 1
            log "${bold}Starting package configuration ...${normal}"
            configuration
          elif [[ "$distro_name" == "ubuntu" ]]; then
            log "${bold}Starting package installation ...${normal}"
            sleep 1
            log "${bold}Updating sources and installed packages ...${normal}"
            sudo apt-get update && sudo apt-get dist-upgrade -y
            for pkg in "${packages[@]}"; do
              log "${bold}Installing ${pkg} ...${normal}"
              sudo apt-get install "${pkg}" -y
              sleep 1
            done
            log "${bold}All packages were installed successfully.${normal}"
            sleep 1
            log "${bold}Starting package configuration ...${normal}"
            configuration
          else
            log "${bold}Invalid distribution ($distro_name). Valid distributions: arch, ubuntu.${normal}"
            exit 1
          fi
        elif [[ "$OSTYPE" == "linux-android" ]]; then
          log "${bold}You are running this script in a Termux environment. Please run it without options.${normal}"
          exit 1
        fi
        ;;
      -h | --help)
        installation_help
        ;;
      *)
        log "${bold}The $1 option wasn't found.${normal} Please see help."
        exit 1
        ;;
    esac
    shift
  fi
  shift
}

configuration() {
  # Configuring the environment
  log "${bold}Setting up the environment ...${normal}"
  sleep 0.5
  for folder in "${folders[@]}"; do
    log "${bold}Creating the folder $folder ...${normal}"
    mkdir -p "$HOME/Development/$folder"
    sleep 1
  done
  log "${bold}Environment configuration done.${normal}"
  sleep 1

  # Termux specific!
  if [[ "$OS_TYPE" == "linux-android" ]]; then
    log "${bold}Setting up Termux keys and colors ...${normal}"
    sleep 0.5
    if [[ -d "$HOME/.termux" ]]; then
      log "${bold}Copying configuration files ...${normal}"
      cp -r ../termux/termux.properties $HOME/.termux
      cp -r ../termux/colors.properties $HOME/.termux
      sleep 1
    else
      log "${bold}Creating termux folder and copying configuration files ...${normal}"
      mkdir $HOME/.termux
      cp -r ../termux/termux.properties $HOME/.termux
      cp -r ../termux/colors.properties $HOME/.termux
      sleep 1
    fi
    log "${bold}Termux configuration done. Reloading settings ...${normal}"
    termux-reload-settings
    sleep 1
  fi

  # Git configuration (Manually!)
  log "${bold}Setting up Git ...${normal}"
  sleep 0.5
  sh ./git_setup.sh
  sleep 1
  log "${bold}Git configuration done.${normal}"
  sleep 1

  # ZSH configuration
  log "${bold}Setting up oh-my-zsh ...${normal}"
  sleep 0.5
  sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
  sleep 1
  log "${bold}Setting up powerlevel10k ...${normal}"
  sleep 0.5
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
  sleep 1
  log "${bold}Setting up zsh third-party plugins ...${normal}"
  sleep 0.5
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
  sleep 1
  log "${bold}Copying configuration files and aliases ...${normal}"
  cp ../zsh/.zshrc $HOME
  cp ../zsh/.p10k.zsh $HOME
  cp ../zsh/.aliases $HOME
  sleep 1
  log "${bold}ZSH configuration done.${normal}"
  sleep 1

  # SpaceVim configuration
  log "${bold}Setting up SpaceVim ...${normal}"
  sleep 0.5
  curl -sLf https://spacevim.org/install.sh | bash
  sleep 1
  log "${bold}Copying configuration files ...${normal}"
  cp -r ../spacevim/.SpaceVim.d $HOME
  sleep 1
  log "${bold}SpaceVim configuration done. Please start Neovim.${normal}"
  sleep 1

  # Other configurations
  log "${bold}Setting up packages configurations ...${normal}"
  sleep 0.5
  log "${bold}Copying configuration files ...${normal}"
  cp -r ../configs/lsd $HOME/.config
  cp -r ../configs/bashtop $HOME/.config
  sleep 1
  log "${bold}Configuration done."
}

if [[ -z "$1" ]]; then
  setup
elif [[ ! -z "$1" ]] && [[ -z "$2" ]]; then
  setup "$1"
else
  setup "$1" "$2"
fi
