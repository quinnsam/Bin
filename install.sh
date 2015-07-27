#! /usr/bin/zsh
PWD=`pwd`
UHOME=$HOME

if [ ! -d $HOME/bin ]; then
    echo "Creating Home bin"
    mkdir $HOME/bin
fi

################################################################################
#                                Trash install
################################################################################
echo "Installing Trash [dr]"
ln -s -t $HOME/bin `pwd`/Trash/dr
ln -s -t $HOME/bin `pwd`/Trash/cleanup.sh

################################################################################
#                                Fixvnc install
################################################################################
echo "Installing Fixvnc"
ln -s -t $HOME/bin `pwd`/Fixvnc/fixvnc

################################################################################
#                                Watcher install
################################################################################
echo "Installing Watcher"
ln -s -t $HOME/bin `pwd`/Watcher/watcher.sh

cat /etc/crontab | grep watcher.sh > /dev/null 2> $HOME/logs/Bin_install.log
if [ $? ]; then
    echo "installing Watcher in crontab"
    sudo echo "*/5 * * * * root $PWD/Watcher/watcher.sh 2> $UHOME/logs/Watcher.log" >> /etc/crontab
fi 

################################################################################
#                                PhoneHome install
################################################################################
echo "Installing Phonehome"
ln -s -t $HOME/bin `pwd`/PhoneHome/PhoneHome.sh
