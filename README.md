docker-sge
==========

Dockerfile to build a container with SGE installed.

# Build

To build type:

```bash
git clone git@github.com:stevekm/docker-sge.git
cd docker-sge
docker build -t stevekm/sgeserver .
```

# Run

```bash
docker run --rm -t -i stevekm/sgeserver
```

# Test

From inside the container, run `/test.sh`:

```bash
root@c2da5e1d9442:/# /test.sh
+ echo 'echo Running test from c2da5e1d9442'
+ qsub
Your job 1 ("STDIN") has been submitted
+ qstat
job-ID  prior   name       user         state submit/start at     queue                          slots ja-task-ID
-----------------------------------------------------------------------------------------------------------------
      1 0.00000 STDIN      root         qw    12/07/2017 23:51:30                                    1
```

# References

Based on Dockerfile hosted [here](https://github.com/bgruening/docker-recipes/blob/621e80e37d1829494bc193ce3f20fe7f4833ec2a/freiburger-rna-tools/Dockerfile#L14
)
