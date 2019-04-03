unbind-key -n C-s
set -g prefix ^S
set -g prefix2 F12
# bind a send-prefix
bind r source-file ~/.config/byobu/.tmux.conf
set -g default-terminal "screen-256color"

# pane switch
bind -n M-h select-pane -L
bind -n M-l select-pane -R
bind -n M-k select-pane -U
bind -n M-j select-pane -D
