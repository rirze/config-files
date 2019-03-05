cl(){ cd "$@" && la; }
#mkdircd(){ mkdir "$@" && cd $@; }

extract () {
   if [ -f $1 ] ; then
       case $1 in
	   *.tar.bz2)   tar xvjf $1    ;;
	   *.tar.gz)    tar xvzf $1    ;;
	   *.bz2)       bunzip2 $1     ;;
	   *.rar)       unrar x $1       ;;
	   *.gz)        gunzip $1      ;;
	   *.tar)       tar xvf $1     ;;
	   *.tbz2)      tar xvjf $1    ;;
	   *.tgz)       tar xvzf $1    ;;
	   *.zip)       unzip $1       ;;
	   *.Z)         uncompress $1  ;;
	   *.7z)        7z x $1        ;;
	   *)           echo "don't know how to extract '$1'..." ;;
       esac
   else
       echo "'$1' is not a valid file!"
   fi
}

#
# Defines transfer alias and provides easy command line file and folder sharing.
#
# Authors:
#   Remco Verhoef <remco@dutchcoders.io>
#

transfer() {
    # check arguments
    if [ $# -eq 0 ];
    then
	echo "No arguments specified. Usage:\necho transfer /tmp/test.md\ncat /tmp/test.md | transfer test.md"
	return 1
    fi

    # get temporarily filename, output is written to this file show progress can be showed
    tmpfile=$( mktemp -t transferXXX )

    # upload stdin or file
    file=$1

    if tty -s;
    then
	basefile=$(basename "$file" | sed -e 's/[^a-zA-Z0-9._-]/-/g')

	if [ ! -e $file ];
	then
	    echo "File $file doesn't exists."
	    return 1
	fi

	if [ -d $file ];
	then
	    # zip directory and transfer
	    zipfile=$( mktemp -t transferXXX.zip )
	    cd $(dirname $file) && zip -r -q - $(basename $file) >> $zipfile
	    curl --progress-bar --upload-file "$zipfile" "https://transfer.sh/$basefile.zip" >> $tmpfile
	    rm -f $zipfile
	else
	    # transfer file
	    curl --progress-bar --upload-file "$file" "https://transfer.sh/$basefile" >> $tmpfile
	fi
    else
	# transfer pipe
	curl --progress-bar --upload-file "-" "https://transfer.sh/$file" >> $tmpfile
    fi

    # cat output link
    cat $tmpfile

    # cleanup
    rm -f $tmpfile
}

gtcl() {
    git clone "$1" && cd "$(basename "$1" .git)"
}


#better history, merges history from multiple sessions
#stolen from http://eli.thegreenplace.net/2013/06/11/keeping-persistent-history-in-bash

log_bash_persistent_history()
{
    [[
	$(history 1) =~ ^\ *[0-9]+\ +([^\ ]+\ [^\ ]+)\ +(.*)$
    ]]
    local date_part="${BASH_REMATCH[1]}"
    local command_part="${BASH_REMATCH[2]}"
    if [ "$command_part" != "$PERSISTENT_HISTORY_LAST" ]
    then
	echo $date_part "|" "$command_part" >> ~/.persistent_history
	export PERSISTENT_HISTORY_LAST="$command_part"
    fi
}
