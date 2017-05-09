golang_install () {
    sudo sh -c "rm -fr /opt/go && curl https://storage.googleapis.com/golang/go1.8.1.linux-amd64.tar.gz | tar -C /opt -xvz"
}

export GOROOT=/opt/go
export PATH=$GOROOT/bin:$PATH
