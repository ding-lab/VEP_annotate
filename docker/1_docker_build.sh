# build tindaisy-vep

source docker_image.sh

# Build needs to take place in root directory of project
cd ..

CMD=" docker build -t $IMAGE -f docker/Dockerfile ."
echo $CMD
eval $CMD
