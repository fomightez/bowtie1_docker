[![](https://images.microbadger.com/badges/image/fomightez/bowtie1.svg)](https://microbadger.com/images/fomightez/bowtie1 "Get your own image badge on microbadger.com")

# bowtie1_docker
Docker container for Bowtie1 for splicing-unaware aligning of reads and differential expression analysis for RNA-Seq

[The Docker image is available](https://hub.docker.com/r/fomightez/bowtie1/) at Docker Hub.

Contents
--------

A Linux-based Docker container with Bowtie version 1.

(This is not Bowtie2; Docker container including Bowtie2 is [here](https://github.com/fomightez/rnaseq_wang/) and [image here](https://hub.docker.com/r/fomightez/rnaseqwang/)).


Includes:

* Ubuntu base
* Bowtie1

*Specific versions and sources are made clear in [the Dockerfile](https://github.com/fomightez/bowtie1_docker/blob/master/Dockerfile).*  

Use
----

Intended to be used with data in `/data` directory.

To pull and run first time. 

    docker run -v /data:/data -itd fomightez/bowtie1

You may need to change first `/data` in that command to match path to your directory.

It starts detached and so you need to attach it, alternative use `docker run -v /data:/data -it fomightez/bowtie1` to start and attach immediately.
