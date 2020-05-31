# Increase history size
HISTSIZE=5000
HISTFILESIZE=10000


# TM (add at the end) *********************
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
TM_TEMP=`echo $PS1 | sed '$ s/..$//'`
if [ `whoami` != 'root' ]; then
  export PS1="$TM_TEMP\[\033[33m\]\$(parse_git_branch)\[\033[00m\]$ "
fi
alias gs='git status'
alias gp='git pull'
alias gk='gitk'
alias gcm='git checkout master'
alias gcd='git checkout develop'
alias gl='git log -1 | grep "    B" | awk '"'"'{$1=$1};1'"'"' | xclip '

# Replace Ctrl-C with Ctrl-J, so I could use copy/paste normally on Linux
stty intr ^J

# Aliases for tools
alias maven-on='export PATH=~/java/maven/apache-maven-3.6.0/bin:$PATH'

# Set default rights
umask 0077
