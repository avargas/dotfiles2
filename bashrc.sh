#set -x

_reload()
{
  source ~/.bashrc
}

DIR="$(dirname $(readlink -f ${BASH_SOURCE[0]}))"
EXTRAS="$DIR/bashrc-extras"

export PATH=$PATH:$HOME/bin


# include extra files
for f in $( find "$EXTRAS" -type f -print | sort )
do
 . $f
done


# clean up $PATH, remove duplicates but keep order
export PATH=$(echo $PATH | grep -oE ':?[^:]+' | sed 's/^://g' | nl|sort -k2 -k 1,1nr|uniq -f1|sort -n|cut -f2 | tr "\n" ":")