#!/bin/bash

function get_git_data {
    git status --porcelain 2> /dev/null >/dev/null
    local status=$?
    local git_status="$(git status --porcelain 2> /dev/null)"
    if [ $status -ne 0 ]; then
        echo ""
        return
    fi
    if [[ -z "$git_status" ]] ; then
        echo "="
        return
    fi
    echo "!$(wc -l <<< "$git_status")"
}

function setPS1 {
    RED='\[\e[0;38;5;196m\]'
    GREEN='\[\e[0;38;5;46m\]'
    YELLOW='\[\e[0;38;5;226m\]'
    ORANGE='\[\e[0;38;5;208m\]'
    BLUE='\[\e[0;38;5;21m\]'
    PURPLE='\[\e[0;38;5;141m\]'
    MAGENTA='\[\e[0;38;5;201m\]'
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
    gitstatus="\$(get_git_data)"


    line1="${carriage}${RED}${user}${YELLOW}@${GREEN}${host}${RESET} - ${CYAN}${time} ${PURPLE}&${GREEN}${UNDERLINE}${exitstatus}${RESET}"

    line2="${carriage}${YELLOWBROWN}${path}${RESET}{${ROSE}${gitbranch}${ORANGE}${gitstatus}${RESET}}"
    
    line3="${carriage}${MAGENTA}${BLINK}$ ${RESET}"
    
    echo "${line1}${line2}${line3}"
}
PS1="$(setPS1)"


RED='\033[0;31m'
YELLOW='\033[0;33m'
NC='\033[0m'

alias autoshell="~/.tohutoro/autostart/autoshell.sh"

echo -e "-------------------------------
Bonjour ${RED}${USER}${NC}
<date: ${YELLOW}$(date +"%d-%m-%Y")${NC} >
-------------------------------
"
