#!/bin/bash

# This file is aimed to set up mutt automatically with ever used mutt 
# configuration files. All configuration file are stored in a single named 
# ~/.mail_configs/ and what we need to do is to make some symbolic links and 
# install some required packages.
#
# This script is not useful for other configurations using different mail 
# configurations, the username and password in the configurations wouldn't be 
# changed. It can simplify the steps when I move to a new installed machine 
# with my preused configuration files.
#

GOOBOOK_TAR_FILE="goobook-1.4alpha4.tar.gz"
SUFIX=".tar.gz"
BACKUP_DIR="$HOME/mutt_backup"
BASE_DIR="$HOME/mutt_backup"
DIR_NAME=""

# The current folder should named as ~/.mail_configs, if not, exit and prompt 
# to user to rename it.
PWD=$(pwd)
DESIRE_DIR="$HOME/.mail_configs"
if [ ${PWD} != ${DESIRE_DIR} ]
then
    echo "Please rename the folder into home directory"
    echo "And rename it as .mail_configs"
    exit -1
fi

test if you have the goobook package downloaded, if not, download it.
if [ ! -f ${GOOBOOK_TAR_FILE} ]
then
    wget http://pypi.python.org/packages/source/g/goobook/goobook-1.4alpha4.tar.gz#md5=cc5de52b333c7ae596d9b4c8a297fce0
fi

# test if the BACKUP_DIR var with existing folder
i=1
while [ -d ${BACKUP_DIR} ]
do
    BACKUP_DIR=${BASE_DIR}-${i}
    i=$(expr $i + 1)
done

mkdir ${BACKUP_DIR} || exit -1

# install the required packages.
sudo apt-get install mutt -y  || exit -1
echo "mutt installed successfully!" 
sudo apt-get install urlview -y || exit -1
echo "urlview installed successfully!" || exit -1
sudo apt-get install offlineimap -y || exit -1
echo "offlineimap installed successfully!" || exit -1
sudo apt-get install imapfilter -y || exit -1
echo "imapfilter installed successfully!" || exit -1
sudo apt-get install msmtp-mta -y || exit -1
echo "msmtp-mta installed successfully!" || exit -1
sudo apt-get install archivemail -y || exit -1
echo "archivemail install successfully!" 
sudo apt-get install python-keyring -y || exit -1

# install goobook
# first check if the downloaded package exists
if [ -f ${GOOBOOK_TAR_FILE} ]
then
    # untar and unzip the file
    tar xzvf ${GOOBOOK_TAR_FILE}
    DIR_NAME=$(echo ${GOOBOOK_TAR_FILE} | sed "s/${SUFIX}//")
    cd $DIR_NAME
    sudo python ./setup.py install || exit -1
    cd ..

    if [ ! -f ~/.mail_configs/netrc ]
    then
        echo "~/.mail_configs/netrc doesn't exists"
        exit -1
    fi

    # make the symbolic link for ~/.netrc
    ln -s ~/.mail_configs/netrc ~/.netrc  
    if [ ! $? -eq 0 ]
    then
        mv ~/.netrc ${BACKUP_DIR}/netrc.bk
        ln -s ~/.mail_configs/netrc ~/.netrc 
    fi

    if [ ! -f ~/.mail_configs/goobookrc ]
    then
        echo "~/.mail_configs/goobookrc doesn't exists"
        exit -1
    fi

    # make the symbolic link for ~/.goobookrc
    ln -s ~/.mail_configs/goobookrc ~/.goobookrc
    if [ ! $? -eq 0 ]
    then
        mv ~/.goobookrc ${BACKUP_DIR}/goobookrc.bk
        ln -s ~/.mail_configs/goobookrc ~/.goobookrc
    fi

else
    echo "${GOOBOOK_TAR_FILE} doen't exists!"
    echo "Please download the file needed!"
    exit -1
fi

# install mutt suite
#
# make symbolic link for ~/.mutt
if [ ! -d ~/.mail_configs/mutt ]
then
    echo "~/.mail_configs/mutt doesn't exists"
    exit -1
fi

if [ -h ~/.mutt ]
then
    rm ~/.mutt
fi
if [ -d ~/.mutt ]
then
    echo "move ~/.mutt to back up directory"
    mv ~/.mutt ${BACKUP_DIR}/mutt.bk
fi
ln -s ~/.mail_configs/mutt ~/.mutt

# make symbolic link for ~/.msmtprc
if [ ! -f ~/.mail_configs/msmtprc ]
then
    echo "~/.mail_configs/msmtprc doesn't exists"
    exit -1
fi
ln -s ~/.mail_configs/msmtprc ~/.msmtprc
if [ ! $? -eq 0 ]
then
    mv ~/.msmtprc ${BACKUP_DIR}/msmtprc.bk
    ln -s ~/.mail_configs/msmtprc ~/.msmtprc
fi

# make symbolic link for ~/.offlineimaprc
if [ ! -f ~/.mail_configs/offlineimaprc ]
then
    echo "~/.mail_configs/offlineimaprc doesn't exists"
    exit -1
fi
ln -s ~/.mail_configs/offlineimaprc ~/.offlineimaprc
if [ ! $? -eq 0 ]
then
    mv ~/.offlineimaprc ${BACKUP_DIR}/offlineimaprc.bk
    ln -s ~/.mail_configs/offlineimaprc ~/.offlineimaprc
fi

# make symbolic link for ~/.imapfilter
if [ ! -d ~/.mail_configs/imapfilter ]
then
    echo "~/.mail_configs/imapfilter doesn't exists"
    exit -1
fi
if [ -h ~/.imapfilter ]
then
    rm ~/.imapfilter
fi
if [ -d ~/.imapfilter ]
then
    echo "move ~/.imapfilter to back up directory"
    mv ~/.imapfilter ${BACKUP_DIR}/imapfilter.bk
fi
ln -s ~/.mail_configs/imapfilter ~/.imapfilter

# make symbolic link for ~/.offlineimap.py
if [ ! -f ~/.mail_configs/.offlineimap.py ]
then
    echo "~/.mail_configs/.offlineimap.py doesn't exists"
    exit -1
fi
ln -s ~/.mail_configs/.offlineimap.py ~/.offlineimap.py
if [ ! $? -eq 0 ]
then
    mv ~/.offlineimap.py ${BACKUP_DIR}/offlineimap.py.bk
    ln -s ~/.mail_configs/.offlineimap.py ~/.offlineimap.py
fi


# clean up the unnecessary files and folders
rm -f "${GOOBOOK_TAR_FILE}" || exit -1
sudo rm -rf "${DIR_NAME}" || exit -1

echo "Inter the imap server name, such as imap.gmail.com"
chmod +x imap-passwords && ./imap-passwords

# done
echo "Install and configura mutt successfully!"

