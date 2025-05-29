_add_to_path_uniq() {
  local new_path=$1
  shift

  if [[ ":$PATH:" != *":$new_path:"* ]]; then
    export PATH=$new_path:$PATH
  fi
}

export GITHUB_TOKEN=''
export YEXT_TOKEN=${GITHUB_TOKEN}
export GIT_TOKEN=${GITHUB_TOKEN}
export NPM_TOKEN=${GITHUB_TOKEN}

if [[ "$OSTYPE" == "freebsd"* || "$OSTYPE" == "linux-gnu"* ]]; then
  _add_to_path_uniq "$HOME/bin"
  if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    _add_to_path_uniq "$HOME/src/flutter/bin"
    _add_to_path_uniq "$HOME/src/android-studio/bin"
  fi
elif [[ "$OSTYPE" == "darwin"* ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
  _add_to_path_uniq "$HOME/src/flutter/bin"

  # If you need to have openjdk@21 first in your PATH, run:
  export JAVA_HOME="/opt/homebrew/opt/openjdk@17"
  _add_to_path_uniq "${JAVA_HOME}/bin"
  # For compilers to find openjdk@21 you may need to set:
  export CPPFLAGS="-I/opt/homebrew/opt/openjdk@17/include"
  # _add_to_path_uniq "/usr/local/opt/redis@4.0/bin"
  # add ruby to the path
  _add_to_path_uniq "/opt/homebrew/opt/ruby@3.2/bin"
fi

export XDG_CONFIG_HOME="${HOME}/.config"
export PATH
