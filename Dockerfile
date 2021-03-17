FROM arm64v8/ubuntu

RUN apt-get update
RUN apt-get install -y curl build-essential libgmp-dev git wget
RUN wget https://nim-lang.org/download/nim-1.4.4.tar.xz
RUN xz -d nim-1.4.4.tar.xz && tar -xvf nim-1.4.4.tar 
RUN cd nim-1.4.4 && sh build.sh && bin/nim c koch && ./koch boot -d:release

ENV PATH="$(pwd)/bin:$PATH"
