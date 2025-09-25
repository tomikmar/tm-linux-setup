# Config for "Git Bash" on Windows
echo "Running my ~/.bash_profile"

alias gs='git status'
alias gp='git pull'
alias gk='gitk'
alias gcm='git checkout master'
alias gcd='git checkout develop'

# Replace Ctrl-C with Ctrl-J
stty intr ^J



# Based on:
# https://docs.github.com/en/authentication/connecting-to-github-with-ssh/working-with-ssh-key-passphrases#auto-launching-ssh-agent-on-git-for-windows
env=~/.ssh/agent.env

agent_load_env () { test -f "$env" && . "$env" >| /dev/null ; }

agent_start () {
    (umask 077; ssh-agent -t 1h >| "$env")
    . "$env" >| /dev/null ; }

agent_load_env

agent_run_state=$(ssh-add -l >| /dev/null 2>&1; echo $?)

if [ ! "$SSH_AUTH_SOCK" ] || [ $agent_run_state = 2 ]; then
    agent_start
	echo "SSH agent - starting ..."
    #ssh-add ->  ~/.ssh/config -> AddKeysToAgent yes
elif [ "$SSH_AUTH_SOCK" ] && [ $agent_run_state = 1 ]; then
	echo "SSH agent - already started (no key present)"
elif [ "$SSH_AUTH_SOCK" ] && [ $agent_run_state = 0 ]; then
	echo "SSH agent - already started (key present)"
fi

unset env

