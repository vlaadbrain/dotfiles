export EDITOR PATH
export ATLASSIAN_TOKEN=8LvRegXzbYq5yE1i4Jq831FD
export GITHUB_TOKEN=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
export YEXT_TOKEN=${GITHUB_TOKEN}
export GIT_TOKEN=${GITHUB_TOKEN}
export NPM_TOKEN=${GITHUB_TOKEN}

if [[ "$OSTYPE" == "freebsd"* || "$OSTYPE" == "linux-gnu"* ]]; then
  PATH=$HOME/bin:$PATH
elif [[ "$OSTYPE" == "darwin"* ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

PATH="$HOME/src/flutter/bin:$PATH"
EDITOR=nvim
