# nmap, apache2, php, git, gcc, ibus-mozc, golang, gdb-peda, ruby, metasploit-framework, ffuf, sqlmap, john-the-ripper, 

sudo apt update -y & sudo apt upgrade -y

sudo apt install nmap apache2 php git gcc make ibus-mozc golang build-essential libssl-dev zlib1g-dev libpq-dev libpcap-dev libsqlite3-dev -y
sudo apt install  yasm libgmp-dev libnss3-dev libkrb5-dev pkg-config libbz2-dev 

mkdir ~/tools

git clone https://github.com/longld/peda.git ~/tools/peda
echo "source ~/tools/peda/peda.py" >> ~/.gdbinit

git clone https://github.com/radare/radare2.git ~/tools/radare2
cd ~/tools/radare2
./sys/install.sh

git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="~/.rbenv/bin:$PATH"' >> ~/.bashrc
~/.rbenv/bin/rbenv init >> ~/.bashrc
source ~/.bashrc
git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build

rbenv install 2.6.5
rbenv global 2.6.5

curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > ~/tools/msfinstall
sudo chmod 755 ~/tools/msfinstall
sudo ./tools/msfinstall

git clone https://github.com/ffuf/ffuf ~/tools/ffuf; cd ~/tools/ffuf ; go get ; go build

git clone https://github.com/danielmiessler/SecLists ~/SecLists

git clone --depth 1 https://github.com/sqlmapproject/sqlmap.git ~/tools/sqlmap

git clone https://github.com/openwall/john ~/tools/john
cd ~/tools/john/src
./configure && make -s clean && make -sj4
