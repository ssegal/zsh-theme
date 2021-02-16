# Put your custom themes in this folder.
# Example:

ZSH_THEME_GIT_PROMPT_CLEAN=''
ZSH_THEME_GIT_PROMPT_DIRTY='*'
ZSH_THEME_GIT_PROMPT_PREFIX=' (%B%F{yellow}'
ZSH_THEME_GIT_PROMPT_SUFFIX='%b%f)'

ssegal_prompt () {
    echo -n "%B%F{green}%m%b%f" # machine
    echo -n ":" # :
    echo -n "%B%F{blue}%~%b%f" # working dir
    echo -n "$(git_prompt_info)" # git stuff
    echo
    echo -n "[%B%F{cyan}%h%b%f]" # seq num
    echo -n '%# '  # prompt
}

PROMPT='$(ssegal_prompt)'
