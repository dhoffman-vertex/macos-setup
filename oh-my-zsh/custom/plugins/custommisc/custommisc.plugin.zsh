export EDITOR=vim
# Disable paging if output < 1 page
export LESS="-F -X $LESS"

###Aliases

alias la="ls -la"
alias sshrm="ssh-keygen -R $1"
alias dirsize='du -s * | sort -n | cut -f 2- | while read a; do du -hs "$a"; done;'
alias myps="ps auxwww"
alias portstat="lsof -i -n -P"
alias zshrc="source $HOME/.zshrc"

if [[ $OSTYPE == darwin* ]];
then
  alias flushdns='sudo dscacheutil -flushcache;sudo killall -HUP mDNSResponder;'
fi

### Functions

aws_subnet_ips () {
  aws ec2 describe-network-interfaces \
    --profile "${2:-Platform-Development}" \
    --region "${3:-us-west-2}" \
    --filters Name=subnet-id,Values="$1" | \
    jq -r '.NetworkInterfaces[].PrivateIpAddress' | \
    sort
}

weather () {
  curl "http://wttr.in/${*:-18976}"
}

rmd () {
  pandoc $1 | lynx -stdin
}

# Shamelessly stolen from CMH as a way to distribute a sane shell environment where NFS homedirs don't exist
hd ()
{
    # set the source path
    typeset source=~/git/dotfiles/server/;
    # Default to both rsync and ssh
    typeset RSYNC=1;
    typeset SSH=1;
    # Override
    case $1 in
        "-x")
	    # Only copy dotfiles, don't log in
            echo "Skipping login, just update.";
            RSYNC=1;
            SSH=0;
            shift
        ;;
        *skm*)
	    # Idiot-proofing myself
            echo "Don't rsync to an SKM server, moron!";
            RSYNC=0
        ;;
    esac;
    # Get the servername - works with user@host syntax
    typeset svr=${1##*@};
    # Check to see if this is a legit host in the ssh config, or that it's alive.
    grep --color=auto -qw ${svr} ~/.ssh/config || fping ${svr} || return 1;
    # rsync out the source directory
    (( RSYNC )) && rsync -ai --exclude='*.swp' --exclude='.git*' --exclude='*.md' $source $1:./;
    # Connect to the host
    (( SSH )) && ssh $1
}

# Generate SHA512 hash for /etc/shadow
mkshadow () {
  if [ -z "$1" ] || [ -z "$2" ]
  then
    echo "Usage: mkshadow <password> <salt>"
  else
    python -c "import crypt, getpass, pwd; \
                   print crypt.crypt('$1', '\$6\$${2}\$')"
  fi
}

# Generate ASCII QR code
qr () {
  if [ -x "$(which qrencode)" ]; then
    qrencode -t ANSI256 $1
  else
    echo "'qrencode' missing - run 'brew install qrencode' to install"
  fi
}

# Convert epoch to readable
epoch2date () {
    perl -e "print scalar(localtime($1)), \"\n\""
}

# Number of days since date
dayssince () {
  echo "$(( `gdate +%s` - `gdate -d "$1" +%s` ))/(60*60*25)" | bc
}

# Unquote URL strings
unquote () {
    python -c 'import urllib,sys; print urllib.unquote(sys.argv[1])' $1
}

# Quote URL strings
quote () {
    python -c 'import urllib,sys; print urllib.quote(sys.argv[1])' $1
}

# Lookup whois location info
whowhere () {
    whois $1 | egrep -i "(OrgName|Address|City|StateProv|PostalCode|Country)"
}

# Lookup whois email info
whoemail () {
    whois $1 | egrep -i "(OrgName|OrgAbuse)"
}

# Describe files for awk/cut processing
filedesc () {
    head $1 | awk '{print NR": "$0; for(i=1;i<=NF;++i)print "\t"i": "$i}'
}

# Describe files for awk/cut processing
filedesclim () {
    head $2 | awk -F"$1" '{print NR": "$0; for(i=1;i<=NF;++i)print "\t"i": "$i}'
}

# Port-forward VNC to host via SSH
vmssh () {
  ssh $(for i in {0..30}; do echo "-L $(( 5900 + $i)):127.0.0.1:$(( 5900 + $i )) "; done;) $1
}

# Convert IP address to Hex format
ip2hex () {
  printf '%02X' ${1//./ }; echo
}

# List inode usage by directory
dirinodes () {
    if [ -n "$1" ]; then
        PWD="$1"
    else
        PWD=`pwd`
    fi

    find $PWD -type d |
    while read line; do
        echo "$( find "$line" -maxdepth 1 | wc -l ) $line"
    done |
    sort -rn | less
}

