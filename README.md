docker-sge
==========

https://github.com/bgruening/docker-recipes/blob/621e80e37d1829494bc193ce3f20fe7f4833ec2a/freiburger-rna-tools/Dockerfile#L14

Dockerfile to build a container with SGE installed.

To build type:

```bash
# git clone git@github.com:gawbul/docker-sge.git
# cd docker-sge
# docker build -t gawbul/docker-sge .
# docker build -t stevekm/docker-sge .
docker build -t stevekm/frtwebserver .
```

To pull from the Docker Hub type:

```bash
# docker pull gawbul/docker-sge
```

To run the image in a container type:

```bash
# docker run -it --rm gawbul/docker-sge login -f sgeadmin
# docker run -it --rm stevekm/docker-sge .
# docker run -t -h frtwebserver -i imagename
```

**You need the `login -f sgeadmin` as root isn't allowed to submit jobs**

To submit a job run:

```bash
echo "echo Running test from $HOSTNAME" | qsub
```
