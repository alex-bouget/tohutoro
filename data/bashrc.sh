#!/bin/bash

RED='\[\e[0;38;5;196m\]'
GREEN='\[\e[0;38;5;46m\]'
YELLOW='\[\e[0;38;5;226m\]'
BLUE='\[\e[0;38;5;21m\]'
PURPLE='\[\e[0;38;5;141m\]'
CYAN='\[\e[0;38;5;51m\]'
WHITE='\[\e[0;38;5;231m\]'
YELLOWBROWN='\[\e[0;38;5;136m\]'
ROSE='\[\e[0;38;5;198m\]'
RESET='\[\e[0m\]'

UNDERLINE='\[\e[4m\]'
BOLD='\[\e[1m\]'
BLINK='\[\e[5m\]'
INVERT='\[\e[7m\]'
HIDDEN='\[\e[8m\]'
STRIKE='\[\e[9m\]'


user="\u"
host="\h"
path="\w"
time="\t"
carriage="\n"
exitstatus="\$?"
gitbranch="\$(git branch 2>/dev/null | grep '^*' | colrm 1 2)"
gitstatus=""

if [ $gitstatus -eq 0 ]; then
    gitstatus="${RED}✘${gitstatus}"
else
    gitstatus="${GREEN}✔"
fi

line1="${carriage}${RED}${user}${YELLOW}@${GREEN}${host}${RESET} - ${CYAN}${time} ${PURPLE}&${GREEN}${UNDERLINE}${exitstatus}${RESET}"

line2="${carriage}${YELLOWBROWN}${path}${RESET}{$gitdata} ${ROSE}${BLINK}$ ${RESET}"

PS1="${line1}${line2}"

#PS1='\n\[\e[0;38;5;196m\]\u\[\e[0;93m\]@\[\e[0;38;5;82m\]\h \[\e[0m\]- \[\e[0;38;5;26m\]\t \[\e[0;38;5;127m\]&\[\e[0;4;38;5;82m\]$?\n\[\e[0;38;5;214m\]\w\[\e[0m\]{\[\e[0;38;5;35m\]$(git branch 2>/dev/null | grep '"'"'^*'"'"' | colrm 1 2)\[\e[0m\]} \[\e[0;1;5;95m\]$ \[\e[0m\]'