# dockerfiles

## build stage image
```
docker build -t [image_name] --build-arg=OPENCV_VERISON=[version] -f Dockerfile.build .
```

## runtime stage image
```
docker build -t [image_name] -f Dockerfile.runtime .
```
