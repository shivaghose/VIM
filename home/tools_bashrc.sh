# bash configuration for tools I commonly use

# FLAMEGRAPHS
## flamegraph is an awesome stack visualizer for performance made by Brendan Gregg
## src: https://github.com/brendangregg/FlameGraph
export FLAME_GRAPH_DIR="$HOME/git/FlameGraph"
alias makeflame='perf script | $FLAME_GRAPH_DIR/stackcollapse-perf.pl | $FLAME_GRAPH_DIR/flamegraph.pl > profile_$(date +'%Y%m%d')_$(date +'%H%M%S').svg'


# FZF
## fzf is used for fuzzy finding things
## `src: https://github.com/junegunn/fzf
export FZF_DEFAULT_OPTS='--height 40% --reverse --border'
# fd is faster than rg for finding files
if ! location_fd="$(type -p "fd")" || [[ -z $location_fd ]]; then
    export FZF_DEFAULT_COMMAND='fd --type file --follow --hidden --exclude .git'
    # Colored output BEGIN
    export FZF_DEFAULT_COMMAND="$FZF_DEFAULT_COMMAND --color=always"
    export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS --ansi"
    # Colored output END
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    alias ag='rg'
# Otherwise use ripgrep if available
elif ! location_rg="$(type -p "rg")" || [ -z "$location_rg" ]; then
    export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    alias ag='rg'
fi
# Use ctrl+p to quickly find and edit files with vim
ctrl_p() {
    local files_to_edit
    files_to_edit=$(fzf-tmux --exit-0 --multi)
    if [[ $files_to_edit ]]; then
        vim -p "$files_to_edit"
    fi
}
bind -x '"\C-p": ctrl_p;'


# CLANG
# export CC=clang-6.0
# export CXX=clang++-6.0
