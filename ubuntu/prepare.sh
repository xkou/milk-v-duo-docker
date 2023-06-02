
ln -fs /usr/share/zoneinfo/Asia/Hong_Kong /etc/localtime
DEBIAN_FRONTEND=noninteractive apt-get install -y tzdata
dpkg-reconfigure --frontend noninteractive tzdata

apt install -y dialog python3-dev make git bc gcc flex bison ninja-build libssl-dev \
      rsync pkg-config device-tree-compiler squashfs-tools parted dosfstools cpio unzip wget

apt install -y python-is-python3 python3-pip

apt install -y cmake

curl https://storage.googleapis.com/git-repo-downloads/repo > /usr/local/bin/repo
chmod +x /usr/local/bin/repo
