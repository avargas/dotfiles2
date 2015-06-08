if [ "$HISTFILE_CONFIGURED" != "true" ]
then
    [ -d ~/.history ] || mkdir --mode=0700 ~/.history
    [ -d ~/.history ] && chmod 0700 ~/.history

    export HISTFILE_CONFIGURED=true
    export HISTTIMEFORMAT='%F %T '
    export HISTFILE="$HOME/.history/history-$(date +%Y-%m-%d.%H:%M:%S).$$"

    # close any old history file by zeroing HISTFILESIZE  
    export HISTFILESIZE=0  
    # then set HISTFILESIZE to a large value
    export HISTFILESIZE=10000  
    export HISTSIZE=10000

    # quickly load all history
    cat ~/.history/history* 2>/dev/null > ~/.history/.all || true
    _prev=$HISTFILE
    export HISTFILE="$HOME/.history/.all"
    history -r
    rm -f $HOME/.history/.all
    export HISTFILE=$_prev

    # append and save each time a command is done
    export PROMPT_COMMAND="history -a; $PROMPT_COMMAND"
fi