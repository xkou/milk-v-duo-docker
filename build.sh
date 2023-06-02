
get(){
    cat <<EOF | docker run -i -v $PWD/duo:/duo -w /duo --rm milkv-build-env bash
    export REPO_URL='https://mirrors.tuna.tsinghua.edu.cn/git/git-repo'
    repo init -u https://ghproxy.com/https://github.com/milk-v/duo-manifest.git -b main -m milk-v_duo_cv180xb_sdk.xml
    repo sync
    date
EOF
}

build(){
    true
}

prepare(){
    docker build ubuntu -t milkv-build-env
}

$@