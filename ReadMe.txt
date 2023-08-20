This project was followed from these instructions:
https://spacelift.io/blog/dockerfile


To build an image from the dockerfile:
The -t flag sets the tag which will be assigned to your image after the build completes.
You can repeat the flag if you need to add multiple tags.
```
docker build -t demo-image:latest .
```

To execute the code:
```
docker run demo-image:latest
```
