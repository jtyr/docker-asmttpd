docker-asmttpd
==============

This is a `Dockerfile` which helps to create Docker container with
minimalist HTTP server. The HTTP server is called
[asmttpd](https://github.com/nemasu/asmttpd) and it's written in amd64
assembly. The main advantage is that the final Docker image is extremely
small (less than 6kB!):

```
$ docker images
REPOSITORY             TAG                 IMAGE ID            CREATED             SIZE
jtyr/asmttpd           latest              040c73463620        2 minutes ago       5.86kB
```


Usage
-----

Build the image:

```
$ docker build -t jtyr/asmttpd .
```

Or pull the image directly from Docker Hub:

```
$ docker pull jtyr/asmttpd
```

Run the container with the HTML content shared from the host directory
(e.g. `/path/to/local/www`):

```
$ docker run -d -p 8080:80 -v /path/to/local/www:/data jtyr/asmttpd
```

Now it should be possible to access the HTTP server on the host's local
address:

```
$ curl http://localhost:8080
```


License
-------

MIT


Author
------

Jiri Tyr
