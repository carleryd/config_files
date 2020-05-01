# Global packages with yarn
export PATH="$PATH:$(yarn global bin)"

# Set default editor
export EDITOR=/usr/local/bin/vim

# Set color scheme for terminal
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# This sets the format of the terminal prompt
# \[\033[01;32m\] sets the following to green(\h, host)
export PS1="\[\033[01;32m\]\h\[\033[00m\] \[\033[01;34m\]\W \$\[\033[00m\] "
alias ls='ls ${LS_OPTS}'
alias killwebpack='kill $(ps aux | grep webpack | awk "{print $2}")'
alias prog='cd ~/Programming'
alias dev='cd ~/Development'
alias drop='cd ~/Dropbox'
alias drive='cd ~/Google\ Drive'
alias dplay='cd ~/Programming/discovery/dplay-nordics-web'
alias luna='cd ~/Programming/discovery/luna_web'
alias sbp='source ~/.bash_profile'
alias vbp='vim ~/.bash_profile'
alias svim='source ~/.vimrc'
alias vvim='vim ~/.vimrc'
alias sgvim='source ~/.gvimrc'
alias vgvim='vim ~/.gvimrc'
alias so='source'
# GIT aliases
alias gs='git status'
alias gco='git checkout'
alias gcom='git commit'
alias gittagstamps='git log --tags --simplify-by-decoration --pretty="format:%ai %d"'
alias gitcurrentbranch='git rev-parse --abbrev-ref HEAD | tr -d "\n"'
alias gitdiffdevelop='git diff --name-status origin/develop..$(gitcurrentbranch)'
alias gprevbr='git reflog | grep -o "checkout: moving from .* to " | sed -e "s/checkout: moving from //" -e "s/ to $//" | head -20'

alias signal='signal-desktop >/dev/null &'
alias turtl="sudo bash -c 'turtl &'"
alias postman="~/.Postman/Postman &"
alias fix-mouse="sudo modprobe -r psmouse & sudo modprobe psmouse"
alias rotate-normal='xrandr --output eDP-1 --rotate normal'
alias rotate-inverted='xrandr --output eDP-1 --rotate inverted'
alias rotate-left='xrandr --output eDP-1 --rotate left'
alias rotate-right='xrandr --output eDP-1 --rotate right'
alias hibernate='sudo systemctl hibernate'
alias suspend='sudo systemctl suspend'
alias scale-1.0='gsettings set org.gnome.desktop.interface text-scaling-factor 1.0'
alias scale-1.1='gsettings set org.gnome.desktop.interface text-scaling-factor 1.1'
alias scale-1.2='gsettings set org.gnome.desktop.interface text-scaling-factor 1.2'
alias scale-1.3='gsettings set org.gnome.desktop.interface text-scaling-factor 1.3'
alias scale-1.4='gsettings set org.gnome.desktop.interface text-scaling-factor 1.4'
alias scale-1.5='gsettings set org.gnome.desktop.interface text-scaling-factor 1.5'
alias ashake='~/Development/shake.sh'

alias kill8989='kill -9 $(lsof -ti tcp:8989)'

# Commit and push config files
alias update_conf='
    git --git-dir=~/Programming/other/config_files/.git --work-tree=~/Programming/other/config_files add --all &&
    git --git-dir=~/Programming/other/config_files/.git --work-tree=~/Programming/other/config_files commit -m "Update config files" &&
    git --git-dir=~/Programming/other/config_files/.git --work-tree=~/Programming/other/config_files push
'

##### Terminal management   #####
    #   Change size         #
alias tsma='printf "\e[8;24;80t"'
alias tmed='printf "\e[8;43;80t"'
alias tlar='printf "\e[8;43;132t"'
    #   Change position     #
alias t1='printf "\e[3;0;0t"'
alias t2='printf "\e[3;586;0t"'
alias t3='printf "\e[3;1172;0t"'
alias t4='printf "\e[3;0;367t"'
alias t5='printf "\e[3;586;367t"'
alias t6='printf "\e[3;1172;367t"'
alias t7='printf "\e[3;0;631t"'
alias t8='printf "\e[3;586;631t"'
alias t9='printf "\e[3;1172;631t"'
    #   Misc                #
alias tsleep='printf "\e[2t" && sleep 3 && printf "\e[1t"'
if [ -e /home/chryd/.nix-profile/etc/profile.d/nix.sh ]; then . /home/chryd/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

# ANDROID CONFIGURATION
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
