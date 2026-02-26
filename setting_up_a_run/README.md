# Setting up a singularity run 

The data structure on esched for MK+.

- User directory:

      /bEDD/u

- Container directory:

     /bEDD/MPLUS-CONTAINER

- Raw data directory:

	/bEDD/MPLUS-DATA


## A simple setup to submit a job via esched

The job submission is via HTCondor. Please Do NOT run any job on the esched machine itself, always submit
a job.


- make a directory in your user directory:

```
mkdir my_EDGAR_RUN
cd my_EDGAR_RUN
```

- prepare the directory 

```
git clone https://github.com/hrkloeck/MKPLUSATEDGAR
```

```
cp MKPLUSATEDGAR/setting_up_a_run/*run* .
```

```
rm -fr MKPLUSATEDGAR
```

```
mkdir condor_logs
```

```
THIS NEEDS TO DO THE CASA STUFF 
```


- In the directory there are two files:

	run_example.sh (you need to edit this)

		This file is your actual programme or script you want to run.
     

    sub_run_example.sub (no editing nessesary)

		This file sorganises the submission of your example run.
		Note: the request_cpus = 4 needs to fit the number of processors
		of the build singularity image



- Submitting the job

	The job submission on Edgar is organised via
    [HTCondor](https://htcondor.readthedocs.io/en/latest/) and here is
    a nice tutorial [HTCondor users manual](https://htcondor.readthedocs.io/en/latest/users-manual/index.html)

	submit a job
	
		condor_submit sub_job1.sub
		
	monitor the job
	
		condor_q
	
    kill a job
	
		condor_rm JOBID
	
	check on the submitted job meets the requirements
	
		condor_q -better-analyze <JOB ID>



## Add additional packages 

- make a directory 

```
mkdir my_SING_BUILD
cd my_SING_BUILD
```

- get the depository, either via git clone or download the source:

```
git clone https://github.com/hrkloeck/MKPLUSATEDGAR.git
```

- generate the singularity image on Edgar's esched entry machine.

```
cd MKPLUSATEDGAR/singularity
```

```
singularity build --fakeroot MKPLUSATEDGAR.simg singularity.mkplus_full_022026
```


Notes:

	- the container include some programms to extract the python
	package libraries. 


In case you run into problem





The next steps are needed to setup a pseudo home directory for CASA, python, etc.

```
cd ../../
mkdir -p ${USER}/.casa/data

```

Get some additional packages outside the singularity container 
```
git clone https://github.com/hrkloeck/DASKMSWERKZEUGKASTEN.git
git clone https://github.com/hrkloeck/2GC.git
git clone https://github.com/JonahDW/Image-processing.git
```

Ok lets go and start.
