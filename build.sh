
run(){
    docker run -v /dev:/dev --cap-add SYS_ADMIN --privileged=true --device-cgroup-rule="b 7:* rmw" -i -v $PWD/duo:/duo -w /duo --rm milkv-build-env bash
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

prepare(){
    docker build ubuntu -t milkv-build-env
}

$@