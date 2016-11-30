function _kubeenv()
{
    local cur opts
    cur="${COMP_WORDS[COMP_CWORD]}"
    opts="$(ls "$HOME/.kubeenv")"

    COMPREPLY=($(compgen -W "${opts}" -- ${cur}))
    return 0
}

complete -o default -F _kubeenv kubeenv kubeenv-rm
