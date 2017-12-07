docker-sge
==========

https://github.com/bgruening/docker-recipes/blob/621e80e37d1829494bc193ce3f20fe7f4833ec2a/freiburger-rna-tools/Dockerfile#L14

Dockerfile to build a container with SGE installed.

To build type:

```bash
# git clone git@github.com:gawbul/docker-sge.git
# cd docker-sge
docker build -t stevekm/sgeserver .
```

To run the image in a container type:

```bash
$ docker run -t -h frtwebserver -i stevekm/sgeserver
sgeadmin@frtwebserver added "bisge001" to manager list
added "bisge001" to access list "users"
bisge001@frtwebserver added "localhost" to exechost list
bisge001@frtwebserver added "@allhosts" to host group list
bisge001@frtwebserver modified "@allhosts" in host group list
bisge001@frtwebserver added "main.q" to cluster queue list
bisge001@frtwebserver modified "main.q" in cluster queue list
frtwebserver added to submit host list
/root/run.sh: line 18: /etc/init.d/tomcat7: No such file or directory
root@frtwebserver:/# sudo -i -u bisge001
$ echo "echo Running test from $HOSTNAME" | qsub
Your job 1 ("STDIN") has been submitted
$ qstat
job-ID  prior   name       user         state submit/start at     queue                          slots ja-task-ID
-----------------------------------------------------------------------------------------------------------------
      1 0.00000 STDIN      bisge001     qw    12/07/2017 18:37:33                                    1

$ qstat -xml
<?xml version='1.0'?>
<job_info  xmlns:xsd="http://gridengine.sunsource.net/source/browse/*checkout*/gridengine/source/dist/util/resources/schemas/qstat/qstat.xsd?revision=1.11">
    <queue_info>
    </queue_info>
    <job_info>
    </job_info>
  </job_info>
$ qstat
$ ls
STDIN.e1  STDIN.o1
$ cat STDIN.o1
Running test from frtwebserver
```
