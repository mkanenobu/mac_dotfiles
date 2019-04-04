set -g prefix ^S
set -g prefix2 F12
unbind-key -n C-a

# bind a send-prefix
bind r source-file ~/.config/byobu/.tmux.conf
set -g default-terminal "screen-256color"

# pane switch
bind h select-pane -L
bind l select-pane -R
bind k select-pane -U
bind j select-pane -D

# split pane
bind - split-window -h
bind | split-window -v

# enable mouse control
setw -g mode-mouse on
set -g mouse-select-pane on
set -g mouse-resize-pane on
set -g mouse-select-window on

# resize pane bind -r H resize-pane -L 5
bind -r H resize-pane -L 5
bind -r J resize-pane -D 5
bind -r K resize-pane -U 5
bind -r L resize-pane -R 5
