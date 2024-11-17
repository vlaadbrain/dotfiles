#!/bin/bash
# ~/.bashrc.
export LS_COLORS="\
di=01;34:ex=01;32:\
*.gz=00;31:*.bz2=00;31:*.tar=00;31:*.tgz=00;31:*.zip=00;31:\
*.mp3=00;35:*.mod=00;35:*.xm=00;35:*.it=00;35:*.s3m=00;35:*.wav=00;35:\
*.au=00;35:*.mov=00;35:*.moov=00;35:*.mpg=00;35:*.mpeg=00;35:*.avi=00;35:\
*.jpg=01;35:*.gif=01;35:*.png=01;35:*.xcf=01;35:*.bmp=01;35:*.tiff=01;35:\
*.psd=01;35:*.xpm=01;35:*.xbm=01;35:*.pcx=01;35:*.pnm=01;35:*.tga=01;35:\
*.wmf=01;35:*.wjt=01;35:*.xwd=01;35:*.pic=01;35:*.tif=01;35:\
*.txt=01;37:*.html=00;32:*.htm=00;32:*.inc=00;32:*.php3=00;32:*.php=00;32:*.phps=00;32:\
*.conf=01;36:*.cfg=01;36:*.config=01;36:\
*.c=00;32:*.h=00;32:*.cpp=00;32:\
*rc=44;01;33"

if [ "$TERM" != "linux" ]; then
	test -e ~/.psrc && . ~/.psrc
	test -e ~/.tabrc && . ~/.tabrc
fi

export HOMEBREW_GITHUB_API_TOKEN=9955c5d4f835e351866afe32e550372c72a5f80b
export YEXT_TOKEN
export GITHUB_TOKEN=
export NPM_TOKEN=${YEXT_TOKEN}
