docker-centos6-sge
==========

Dockerfile to build a container with SGE installed.

# Build

To build type:

```
git clone git@github.com:stevekm/docker-centos6-sge.git
cd docker-centos6-sge
docker build -t stevekm/docker-centos6-sge .
```

# Run

```
docker run --rm -t -i stevekm/sgeserver
```

# Test

From inside the container, run `/test.sh`:

```
root@7022b3a28667:/# /test.sh
Your job 1 ("STDIN") has been submitted
job-ID  prior   name       user         state submit/start at     queue                          slots ja-task-ID
-----------------------------------------------------------------------------------------------------------------
      1 0.00000 STDIN      root         qw    12/07/2017 23:58:38                                    1
```

# References

Based on Dockerfile hosted [here](https://github.com/bgruening/docker-recipes/blob/621e80e37d1829494bc193ce3f20fe7f4833ec2a/freiburger-rna-tools/Dockerfile#L14
)
