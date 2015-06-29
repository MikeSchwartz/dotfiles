#
# Reminder: ~/.bash-profile is run for interactive login shells, and ~/.bashrc is run for 
# interactive (but not login) shells. Put whatever you # want to run in both login and
# other interactive shells in ~/.bashrc and source ~/.bashrc in ~/.bash_profile. 
#

echo "Hello from .bash_profile -- about to source ~/.bashrc"

if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi
