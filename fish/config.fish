if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Mute fish greeting
set fish_greeting

# ENVVARS
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.emacs.d/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
export MANPATH="/home/linuxbrew/.linuxbrew/share/man:$MANPATH"
export INFOPATH="/home/linuxbrew/.linuxbrew/share/info:$INFOPATH"
export LC_ALL=C


zoxide init fish | source
thefuck --alias | source

alias vif   "vim (fzf --preview 'batcat --color=always --style=numbers --line-range=:500 {}')"

# abbr
abbr py     "python3"
abbr fr     "friendly"
abbr bat    "batcat"

abbr ga     "git add ."
abbr gb     "git branch"
abbr gcm    "git commit"
abbr gps     "git push"
abbr gpl     "git pull"
abbr gco    "git checkout"
abbr gd     "git diff"
abbr gl     "git lg"
abbr gst    "git status"

abbr tl     "tmux ls"
abbr ta     "tmux attach"


if command -v exa > /dev/null
	abbr -a l   'exa -l -s type'
else
    abbr -a l   'ls'
end
abbr -a ll  'ls -l'
abbr -a lll 'ls -la'

set __fish_git_prompt_show_informative_status

function fish_prompt
	set_color brblack
	echo -n "["(date "+%H:%M")"] "

	set_color 3bb 
    echo -n (whoami)

	set_color bbb 
    echo -n "."

	set_color b6b 
    echo -n (hostname) | sed 's/.local//'
	if [ $PWD != $HOME ]
		set_color brblack
		echo -n ':'
		set_color yellow
		echo -n (basename $PWD)
	end
	set_color green
	printf '%s ' (__fish_git_prompt)
	set_color red
	echo -n '| '
	set_color normal
end
