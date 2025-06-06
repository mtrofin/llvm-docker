I use `/work/private-llvm` as a location I set up a `git worktree` for the LLVM repo I actually work in. Adjust paths accordingly.

Run in your local llvm-project root:
```
git worktree add /work/private-llvm HEAD
```

Run in this project's root. You can change `goose_image` and `goose`, of course (but the former needs to appear as the image used in the second command):

```
docker build --tag goose_image . --build-arg USERID=$(id -u)
```

```
docker run -it --name goose -v /work/private-llvm:/work/llvm-project goose_image
```


Then, to [install goose](https://block.github.io/goose/docs/getting-started/installation/):

```
curl -fsSL https://github.com/block/goose/releases/download/stable/download_cli.sh | CONFIGURE=false bash
```

For some reason, currently, doing a `RUN` for the above as part of the Dockerimage doesn't work.

Note that you'll need to `export` the API keys for whatever models. [Here's why](https://github.com/block/goose/issues/1076).
