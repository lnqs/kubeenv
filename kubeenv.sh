function kubeenv() {
    if [ x"$#" != x"1" ]; then
        echo "Usage: kubeenv NAME" >&2
        return 2
    fi

    if [ x"$KUBEENV" != x"" ]; then
        kubeenv-disable
    fi

    KUBEENV="$1"
    export KUBEENV

    mkdir -p "$HOME/.kubeenv"
    touch "$HOME/.kubeenv/$KUBEENV"

    KUBECONFIG="$HOME/.kubeenv/$KUBEENV"
    export KUBECONFIG

    KUBEENV_PRE_PS1="$PS1"
    PS1="($1) $PS1"
}

function kubeenv-disable() {
    PS1="$KUBEENV_PRE_PS1"

    unset KUBECONFIG
    unset KUBEENV
    unset KUBEENV_PRE_PS1
}

function kubeenv-rm() {
    if [ x"$#" != x"1" ]; then
        echo "Usage: kubeenv-rm NAME" >&2
        return 2
    fi

    if [ x"$KUBEENV" == x"$1" ]; then
        echo "Can't delete active kubeenv. Run kubeenv-disable before" >&2
        return 2
    fi

    if [ ! -e "$HOME/.kubeenv/$1" ]; then
        echo "kubeenv $1 doesn't exist" >&2
        return 2
    fi

    rm -f "$HOME/.kubeenv/$KUBEENV"
}