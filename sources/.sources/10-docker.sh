# docker commands

alias aws_="docker run -it --rm -v ${HOME}/.aws:/root/.aws anigeo/awscli"

alias docker-local="docker run -it --rm -v ${PWD}:${PWD} -w ${PWD}"

alias ctop="docker run --rm -ti --name=ctop --volume /var/run/docker.sock:/var/run/docker.sock:ro quay.io/vektorlab/ctop:latest"

# https://gist.github.com/cschiewek/246a244ba23da8b9f0e7b11a68bf3285
torbrowser(){
    export HOSTNAME=`hostname`
    xhost + ${hostname}
    docker run -it --rm \
        -v /tmp/.X11-unix:/tmp/.X11-unix \
        -e DISPLAY=${HOSTNAME}:0 \
        -e GDK_SCALE \
        -e GDK_DPI_SCALE \
        --group-add audio \
        jess/tor-browser
}

# docker utils
alias docker-compose-dev="docker-compose -f docker-compose.yml -f docker-compose.dev.yml"

buildthis () {
    docker build -t rcelha/`basename ${PWD} ` .
}

xrun () {
    imageName=$1;
    shift 1;
    xhost +;
    docker run --rm -it  \
        -v /tmp/.X11-unix:/tmp/.X11-unix \
        -e DISPLAY=unix$DISPLAY \
        -e GDK_SCALE \
        -e GDK_DPI_SCALE \
        -v /dev/shm:/dev/shm \
        --device /dev/snd \
        --device /dev/dri \
        --group-add audio \
        --group-add video \
        ${imageName} $@ ;
}

xrunthis () {
    imageName=rcelha/`basename ${PWD}`
    xrun ${imageName} $@;
}
