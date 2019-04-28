if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

#export PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w\[\033[01;32m\]$(__git_ps1)\[\033[01;34m\] \$\[\033[34m\] '
#export PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w\[\033[01;32m\]$[\033[01;34m\] \$\[\033[34m\] '
#export PS1='\[\e[0;33m\]\u\[\e[0m\]@\[\e[0;32m\]\h\[\e[0m\]:\[\e[0;34m\]\w\[\e[0m\]\$ '

THEIP=$(ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p')
#export PS1="\[\033[01;31m\]\u@"$THEIP" \w $\[\033[00m\] ";
#export PS1='\[\e[0;33m\]\u\[\e[0m\]@\[\e[0;32m\]'$THEIP'\[\e[0m\]:\[\e[0;34m\]\w\[\e[0m\]\$ '
export PS1="\[\e[32m\]\u\[\e[m\]\[\e[31m\]@\[\e[m\][\w]: "
cd /Volumes/Work


#History
export HISTCONTROL=ignoredups
export HISTSIZE=1000
export HISTFILESIZE=1000
#Maven Settings
export M2_HOME=/usr/local/Cellar/maven/3.6.0/
export M2=$M2_HOME/bin
export PATH=$M2:$PATH
# enable colours in the terminal environment
export CLICOLOR=1
# set the colours for ls output
export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD

## get rid of command not found ##
 
## a quick way to get out of current directory ##
alias ll="ls -lrtFG"
alias cd..='cd ..'
alias reload="source /Users/jagadishmanchala/.bash_profile"
alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../..'
alias cls='clear'
alias myip='curl http://ifconfig.me/ip'
alias ll='ls -la'
alias l.='ls -d .*'
alias editprofile='vi /Users/jagadishmanchala/.bash_profile'
alias sshaws='ssh -o ConnectTimeout=600 -i /Volumes/Work/aws/jagadishoutlookkey.pem'
alias viewprofile='cat /Users/jagadishmanchala/.bash_profile'
alias edit_hosts='edit /etc/hosts'
alias ip='ipconfig getifaddr en0'
alias texted='open /Applications/TextEdit.app'
alias cp='cp -i'
alias rm='rm -i'
alias mv='mv -i'
alias now='date +%T'

#aws
alias private=`curl http://169.254.169.254/latest/meta-data/local-ipv4`
alias public=`curl http://169.254.169.254/latest/meta-data/public-ipv4`

#Jenkins
alias stopjen='sudo launchctl unload /Library/LaunchDaemons/org.jenkins-ci.plist'
alias startjen='sudo launchctl load /Library/LaunchDaemons/org.jenkins-ci.plist'

# opens file or folder with sublime
alias subl='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'
alias localip="ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p'"

## Colorize the grep command output for ease of use (good for log files)##
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# Stop after sending count ECHO_REQUEST packets #
alias ping='ping -c 5'
# Do not wait interval 1 second, go fast #
alias fastping='ping -c 100 -s.2'

#show Ports
alias ports='netstat -tulan'


myuptime () {
  uptime | awk '{ print "Uptime:", $3, $4, $5 }' | sed 's/,//g'
  return;
}

mcd () {
    mkdir -p $1
    cd $1
}

#functions for going up a certain number of directories and back
function up( )
{
    LIMIT=$1
    P=$PWD
    for ((i=1; i <= LIMIT; i++))
    do
        P=$P/..
    done
    cd $P
    export MPWD=$P
    }

function back( )
{
    LIMIT=$1
    P=$MPWD
    for ((i=1; i <= LIMIT; i++))
    do
        P=${P%/..}
    done
    cd $P
    export MPWD=$P
}

function _exit()	# function to run upon exit of shell
 {
  echo -e "${RED}Hasta la vista, baby${NC}"
 }

trap _exit EXIT


extract() { 
    if [ -f $1 ] ; then 
      case $1 in 
        *.tar.bz2)   tar xjf $1     ;; 
        *.tar.gz)    tar xzf $1     ;; 
        *.bz2)       bunzip2 $1     ;; 
        *.rar)       unrar e $1     ;; 
        *.gz)        gunzip $1      ;; 
        *.tar)       tar xf $1      ;; 
        *.tbz2)      tar xjf $1     ;; 
        *.tgz)       tar xzf $1     ;; 
        *.zip)       unzip $1       ;; 
        *.Z)         uncompress $1  ;; 
        *.7z)        7z x $1        ;; 
        *)     echo "'$1' cannot be extracted via extract()" ;; 
         esac 
     else 
         echo "'$1' is not a valid file" 
     fi 
}

