
ln -fs /usr/share/zoneinfo/Asia/Hong_Kong /etc/localtime
DEBIAN_FRONTEND=noninteractive apt-get install -y tzdata
dpkg-reconfigure --frontend noninteractive tzdata

apt install -y dialog python3-dev make git bc gcc flex bison ninja-build libssl-dev \
      rsync pkg-config device-tree-compiler squashfs-tools parted dosfstools cpio unzip wget

apt install -y python-is-python3 python3-pip fdisk sudo udev

apt install -y cmake

wget https://storage.googleapis.com/git-repo-downloads/repo -O /usr/local/bin/repo
chmod +x /usr/local/bin/repo

wget http://security.ubuntu.com/ubuntu/pool/main/o/openssl/libssl1.1_1.1.1-1ubuntu2.1~18.04.23_amd64.deb -O ssl.deb
dpkg -i ssl.deb
rm ssl.deb
