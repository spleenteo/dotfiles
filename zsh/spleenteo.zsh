export HOSTNAME=brutus
export RAILS_ENV=development
alias PATH_TO_SITES="cd ~/Sites/"

function hg_ps1() {
    # hg prompt "(hg:[{rev}{;{rev|merge}}{ on {branch|quiet}}{ {status|modified}}])" 2> /dev/null
}
function git_ps1() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(git:\1)/'
}

# In prompt, show (at most) last three directories of path
#PS1='%F{blue}%B%3d%F{magenta}$(git_ps1)$(hg_ps1)%F{blue}:'
PS1='%F{blue}%B%3d%F{magenta}$(git_ps1)$(hg_ps1)%f:'

##### HISTORY
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000
unsetopt INC_APPEND_HISTORY         # add new items as soon as they are entered
setopt HIST_IGNORE_ALL_DUPS       # when adding commands, remove previous occurences
setopt HIST_IGNORE_SPACE          # when saving history, skip commands preceded by a space
unsetopt share_history

##### VARIOUS
setopt AUTO_CD                    # if a command is not found but is identical to a directory, assume cd
setopt EXTENDED_GLOB              # Treat  the  `#',  `~' and `^' characters as part of patterns for
                                  # filename generation, etc.
unsetopt BEEP                     # do not beep on errors


#### KEYBOARD
# Complete backwards on history using Arrow Up/Down
autoload -Uz history-search-end
zle -N history-beginning-search-backward-end \
       history-search-end
zle -N history-beginning-search-forward-end \
       history-search-end
bindkey '\e[A' history-beginning-search-backward-end
bindkey '\e[B' history-beginning-search-forward-end

# completion
zstyle :compinstall filename $HOME/.zshrc
autoload -Uz compinit
compinit

# correction
setopt correct                    # try to correct misspelt commands

# globbing
setopt no_nomatch                 # if glob expasion results in 0 results, don't give an error (useful for scp remote:*)

if which ack >/dev/null ; then
  alias a='ack'
fi

if which rmtrash >/dev/null ; then
  alias rm='rmtrash'
  alias rm-real='/bin/rm'
fi

#### UTILITY VARIE

alias statify="wget -kErpNF --level=4 -nH -np"

jgy_timestamp () {
    date +%Y%m%d%H%M%S
}
deactivate_virtualenv () {
  type deactivate > /dev/null && deactivate
}

tab() {
  osascript -e "
  tell application \"iTerm\"
   tell the first terminal
    launch session \"spleenteo\"
    tell the last session
     write text \"$@\"
    end tell
   end tell
  end tell"
}

hterm() {
  osascript -e "
  tell application \"iTerm\"
   tell the current terminal
     tell the current session
       tell application \"System Events\" to keystroke \"D\" using command down
       write text \"$@\"
      end tell
    end tell
  end tell"
}
vterm() {
  osascript -e "
  tell application \"iTerm\"
   tell the current terminal
     tell the current session
       tell application \"System Events\" to keystroke \"d\" using command down
       write text \"$@\"
      end tell
    end tell
  end tell"
}
