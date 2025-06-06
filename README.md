```
docker build --tag goose_image . --build-arg USERID=$(id -u)
```

```
git worktree add /work/private-llvm HEAD
```

```
docker run -it --name goose -v /work/private-llvm:/work/llvm-project goose_image
```
