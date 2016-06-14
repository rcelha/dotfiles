# docker commands
export DOCKERHOME=${HOME}/.docker-home;

alias aws_="docker run -it --rm -v ${HOME}/.aws:/root/.aws anigeo/awscli"

torbrowser(){
    xhost +
    docker rm torbrowser
    docker run -d \
        -v /etc/localtime:/etc/localtime:ro \
        -v /tmp/.X11-unix:/tmp/.X11-unix \
        -e DISPLAY=unix$DISPLAY \
        -e GDK_SCALE \
        -e GDK_DPI_SCALE \
        --device /dev/snd \
        --group-add audio \
        --name torbrowser \
        rcelha/tor-browser
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

purge-images() {
    docker rmi `docker images -f dangling=true -q`;
}
alias prune-images="purge-images"
