# docker-asmttpd

This is a `Dockerfile` which helps to create Docker container with minimalist
HTTP server. The HTTP server is called
[asmttpd](https://github.com/nemasu/asmttpd) and it's written in amd64 assembly.
The main advantage is that the final Docker image is extremely small (less than
14kB!):

```text
$ docker images ghcr.io/jtyr/docker/asmttpd
REPOSITORY                    TAG                 IMAGE ID            CREATED             SIZE
ghcr.io/jtyr/docker/asmttpd   latest              6c639f949b8f        2 minutes ago       13.5kB
```

## Usage

Build the image:

```shell
docker build -t ghcr.io/jtyr/docker/asmttpd .
```

Or pull the image directly from Docker Hub:

```shell
docker pull ghcr.io/jtyr/docker/asmttpd
```

Run the container with the HTML content shared from the host directory
(e.g. `/path/to/local/www`):

```shell
docker run -d -p 8080:80 -v /path/to/local/www:/data ghcr.io/jtyr/docker/asmttpd
```

Now it should be possible to access the HTTP server on the host's local
address:

```shell
curl http://localhost:8080
```

## License

MIT

## Author

Jiri Tyr
