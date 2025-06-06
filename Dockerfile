FROM ubuntu:24.04
WORKDIR /work/llvm-project

RUN apt-get update
RUN apt-get install -y \
	cmake \
	ninja-build \
	clang-19 \
	lld-19 \
	sudo \
	adduser \
	tmux \
	bzip2 \
	curl \
	vim


ARG USERID

RUN adduser --uid $USERID --disabled-password myself --gecos ""
RUN usermod -a -G sudo myself
RUN passwd -d myself

USER myself
RUN echo PATH=$PATH:~/.local/bin >> ~/.bashrc

CMD /bin/bash
