if [ "$PS1" ] ; then
  dotfiles=$HOME/.dotfiles

  source $dotfiles/zsh/functions

  source_if_exists $dotfiles/zsh/term
  source_if_exists $dotfiles/zsh/config
  source_if_exists $dotfiles/zsh/key-bindings
  source_if_exists $dotfiles/zsh/prompt
  source_if_exists $dotfiles/zsh/aliases
  source_if_exists $dotfiles/zsh/ruby
  source_if_exists $dotfiles/zsh/completion
  source_if_exists $dotfiles/zsh/config.$(short_hostname)

  if [ "$KBD_LAYOUT" = 'colemak' ]; then
    source_if_exists $dotfiles/zsh/colemak
    source_if_exists $dotfiles/zsh/vi-cmd-bindings
    source_if_exists $dotfiles/zsh/incremental-search
  fi
fi
