#
# Per https://scriptingosx.com/2019/06/moving-to-zsh-part-2-configuration-files/
# Then for interactive shells (and login shells) /etc/zshrc and .zshrc...
# since it will change settings for all invocations of zsh, including scripts.
#
echo "Hello from .zshrc"


setopt NO_CASE_GLOB
setopt AUTO_CD

#
# History
#
HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history
setopt EXTENDED_HISTORY
# share history across multiple zsh sessions
setopt SHARE_HISTORY
# append to history
setopt APPEND_HISTORY
# adds commands as they are typed, not at shell exit
setopt INC_APPEND_HISTORY
# expire duplicates first
setopt HIST_EXPIRE_DUPS_FIRST
# do not store duplications
setopt HIST_IGNORE_DUPS
#ignore duplicates when searching
setopt HIST_FIND_NO_DUPS
# removes blank lines from history
setopt HIST_REDUCE_BLANKS
# require users to verify commands from history
setopt HIST_VERIFY

#
# Auto-correction
#
setopt CORRECT
setopt CORRECT_ALL



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
# Autocomplete
#
################################################################

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
# case insensitive path-completion
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'
zstyle :compinstall filename '/Users/Mike/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

################################################################
#
# Prompt
#
# https://jonasjacek.github.io/colors/
#
################################################################

PROMPT='%F{blue}%1~%f %# '

