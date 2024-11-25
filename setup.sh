#!/bin/bash

function banner() {
	echo " _____ _  __ "
	echo "/  ___(_)/ _|"
	echo "\ \`--. _| |_ "
	echo " \`--. \ |  _|"
	echo "/\__/ / | |  "
	echo "\____/|_|_|  "
}

function check_root() {
	if [ `whoami` != "root" ];then
		echo "	[+] 当前非root用户，正在使用sudo -E重新运行。"
		sudo -E ./setup.sh
		exit
	fi
}

function install_base() {
	echo "	[+] 正在安装git，python，Java，ruby。。。"
	apt install -y git python3 python3-pip ruby-rubygems ruby-dev
	echo "	[+] 我帮你装了git python3 pip3，你自己装java8 java11吧，java8记得用oracle jdk哦~"
}

function install_from_git() {
	git clone --recurse-submodules https://github.com/lewiswu1209/sif.git /opt/sif
}

function install_from_apt() {
	echo "	[+] 正在安装nmap masscan sqlmap dirsearch。。。"
	apt install -y nmap masscan sqlmap dirsearch
	gem install evil-winrm
	gem install wpscan
}

function setup_env() {
	echo "	[+] 正在配置环境"
	echo "export PATH=\"\$PATH:/opt/sif/bin\"" > /etc/profile.d/sif.sh
}

function setup_app() {
	chmod +x /opt/sif/auxiliary/Fast-Google-Dorks-Scan/FGDS.sh
}

