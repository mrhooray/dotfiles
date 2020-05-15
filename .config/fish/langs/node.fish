set -x NVM_DIR ~/.nvm

function nvm
  bass source $NVM_DIR/nvm.sh --no-use ';' nvm $argv
end

function nvm_lts
  set -l next (nvm version-remote --lts)
  set -l curr (nvm version (string split . $next)[1])
  if test $curr != $next
    nvm install --lts --latest-npm
    nvm reinstall-packages $curr
    nvm uninstall $curr
    nvm cache clear
  end
end

function snvm
  bass source $NVM_DIR//nvm.sh
end
