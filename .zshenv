#
# Per https://scriptingosx.com/2019/06/moving-to-zsh-part-2-configuration-files/,
# The zshenv files are always used when they exist, even for scripts with the #!/bin/zsh
# shebang. Since changes applied in the zshenv will affect zsh behavior in all contexts,
# you should you should be very cautious about changes applied here...
# you probably want to avoid using the zshenv files since it will change settings
# for all invocations of zsh, including scripts.
#
echo "Hello from .zshenv"

