# Set the terminal variable helps i3 decide what to do.
if type alacritty > /dev/null; then
    export TERMINAL=alacritty
elif type termite > /dev/null; then
    export TERMINAL=termite
fi

# Start X if we should.
# TODO: root?
if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
	exec startx &> $HOME/.Xoutput
fi

[[ -f ~/.bashrc ]] && . ~/.bashrc

