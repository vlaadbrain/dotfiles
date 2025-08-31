_add_to_path_uniq() {
  local new_path=$1
  shift

  if [[ ":$PATH:" != *":$new_path:"* ]]; then
    export PATH=$new_path:$PATH
  fi
}

if [[ "$OSTYPE" == "freebsd"* || "$OSTYPE" == "linux-gnu"* ]]; then
  _add_to_path_uniq "$HOME/bin"
  if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    if [[ -d "$HOME/src/flutter" ]]; then
      export CHROME_EXECUTABLE=/usr/bin/chromium
      _add_to_path_uniq "$HOME/src/flutter/bin"
    fi
    if [[ -d "$HOME/src/android-studio" ]]; then
      _add_to_path_uniq "$HOME/src/android-studio/bin"
    fi
    if [[ -d "$HOME/Android/Sdk" ]]; then
      # https://developer.android.com/tools/variables#set
      export ANDROID_HOME=$HOME/Android/Sdk
      _add_to_path_uniq "$ANDROID_HOME/tools"
      _add_to_path_uniq "$ANDROID_HOME/tools/bin"
      _add_to_path_uniq "$ANDROID_HOME/platform-tools"
    fi
  fi
elif [[ "$OSTYPE" == "darwin"* ]]; then
  if [[ -d "/opt/homebrew/bin" ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  elif (( $+commands[brew] )); then
    eval "$(brew shellenv)"
  fi

  _add_to_path_uniq "$HOME/src/flutter/bin"

  # If you need to have openjdk@21 first in your PATH, run:
  export JAVA_HOME="/opt/homebrew/opt/openjdk@17"
  _add_to_path_uniq "${JAVA_HOME}/bin"
  # For compilers to find openjdk@21 you may need to set:
  export CPPFLAGS="-I/opt/homebrew/opt/openjdk@17/include"
  # _add_to_path_uniq "/usr/local/opt/redis@4.0/bin"
  # add ruby to the path
  _add_to_path_uniq "/opt/homebrew/opt/ruby@3.2/bin"
  if [[ -d "$HOME/Library/Android/sdk" ]]; then
    # https://developer.android.com/tools/variables#set
    export ANDROID_HOME=$HOME/Android/sdk
    _add_to_path_uniq "$ANDROID_HOME/cmdline-tools/latest/bin"
    _add_to_path_uniq "$ANDROID_HOME/build-tools/35.0.0"
    _add_to_path_uniq "$ANDROID_HOME/emulator"
    _add_to_path_uniq "$ANDROID_HOME/platform-tools"
  fi
fi

export XDG_CONFIG_HOME="${HOME}/.config"
export PATH
export EDITOR=nvim

. "$HOME/.cargo/env"
