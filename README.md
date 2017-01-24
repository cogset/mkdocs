## MkDocs in Docker
[![build status badge](https://travis-ci.org/cogset/mkdocs.svg)](https://travis-ci.org/cogset/mkdocs)
[![layers badge](https://images.microbadger.com/badges/image/cogset/mkdocs.svg)](https://microbadger.com/images/cogset/mkdocs)
### Supported tags and respective Dockerfile links

+  `0.16.1`, `0.16`, `latest` [(0.16/Dockerfile)](https://github.com/cogset/mkdocs/blob/master/0.16/Dockerfile)
+  `0.15.3`, `0.15` [(0.15/Dockerfile)](https://github.com/cogset/mkdocs/blob/master/0.15/Dockerfile)

------
### Author
+ You Ming (youming@funcuter.org)

------
### Usage

##### Run as a development server
```
$ docker run -d --name mkdocs -v /path/to/src:/docs/src cogset/mkdocs:latest -s
```

##### Build the MkDocs documentation
```
$ docker run -t --name mkdocs --rm -v /path/to/src:/docs/src -v /path/to/output:/docs/output cogset/mkdocs:latest -b
```

##### Or build to JSON files
```
$ docker run -t --name mkdocs --rm -v /path/to/src:/docs/src -v /path/to/output:/docs/output cogset/mkdocs:latest -j
```
