# Vi mode:
set -o vi

# History:
bind '"\C-p":history-search-backward'
bind '"\C-n":history-search-forward'
PROMPT_COMMAND="history -a; history -c; history -r"

# Default editor:
export EDITOR=nvim

# Extending path:
export PATH="$HOME/.local/bin:$PATH"

# Important locations:
workspace=~/Workspace
portal=$workspace/portal
personal=~/Personal

# FZF:
function _fzf_compgen_path {
    fdfind --hidden --follow --exclude ".git" . "$1"
}
function _fzf_compgen_dir {
    fdfind --type d --hidden --follow --exclude ".git" . "$1"
}
source /usr/share/doc/fzf/examples/key-bindings.bash
#source /usr/share/doc/fzf/examples/completion.bash
if type rg &> /dev/null; then
    export FZF_DEFAULT_COMMAND='fdfind'
    export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND
    #export FZF_DEFAULT_COMMAND='rg --files'
    #export FZF_DEFAULT_COMMAND='grep --files'
    export FZF_DEFAULT_OPTS='-m --height 50% --border'
fi

# Swapping keys:
kbid=$(xinput -list | grep -i "AT Translated Set 2 keyboard" | grep -oP 'id=\K[0-9]+')
setxkbmap -device "$kbid" -option caps:swapescape
setxkbmap -device "$kbid" -option ctrl:swap_lalt_lctl
