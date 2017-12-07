docker-sge
==========

Dockerfile to build a container with SGE installed.

# Build

To build type:

```bash
# git clone git@github.com:gawbul/docker-sge.git
# cd docker-sge
docker build -t stevekm/sgeserver .
```

# Run

- need to use `sgeserver` as hostname

- need to change to `sge001` user inside the container

- `--rm` to remove the container after exiting

```bash
# docker run --rm -t -h sgeserver -i stevekm/sgeserver sudo -i -u sge001
$ docker run --rm -t -h sgeserver -i stevekm/sgeserver
sgeadmin@sgeserver added "sge001" to manager list
added "sge001" to access list "users"
sge001@sgeserver added "localhost" to exechost list
sge001@sgeserver added "@allhosts" to host group list
sge001@sgeserver modified "@allhosts" in host group list
sge001@sgeserver added "main.q" to cluster queue list
sge001@sgeserver modified "main.q" in cluster queue list
sgeserver added to submit host list

root@sgeserver:/# sudo -i -u sge001

$ echo "echo Running test from $HOSTNAME" | qsub ; qstat
Your job 1 ("STDIN") has been submitted
job-ID  prior   name       user         state submit/start at     queue                          slots ja-task-ID
-----------------------------------------------------------------------------------------------------------------
      1 0.00000 STDIN      sge001       qw    12/07/2017 19:14:55                                    1

$ cat STDIN.o1
Running test from sgeserver

$ qacct -j 1
==============================================================
qname        main.q
hostname     sgeserver
group        sge001
owner        sge001
project      NONE
department   defaultdepartment
jobname      STDIN
jobnumber    1
taskid       undefined
account      sge
priority     0
qsub_time    Thu Dec  7 19:14:55 2017
start_time   Thu Dec  7 19:15:05 2017
end_time     Thu Dec  7 19:15:05 2017
granted_pe   NONE
slots        1
failed       0
exit_status  0
ru_wallclock 0
ru_utime     0.010
ru_stime     0.080
ru_maxrss    3104
ru_ixrss     0
ru_ismrss    0
ru_idrss     0
ru_isrss     0
ru_minflt    480
ru_majflt    0
ru_nswap     0
ru_inblock   0
ru_oublock   16
ru_msgsnd    0
ru_msgrcv    0
ru_nsignals  0
ru_nvcsw     6
ru_nivcsw    7
cpu          0.090
mem          0.000
io           0.000
iow          0.000
maxvmem      0.000
arid         undefined
```

# References

Based on Dockerfile hosted [here](https://github.com/bgruening/docker-recipes/blob/621e80e37d1829494bc193ce3f20fe7f4833ec2a/freiburger-rna-tools/Dockerfile#L14
)
