export PATH=$PATH:~/local/go/bin

install-go() {
    TMP=$(mktemp -d) && \
    cd $TMP && \
    wget https://golang.org/dl/go1.16.2.linux-amd64.tar.gz && \
    tar -xzf go1.16.2.linux-amd64.tar.gz && \
    rm -fr ~/local/go && \
    mkdir -p ~/local/go && \
    mv ./go ~/local/
    cd -
}
