alias c="clear"
alias utar="tar -zxvf"
alias reload="source /home/bhasky/.bashrc"
alias ..="cd ../"
alias ...="cd ../../"
alias ....="cd ../../../"
alias localip="ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p'"

function wificonn()
{
    while(true); do
        x=$(localip)
        echo "Ur IP is $x" 

        if [[ "$x" == 10.* ]]; then
            break;
        else
            echo "Retrying..."
            sudo dhclient -r wlan0
            sudo dhclient wlan0
            x=$(localip)
        fi
    done
}
alias wificonn="wificonn"
alias k="kill %%"

# only show dot files
alias lsh="ls -ld .??*"

# rename all the files which contain uppercase letters to lowercase in the current folder
function filestolower(){
  read -p "This will rename all the files and directories to lowercase in the current folder, continue? [y/n]: " letsdothis
  if [ "$letsdothis" = "y" ] || [ "$letsdothis" = "Y" ]; then
    for x in `ls`
      do
      skip=false
      if [ -d $x ]; then
        read -p "'$x' is a folder, rename it? [y/n]: " renamedir
        if [ "$renamedir" = "n" ] || [ "$renameDir" = "N" ]; then
          skip=true
        fi
      fi
      if [ "$skip" == "false" ]; then
        lc=`echo $x  | tr '[A-Z]' '[a-z]'`
        if [ $lc != $x ]; then
          echo "renaming $x -> $lc"
          mv $x $lc
        fi
      fi
    done
  fi
}

# Generates a tree view from the current directory
#function tree(){
#        pwd
#        ls -R | grep ":$" |   \
#        sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'
#}

# This function searches all files below the current directory for a file
# containing a string eg: search "#include"
# Need to modify this coz the eg doesn't look good
function search(){
    find ./ -type f -exec grep -n "$1" {} \; -print 2>/dev/null
}
alias search="search"
