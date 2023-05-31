# build tindaisy-vep

source docker_image.sh

if [ -e ../.git ]; then
>&2 echo WARNING: Looks like you are building from a submodule
>&2 echo Git tracking will be broken within container
fi

# Build needs to take place in root directory of project
cd ..

CMD=" docker build -t $IMAGE_V95 -f docker/Dockerfile.v95 ."
echo $CMD
eval $CMD

