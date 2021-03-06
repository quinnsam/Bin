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
ln -fs -t $HOME/bin `pwd`/Trash/dr
ln -fs -t $HOME/bin `pwd`/Trash/cleanup.sh

################################################################################
#                                Fixvnc install
################################################################################
echo "Installing Fixvnc"
echo "#!/usr/bin/zsh" > $HOME/bin/fixvnc
echo "sudo x11vnc -norc -localhost -forever -shared -rfbauth /etc/init/x11vnc.pass -autoport 5900 -avahi -env X11VNC_AVAHI_NAME='$HOST' -desktop '$HOST Remote Desktop' -repeat -bg -o /var/log/x11vnc.log" >> $HOME/bin/fixvnc
chmod +x $HOME/bin/fixvnc

###############################################################################
#                                Watcher install
################################################################################
echo "Installing Watcher"
ln -fs -t $HOME/bin `pwd`/Watcher/watcher.sh

cat /etc/crontab | grep watcher.sh > /dev/null 2> $HOME/logs/Bin_install.log
if [ $? -eq 1 ]; then
    echo "installing Watcher in crontab"
    echo 'Please run to finish intsall: sudo -u root echo "*/5 * * * * root $PWD/Watcher/watcher.sh 2> $UHOME/logs/Watcher.log" >> /etc/crontab'
fi 

################################################################################
#                                PhoneHome install
################################################################################
echo "Installing Phonehome"
if [[ "$HOST" = "Alpha" || "$HOST" = "Chi" ]]; then
    ln -fs -t $HOME/bin `pwd`/PhoneHome/PhoneHome.sh
fi