function install_by_wget() {
	wget https://github.com/AntSwordProject/AntSword-Loader/releases/download/4.0.3/AntSword-Loader-v4.0.3-linux-x64.zip -O /tmp/antsword-loader.zip
	unzip /tmp/antsword-loader.zip -d /opt/sif/auxiliary/
	mv /opt/sif/auxiliary/AntSword* /opt/sif/auxiliary/AntSword
	chmod -R 644 /opt/sif/auxiliary/AntSword
	chmod 755 /opt/sif/auxiliary/AntSword
	chmod 755 /opt/sif/auxiliary/AntSword/AntSword
	wget "https://portswigger-cdn.net/burp/releases/download?product=pro&version=2022.11.4&type=Jar" -O /opt/sif/auxiliary/Burpsuite/burpsuite_pro_v2022.11.4.jar
	wget "https://github.com/chaitin/xpoc/releases/download/0.1.0/xpoc_linux_amd64.zip" -O /tmp/xpoc_linux_amd64.zip
	unzip /tmp/xpoc_linux_amd64.zip -d /opt/sif/auxiliary/xray/
	mv /opt/sif/auxiliary/xray/xpoc_linux_amd64 /opt/sif/auxiliary/xray/xpoc
	wget "https://github.com/chaitin/xapp/releases/download/xapp-0.0.2/xapp_linux_amd64" -O /opt/sif/auxiliary/xray/xapp
	wget "https://github.com/rebeyond/Behinder/releases/download/Behinder_v4.1%E3%80%90t00ls%E4%B8%93%E7%89%88%E3%80%91/Behinder_v4.1.t00ls.zip" -O /tmp/Behinder.zip
	unzip /tmp/Behinder.zip -d /opt/sif/auxiliary/Behinder/
	wget "https://github.com/BeichenDream/Godzilla/releases/download/v4.0.1-godzilla/godzilla.jar" -O /opt/sif/auxiliary/Godzilla/godzilla.jar
	wget "https://github.com/lewiswu1209/armitage/releases/download/v0.0.1/armitage.zip" -O /tmp/armitage.zip
	unzip /tmp/armitage.zip -d /opt/sif/auxiliary/Armitage/
	wget "https://github.com/Lotus6/ThinkphpGUI/releases/download/1.3/ThinkphpGUI-1.3-SNAPSHOT.jar" /opt/sif/exploits/ThinkphpGUI/ThinkphpGUI-1.3-SNAPSHOT.jar
	wget -P /opt/sif/post/fscan/ "https://github.com/shadow1ng/fscan/releases/download/1.8.4/fscan"
	wget -P /opt/sif/post/fscan/ "https://github.com/shadow1ng/fscan/releases/download/1.8.4/fscan32"
	wget -P /opt/sif/post/fscan/ "https://github.com/shadow1ng/fscan/releases/download/1.8.4/fscan.exe"
	wget -P /opt/sif/post/fscan/ "https://github.com/shadow1ng/fscan/releases/download/1.8.4/fscan32.exe"
	wget -P /opt/sif/post/fscan/ "https://github.com/shadow1ng/fscan/releases/download/1.8.4/fscan_mac"
	wget -P /opt/sif/post/fscan/ "https://github.com/shadow1ng/fscan/releases/download/1.8.4/fscan_mac_arm64"
	wget -P /opt/sif/post/linpeas/ "https://github.com/peass-ng/PEASS-ng/releases/download/20241101-6f46e855/linpeas.sh"
	wget -P /opt/sif/post/linpeas/ "https://github.com/peass-ng/PEASS-ng/releases/download/20241101-6f46e855/linpeas_darwin_amd64"
	wget -P /opt/sif/post/linpeas/ "https://github.com/peass-ng/PEASS-ng/releases/download/20241101-6f46e855/linpeas_darwin_arm64"
	wget -P /opt/sif/post/linpeas/ "https://github.com/peass-ng/PEASS-ng/releases/download/20241101-6f46e855/linpeas_fat.sh"
	wget -P /opt/sif/post/linpeas/ "https://github.com/peass-ng/PEASS-ng/releases/download/20241101-6f46e855/linpeas_linux_386"
	wget -P /opt/sif/post/linpeas/ "https://github.com/peass-ng/PEASS-ng/releases/download/20241101-6f46e855/linpeas_linux_amd64"
	wget -P /opt/sif/post/linpeas/ "https://github.com/peass-ng/PEASS-ng/releases/download/20241101-6f46e855/linpeas_linux_arm"
	wget -P /opt/sif/post/linpeas/ "https://github.com/peass-ng/PEASS-ng/releases/download/20241101-6f46e855/linpeas_linux_arm64"
	wget -P /opt/sif/post/linpeas/ "https://github.com/peass-ng/PEASS-ng/releases/download/20241101-6f46e855/linpeas_small.sh"
	wget -P /opt/sif/post/linpeas/ "https://github.com/peass-ng/PEASS-ng/releases/download/20241101-6f46e855/winPEAS.bat"
	wget -P /opt/sif/post/linpeas/ "https://github.com/peass-ng/PEASS-ng/releases/download/20241101-6f46e855/winPEASany.exe"
	wget -P /opt/sif/post/linpeas/ "https://github.com/peass-ng/PEASS-ng/releases/download/20241101-6f46e855/winPEASany_ofs.exe"
	wget -P /opt/sif/post/linpeas/ "https://github.com/peass-ng/PEASS-ng/releases/download/20241101-6f46e855/winPEASx64.exe"
	wget -P /opt/sif/post/linpeas/ "https://github.com/peass-ng/PEASS-ng/releases/download/20241101-6f46e855/winPEASx64_ofs.exe"
	wget -P /opt/sif/post/linpeas/ "https://github.com/peass-ng/PEASS-ng/releases/download/20241101-6f46e855/winPEASx86.exe"
	wget -P /opt/sif/post/linpeas/ "https://github.com/peass-ng/PEASS-ng/releases/download/20241101-6f46e855/winPEASx86_ofs.exe"
	wget "https://github.com/gentilkiwi/mimikatz/releases/download/2.2.0-20220919/mimikatz_trunk.zip" -O /tmp/mimikatz.zip
	unzip /tmp/mimikatz.zip -d /opt/sif/post/mimikatz/
	
}

banner
check_root
install_base
install_from_apt
install_from_git
install_by_wget
setup_env
setup_app
