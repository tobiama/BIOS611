#!/bin/bash

docker build . --build-arg USER_ID=$(id -u) --build-arg GROUP_ID=$(id -g) -t 611
docker run --rm -v $(pwd):/home/rstudio/work -p 8787:8787 -it 611