function nt {
  osascript -e "
  tell application \"System Events\" to tell process \"Terminal\" to keystroke \"t\" using command down
  tell application \"Terminal\" to do script \"cd '$PWD' \" in selected tab of the front window
  " > /dev/null 2>&1
}

#=========


alias f='open -a Finder ./'
alias path='echo -e ${PATH//:/\\n}'         # path:         Echo all executable Paths
alias show_options='shopt'                  # Show_options: display bash options settings
alias fix_stty='stty sane'                  # fix_stty:     Restore terminal settings when screwed up
alias cic='set completion-ignore-case On'   # cic:          Make tab-completion case-insensitive
mcd () { mkdir -p "$1" && cd "$1"; }        # mcd:          Makes new Dir and jumps inside


#   memHogsTop, memHogsPs:  Find memory hogs
#   -----------------------------------------------------
    alias memHogsTop='top -l 1 -o rsize | head -20'
    alias memHogsPs='ps wwaxm -o pid,stat,vsize,rss,time,command | head -10'

#   cpuHogs:  Find CPU hogs
#   -----------------------------------------------------
    alias cpu_hogs='ps wwaxr -o pid,stat,%cpu,time,command | head -10'

#   topForever:  Continual 'top' listing (every 10 seconds)
#   -----------------------------------------------------
    alias topForever='top -l 9999999 -s 10 -o cpu'

#   ttop:  Recommended 'top' invocation to minimize resources
#   ------------------------------------------------------------
#       Taken from this macosxhints article
#       http://www.macosxhints.com/article.php?story=20060816123853639
#   ------------------------------------------------------------
    alias ttop="top -R -F -s 10 -o rsize"

#   my_ps: List processes owned by my user:
#   ------------------------------------------------------------
    my_ps() { ps $@ -u $USER -o pid,%cpu,%mem,start,time,bsdtime,command ; }


 alias netCons='lsof -i'                             # netCons:      Show all open TCP/IP sockets
alias flushDNS='dscacheutil -flushcache'            # flushDNS:     Flush out the DNS Cache
alias lsock='sudo /usr/sbin/lsof -i -P'             # lsock:        Display open sockets
alias lsockU='sudo /usr/sbin/lsof -nP | grep UDP'   # lsockU:       Display only open UDP sockets
alias lsockT='sudo /usr/sbin/lsof -nP | grep TCP'   # lsockT:       Display only open TCP sockets
alias ipInfo0='ipconfig getpacket en0'              # ipInfo0:      Get info on connections for en0
alias ipInfo1='ipconfig getpacket en1'              # ipInfo1:      Get info on connections for en1
alias openPorts='sudo lsof -i | grep LISTEN'        # openPorts:    All listening connections
alias showBlocked='sudo ipfw list'                  # showBlocked:  All ipfw rules inc/ blocked IPs

alias ds='docker kill'


passwd () {
  security 2>&1 >/dev/null find-generic-password -ga $1 \
  |ruby -e 'print $1 if STDIN.gets =~ /^password: "(.*)"$/'
}


alias path='echo -e ${PATH//:/\\n}'
alias xs='cd'
alias vf='cd'
alias moer='more'
alias moew='more'
alias kk='ll'
