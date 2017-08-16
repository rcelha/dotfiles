BASE=~/opt
export GOROOT=$BASE/go

golang_install () {
    mkdir -p $BASE;
    sh -c "rm -fr /opt/go && curl https://storage.googleapis.com/golang/go1.8.3.linux-amd64.tar.gz | tar -C $BASE -xvz"
}

export PATH=$GOROOT/bin:$PATH
