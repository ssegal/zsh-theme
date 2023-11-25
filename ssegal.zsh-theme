# Put your custom themes in this folder.
# Example:

if (($+functions[git_prompt_info])); then
    # Oh my zsh!
    ZSH_THEME_GIT_PROMPT_CLEAN=''
    ZSH_THEME_GIT_PROMPT_DIRTY='*'
    ZSH_THEME_GIT_PROMPT_PREFIX=' (%B%F{yellow}'
    ZSH_THEME_GIT_PROMPT_SUFFIX='%b%f)'
else
    autoload -Uz vcs_info
    setopt prompt_subst
    zstyle ':vcs_info:*' formats " (%%B%F{yellow}%b%u%c%f%%b)"
    zstyle ':vcs_info:*' actionformats " (%%B%F{yellow}%b[%a]%u%c%f%%b)"
    zstyle ':vcs_info:*' check-for-changes true
    zstyle ':vcs_info:*' unstagedstr '*'
    zstyle ':vcs_info:*' stagedstr '+'
    add-zsh-hook precmd vcs_info
fi

ssegal_show_git () {
    if (($+functions[git_prompt_info])); then
        echo -n "$(git_prompt_info)"
    else
        echo "${vcs_info_msg_0_}"
    fi
}
ssegal_prompt () {
    echo -n "%B%F{green}%m%b%f" # machine
    echo -n ":" # :
    echo -n "%B%F{blue}%~%b%f" # working dir
    ssegal_show_git
    echo -n "[%B%F{cyan}%h%b%f]" # seq num
    echo -n '%# '  # prompt
}

PROMPT='$(ssegal_prompt)'
