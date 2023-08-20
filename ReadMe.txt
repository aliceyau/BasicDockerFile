This project was followed from these instructions:
https://spacelift.io/blog/dockerfile


To build an image from the dockerfile:
The -t flag sets the tag which will be assigned to your image after the build completes.
You can repeat the flag if you need to add multiple tags.
```
docker build -t docker_file_basics:latest .
```

To execute the code:
```
docker run docker_file_basics:latest
```
Or if you want the container to keep running after it's executed the code, You
can use the -t (pseudo-tty) docker parameter to keep the container running.
```
docker run -d -t docker_file_basics:latest
```
If the container is running, you can attach the container to the terminal session using the exec parameter as shown below.
```
docker exec -it <container ID> /bin/bash
```

