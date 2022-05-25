source docker_image.sh

if [ $NO_PUSH != 0 ]; then
    >&2 echo docker push not permitted
    exit 1
fi

CMD="docker push $IMAGE_V99"
echo $CMD
eval $CMD

