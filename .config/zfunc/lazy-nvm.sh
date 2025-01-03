function lazy_nvm {
  unset -f nvm
  unset -f npm
  # unset -f node
  unset -f npx

  if [ -d "${HOME}/.nvm" ]; then
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # linux
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
  fi
}

# aliases
function nvm { lazy_nvm; nvm "$@"; }
function npm { lazy_nvm; npm "$@"; }
# function node { lazy_nvm; node "$@"; }
function npx { lazy_nvm; npx "$@"; }
