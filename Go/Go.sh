#!/bin/bash -xe

#
# Reference: https://go.dev/dl/
# Visit the reference URL, and find out the correct download URL of the needed .tar.gz file
# Example: https://go.dev/dl/go1.21.1.linux-amd64.tar.gz
#
# And change the Environment Variables below accordingly
#

export GoInstallerFile=go1.21.1.linux-amd64.tar.gz
echo $GoInstallerFile
export GoInstallerURL=https://go.dev/dl/$GoInstallerFile
echo $GoInstallerURL



#╔═════════════════════════╗
#║   DownLoad and UnPack   ║
#╚═════════════════════════╝

#
# DownLoad
#

cd $HOME;sudo curl -k -L -O --retry 333 $GoInstallerURL;sudo chmod 777 $HOME/$GoInstallerFile
sudo ls -lap

#
# UnPack Properly with Clean Start
#

sudo ls -lap /usr/local/go
sudo rm -rf /usr/local/go
sudo ls -lap /usr/local/go
sudo tar -C /usr/local -xzf $GoInstallerFile
sudo ls -lap /usr/local/go



#╔══════════════════════════════════════════╗
#║   Modify the PATH Environment Variable   ║
#╚══════════════════════════════════════════╝

#
# Modify the PATH Environment Variable Permanently
#

sudo cat /etc/environment
sudo sed -e '/^PATH/s/"$/:\/usr\/local\/go\/bin"/g' -i /etc/environment
sudo cat /etc/environment

#
# Modify the PATH Environment Variable for this session, so it can be used directly
#

echo $PATH
export PATH=$PATH:/usr/local/go/bin
echo $PATH



#╔══════════╗
#║   Test   ║
#╚══════════╝

go version
go env



#╔═╦═════════════════╦═╗
#║ ║                 ║ ║
#╠═╬═════════════════╬═╣
#║ ║ End of Document ║ ║
#╠═╬═════════════════╬═╣
#║ ║                 ║ ║
#╚═╩═════════════════╩═╝


