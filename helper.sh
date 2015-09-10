#!/bin/bash

function color_echo {
    for word in "$@"; do
        case "$word" in
            NORMAL|RESET) echo -n -e "\033[0;00m";;
            BLACK) echo -n -e "\033[22;30m";;
            RED|--ERROR|--ERR) echo -n -e "\033[22;31m";;
            GREEN|--INFO) echo -n -e "\033[22;32m";;
            YELLOW|--WARNING|--WARN) echo -n -e "\033[22;33m";;
            BLUE) echo -n -e "\033[22;34m";;
            MAGENTA) echo -n -e "\033[22;35m";;
            CYAN) echo -n -e "\033[22;36m";;
            GRAY|WHITE) echo -n -e "\033[22;37m";;
            LGRAY|DARKGRAY|BRIGHTBLACK|--DEBUG) echo -n -e "\033[01;30m";;
            LRED|LIGHTRED|BRIGHTRED|--FATAL) echo -n -e "\033[01;31m";;
            LGREEN|LIGHTGREEN|BRIGHTGREEN) echo -n -e "\033[01;32m";;
            LYELLOW|LIGHTYELLOW|BRIGHTYELLOW) echo -n -e "\033[01;33m";;
            LBLUE|LIGHTBLUE|BRIGHTBLUE) echo -n -e "\033[01;34m";;
            LMAGENTA|LIGHTMAGENTA|BRIGHTMAGENTA) echo -n -e "\033[01;35m";;
            LCYAN|LIGHTCYAN|BRIGHTCYAN) echo -n -e "\033[01;36m";;
            LWHITE|LIGHTWHITE|BRIGHTWHITE) echo -n -e "\033[01;37m";;
            *) echo -n "$word ";;
        esac
    done
    echo -e "\033[0;00m"
}

report_success()
{
	color_echo GREEN "$@"
}

report_error()
{
	color_echo RED "$@"
}

report_exist()
{
	color_echo LYELLOW "$@"
}