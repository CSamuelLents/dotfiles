export ZSH="/Users/lents/.oh-my-zsh"

# Set theme.
ZSH_THEME="robbyrussell"

# Enable oh-my-zsh plugins.
plugins=(git colored-man-pages)

# Custom paths
export PATH=$HOME/Library/Python/3.8/bin:$HOME/bin:/opt/homebrew/bin:$HOME/bin:/opt/homebrew/sbin:/opt/homebrew/opt/openjdk/bin:/usr/local/bin:/usr/local/sbin:$PATH

# Loads nvm
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Allows compilers to find OpenJDK
export CPPFLAGS="-I/opt/homebrew/opt/openjdk/include"

# Include alias file (if present) containing aliases for ssh, etc.
if [ -f ~/.aliases ]; then
    source ~/.aliases
fi

# Set architecture-specific brew share path.
arch_name="$(uname -m)"
if [ "${arch_name}" = "x86_64" ]; then
    share_path="/usr/local/share"
elif [ "${arch_name}" = "arm64" ]; then
    share_path="/opt/homebrew/share"
else
    echo "Unknown architecture: ${arch_name}"
fi

# Git aliases.
alias gs='git status'
alias gc='git commit'
alias gp='git pull --rebase'
alias gcam='git commit -am'
alias gl='git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit'

# Git upstream branch syncer.
# Usage: gsync master (checks out master, pull upstream, push origin).
function gsync() {
    if [[ ! "$1" ]]; then
        echo "You must supply a branch."
        return 0
    fi

    BRANCHES=$(git branch --list $1)

    if [ ! "$BRANCHES" ]; then
        echo "Branch $1 does not exist."
        return 0
    fi

    git checkout "$1" &&
        git pull upstream "$1" &&
        git push origin "$1"
}

source $ZSH/oh-my-zsh.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion
