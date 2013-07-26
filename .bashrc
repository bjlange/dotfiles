### pimped out prompt, bro
### inspired by http://beckism.com/2009/02/better_bash_prompt/
if [ $(locale charmap) = "UTF-8" ]
then
    export PS1="\[\033[30;1m\]╓────────────────────────────────────────────────────────────────────────────────\n╟ \[\033[34;1m\]\u\[\033[30;1m\]@\[\033[31;1m\]\h\[\033[30;1m\]: \[\033[32;1m\]\W\[\033[30;1m\]\n╙ \$> \[\033[37;1m\]"
    export PS2="\[\033[30;0m\] \$  \[\033[37;1m\]"

else
    export PS1="\[\033[30;1m\]________________________________________________________________________________\n| \[\033[34;1m\]\u\[\033[30;1m\]@\[\033[31;1m\]\h\[\033[30;1m\]: \[\033[32;1m\]\W\[\033[30;1m\]\n| \$> \[\033[37;1m\]"
    export PS2="\[\033[30;0m\]| \$  \[\033[37;1m\]"
fi
# define absolute path to home directory so this can be used on OSX
# and linux and referenced by other users (e.g., a vagrant user)
# http://stackoverflow.com/q/59895/564709
home=$(dirname ${BASH_SOURCE[0]})

# configure color output for grep
GREP_COLOR="1;32"
alias grep='grep --color=auto'

# remember history of all commands. 
HISTTIMEFORMAT="%Y.%m.%d %H:%M:%S "
HISTSIZE=10000
