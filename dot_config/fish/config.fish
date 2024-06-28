# モダンなCLIツールを使用したエイリアス
alias l='eza --icons'
alias ls='eza --icons'
alias ll='eza -lah --icons'
alias la='eza -a --icons'
alias tree='eza --tree --icons'
alias cat='bat'
alias grep='rg'
alias find='fd'
alias k='kubectl'

# その他の便利なエイリアス
alias ..='cd ..'
alias ...='cd ../..'

# 環境変数の設定
set -x PATH $HOME/bin $PATH
set -x EDITOR nvim

# fzfの設定
set -x FZF_DEFAULT_COMMAND 'fd --type f --hidden --follow --exclude .git'
set -x FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"

# starshipの初期化
starship init fish | source

# fish起動時のメッセージ
function fish_greeting
    echo "Welcome to your modern fish shell with starship prompt!"
end

# キーバインディング
function fish_user_key_bindings
    # fzfを使用した履歴検索
    bind \cr 'history | fzf | read -l result; and commandline -- $result'
    
    # fzfを使用したファイル検索
    bind \ct 'fd --type f --hidden --follow --exclude .git | fzf | read -l result; and commandline -- $result'
end
