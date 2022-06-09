# CI: Poetry & Vue

This is a testing setup ([Github](https://github.com/busykoala/CI-Poetry-Vue))
for running `poetry` in the backend and use `yarn` in
the frontend part of a tested app.

Also the dependencies for `cypress` and `lighthouse audits` are there.

## Docker Image

```
# pull image
docker pull busykoala/ci-poetry-vue:latest

# build and push
docker build -t busykoala/ci-poetry-vue:latest .
docker push busykoala/ci-poetry-vue:latest
```
