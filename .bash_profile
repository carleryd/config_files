source ~/.bashrc

# Add bash-completion
if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

# Set default editor
export EDITOR=/usr/local/bin/nvim


# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"

# Needed for dinghy, Docker stuff
#export DOCKER_HOST=tcp://192.168.99.110:2376
#export DOCKER_MACHINE_NAME=default
#export DOCKER_TLS_VERIFY=1
#export DOCKER_CERT_PATH=/Users/christoferarleryd/.docker/machine/machines/default

# vim and gvim(macvim) environmental variables
MYVIMRC="~/.vimrc"
MYGVIMRC="~/.gvimrc"

# Set color scheme for terminal
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# This sets the format of the terminal prompt
# \[\033[01;32m\] sets the following to green(\h, host)
export PS1="\[\033[01;32m\]\h\[\033[00m\] \[\033[01;34m\]\W \$\[\033[00m\] "
alias ls='ls ${LS_OPTS}'

alias ahead='cd /Users/christoferarleryd/Programming/Ahead/'
alias aelm='cd /Users/christoferarleryd/Programming/Ahead/ahead_web/web/static/elm/src/'
alias killwebpack='kill $(ps aux | grep webpack | awk "{print $2}")'
alias elmweb='cd /Users/christoferarleryd/Programming/Ahead/elm_website'
alias aweb='cd /Users/christoferarleryd/Programming/Ahead/ahead_web'
alias awebelm='cd /Users/christoferarleryd/Programming/Ahead/ahead_web/web/static/elm'
alias awebdb='cd /Users/christoferarleryd/Programming/Ahead/ahead_web/web/static/elm/src/DB'
alias amob='cd /Users/christoferarleryd/Programming/Ahead/ahead_mobile'
alias adep='cd /Users/christoferarleryd/Programming/Ahead/ahead_deployment'
alias prog='cd ~/Programming'
alias dev='cd ~/Development'
alias drop='cd ~/Dropbox'
alias drive='cd ~/Google\ Drive'
alias prolog='cd /Applications/JIProlog/'
alias sbp='source ~/.bash_profile'
alias vbp='vim ~/.bash_profile'
alias svim='source ~/.vimrc'
alias vvim='vim ~/.vimrc'
alias sgvim='source ~/.gvimrc'
alias vgvim='vim ~/.gvimrc'
alias vim='/usr/local/bin/nvim'
alias vtmuxconf='vim ~/.tmux.conf'
alias stmuxconf='tmux source-file ~/.tmux.conf'
alias so='source'
alias mvim='~/Applications/macvim/src/MacVim/mvim'
alias epi='elm package install -y'
alias gittagstamps='git log --tags --simplify-by-decoration --pretty="format:%ai %d"'
alias gitcurrentbranch='git rev-parse --abbrev-ref HEAD | tr -d "\n"'
alias gitdiffdevelop='git diff --name-status origin/develop..$(gitcurrentbranch)'


# Get your local IP
COMMAND=$(/sbin/ifconfig en0 | grep 'inet ' | cut -d: -f2 | awk '{ print $2}')
alias getip="echo $COMMAND"

# Commit and push config files
alias update_conf='
    git --git-dir=/Users/christoferarleryd/Programming/config_files/.git --work-tree=/Users/christoferarleryd/Programming/config_files add --all &&
    git --git-dir=/Users/christoferarleryd/Programming/config_files/.git --work-tree=/Users/christoferarleryd/Programming/config_files commit -m "Update config files" &&
    git --git-dir=/Users/christoferarleryd/Programming/config_files/.git --work-tree=/Users/christoferarleryd/Programming/config_files push
'

alias fixreact1='react-native start > /dev/null 2>&1 &'
alias fixreact2='adb reverse tcp:8081 tcp:8081'
# React Native: Change ip sent to device to current localhost NO WORK
alias fixreactlocalhost='/Users/christoferarleryd/Programming/bash_scripts/fixreactlocalhost.sh'


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

# Exports needed for Cocos2d-JS
export ANT_ROOT=/Users/christoferarleryd/Development/apache-ant-1.9.5/bin
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_51.jdk/Contents/Home

# MacPorts Installer addition on 2014-09-06_at_12:38:50: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.


# Add environment variable COCOS_CONSOLE_ROOT for cocos2d-x
export COCOS_CONSOLE_ROOT=/Users/christoferarleryd/Development/cocos2d-js-v3.6.1/tools/cocos2d-console/bin
export PATH=$COCOS_CONSOLE_ROOT:$PATH

# Add environment variable NDK_ROOT for cocos2d-x
export NDK_ROOT=/Users/christoferarleryd/Development/android-ndk-r10c
export PATH=$NDK_ROOT:$PATH

# Add environment variable ANDROID_SDK_ROOT for cocos2d-x
export ANDROID_HOME=/Users/christoferarleryd/Development/android-sdk-macosx
export ANDROID_SDK_ROOT=/Users/christoferarleryd/Development/android-sdk-macosx
export PATH=$ANDROID_SDK_ROOT:$PATH
export PATH=$ANDROID_SDK_ROOT/tools:$ANDROID_SDK_ROOT/platform-tools:$PATH
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

#[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
source ~/.git-completion.bash
