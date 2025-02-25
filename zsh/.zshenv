export GITHUB_TOKEN=''
export YEXT_TOKEN=${GITHUB_TOKEN}
export GIT_TOKEN=${GITHUB_TOKEN}
export NPM_TOKEN=${GITHUB_TOKEN}

# If you need to have openjdk@21 first in your PATH, run:
export JAVA_HOME="/opt/homebrew/opt/openjdk@17"
export PATH="${JAVA_HOME}/bin:$PATH"

export PATH="/opt/homebrew/bin:$PATH"

# For compilers to find openjdk@21 you may need to set:
export CPPFLAGS="-I/opt/homebrew/opt/openjdk@17/include"

#export PATH="/usr/local/opt/redis@4.0/bin:$PATH"
#
export PATH="$HOME/src/flutter/bin:$PATH"

# add ruby to the path
export PATH="/opt/homebrew/opt/ruby@3.2/bin:$PATH"
