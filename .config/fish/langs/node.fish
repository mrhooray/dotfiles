set -x NVM_DIR ~/.nvm

function nvm
  bass source $NVM_DIR/nvm.sh --no-use ';' nvm $argv
end

function snvm
  bass source $NVM_DIR//nvm.sh
end
