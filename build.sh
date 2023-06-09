
run(){
    docker run -v /dev:/dev --cap-add SYS_ADMIN --privileged=true --device-cgroup-rule="b 7:* rmw" -i -v $PWD/duo:/duo -w /duo --rm milkv-build-env bash
}

runbuild(){
    docker run -i -v $PWD/duo:/duo -v $PWD/$PROJ:/proj -w /proj --rm milkv-build-env bash
}

get(){
    cat <<EOF | run
    export REPO_URL='https://mirrors.tuna.tsinghua.edu.cn/git/git-repo'
    repo init -u https://ghproxy.com/https://github.com/milk-v/duo-manifest.git -b main -m milk-v_duo_cv180xb_sdk.xml
    repo sync
    date
EOF
}

image(){
    cat <<EOF | run
    source build/cvisetup.sh
    defconfig cv1800b_sophpi_duo_sd
    clean_all
    build_all
    pack_sd_image
EOF

    ls -ld duo/install/soc_cv1800b_sophpi_duo_sd/*
}

pack(){
    cat <<EOF | run
    source build/cvisetup.sh
    defconfig cv1800b_sophpi_duo_sd
    pack_sd_image
EOF
    ls -ld duo/install/soc_cv1800b_sophpi_duo_sd/*
}

build(){
    true
}

make(){
    echo $1
    cat <<EOF | PROJ=$1 runbuild
 #   source /duo/build/cvisetup.sh
    cd /duo/host-tools/gcc/riscv64-linux-musl-x86_64/bin/
    ln -sf riscv64-unknown-linux-musl-gcc gcc
    ln -sf riscv64-unknown-linux-musl-g++ g++
    ln -sf riscv64-unknown-linux-musl-ld ld
    cd -
    export CC=gcc
    export CXX=g++
    export LD=ld
    export PATH=/duo/host-tools/gcc/riscv64-linux-musl-x86_64/bin/:$PATH
    make clean
    make
EOF
    
}

prepare(){
    docker build ubuntu -t milkv-build-env
}

$@