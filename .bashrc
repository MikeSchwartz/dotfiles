# ~/.bashrc: executed by bash(1) for non-login shells.
#
# Reminder: ~/.bash-profile is run for interactive login shells, and ~/.bashrc 
# is run for interactive  - but not login -  shells. Put whatever you want to run
# in both login and other interactive shells in ~/.bashrc and source ~/.bashrc in
# ~/.bash_profile. 
#

echo "Hello from .bashrc"

#
# Reminder: if ~/.bashrc is found, then ~/.profile won't be run. So source it here.
#
if [ -f ~/.profile ]; then
    source ~/.profile
fi

#
# .bashrc is not supposed to be run for interactive shells. But some sites recommend
# protecting against it anyhow.
#
#[ -z "$PS1" ] && return


################################################################
#
# Colors.
#
################################################################
export COLOR_NC='\\e[0m' # No Color
export COLOR_WHITE='\\e[1;37m'
export COLOR_BLACK='\\e[0;30m'
export COLOR_BLUE='\\e[0;34m'
export COLOR_LIGHT_BLUE='\\e[1;34m'
export COLOR_GREEN='\\e[0;32m'
export COLOR_LIGHT_GREEN='\\e[1;32m'
export COLOR_CYAN='\\e[0;36m'
export COLOR_LIGHT_CYAN='\\e[1;36m'
export COLOR_RED='\\e[0;31m'
export COLOR_LIGHT_RED='\\e[1;31m'
export COLOR_PURPLE='\\e[0;35m'
export COLOR_LIGHT_PURPLE='\\e[1;35m'
export COLOR_BROWN='\\e[0;33m'
export COLOR_YELLOW='\\e[1;33m'
export COLOR_GRAY='\\e[0;30m'
export COLOR_LIGHT_GRAY='\\e[0;37m'
alias colorslist="set | egrep 'COLOR_\\w*'"  # lists all the colors


################################################################
#
# Aliases
#
################################################################

# Make it harder to clobber stuff
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Shorthands
alias ls='ls -FG'
alias la='ls -aFG'

# Convenience
alias mkdir='mkdir -p'


################################################################
#
# Etc. 
#
################################################################

export EDITOR=emacs

# uh... this doesn't work unless my user name is the same everywhere,
# and it's not. Ugly hack in the meantime.
export PATH=/Users/mschwartz/bin:/Users/Mike/bin:$PATH

FIGNORE="~"


# After each command, checks the windows size and changes lines and columns
shopt -s checkwinsize

# History stuff. Append to rather than rewrite history file. Append after every
# command. (See also PROMPT_COMMAND.)
shopt -s histappend
export HISTCONTROL=ignoredups:erasedups
export HISTTIMEFORMAT="%h/%d - %H:%M:%S "
alias h5='history | tail -5'
alias h10='history | tail -10'
alias h20='history | tail -20'

# Easier way to view path
alias path='echo -e ${PATH//:/\\n}'

# Prompt. 
#
# uh... I dont' remember exactly what this is for. I *think*
# it's trying to get history appended after every command in 
# cases where "shopt -s histappend" doesn't work. But [a] I
# vaguely recall this being related to emacs shells, but am 
# not sure and [b] I don't know why this solution wouldn't
# be good enough in all cases. 
unset PROMPT_COMMAND
PROMPT_COMMAND="history -a;$PROMPT_COMMAND"

# bash completion settings (actually, these are readline settings)
bind "set completion-ignore-case on" # This ignores case in bash completion
bind 'set match-hidden-files off'
bind 'set colored-stats on'
bind "set bell-style none" # No bell, because it's damn annoying
bind "set show-all-if-ambiguous On" # this allows you to automatically show completion without double tab-ing

#
# Finder hacks. Quickly make the Finder show and not show hidden files
#
alias showfiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hidefiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

#
# Prompts and terminal title bars
#
# Notes
#   * http://bashrcgenerator.com/
#
# Table of prompt customizations that are available :
# \a  The ASCII bell character (007)
# \A  The current time in 24-hour HH:MM format
# \d  The date in "Weekday Month Day" format
# \D {format} The format is passed to strftime(3) and the result is inserted into the prompt string; an empty format results in a locale-specific time representation; the braces are required
# \e  The ASCII escape character (033)
# \H  The hostname
# \h  The hostname up to the first "."
# \j  The number of jobs currently managed by the shell
# \l  The basename of the shell's terminal device name
# \n  A carriage return and line feed 
# \r  A carriage return
# \s  The name of the shell
# \T  The current time in 12-hour HH:MM:SS format
# \t  The current time in HH:MM:SS format
# \@  The current time in 12-hour a.m./p.m. format
# \u  The username of the current user
# \v  The version of bash (e.g., 2.00)
# \V  The release of bash; the version and patchlevel (e.g., 2.00.0)
# \w  The current working directory
# \W  The basename of the current working directory
# \#  The command number of the current command
# \!  The history number of the current command
# \$  If the effective UID is 0, print a #, otherwise print a $
# \nnn    Character code in octal
# \\  Print a backslash
# \[  Begin a sequence of non-printing characters, such as terminal control sequences
# \]  End a sequence of non-printing characters
# 

#
# If the host name is ridiculously long, shorten it.
#
if [ $HOSTNAME = "Mikes-Personal-MacBook-Air.local" ]; then
    export MY_PROMPT_HOSTNAME="PersonalMac";
else
    export MY_PROMPT_HOSTNAME="\h";
fi

#
# Prompt
#
export PS1="\[$(tput bold)\]$MY_PROMPT_HOSTNAME \w \u [\!] $\[$(tput sgr0)\] "
