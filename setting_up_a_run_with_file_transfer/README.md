# Run a job on Edgar using file transfer 


Please note that this explanation is mainly for MPIfR people involved
in MeerKAT+ science comissioing.

In case you are not familiar with all this I suggest you start [setting_up_a_run](https://github.com/hrkloeck/MKPLUSATEDGAR/tree/main/setting_up_a_run)


Do not use th classical HTcondor way here. 

THIS IS NOT NEEDED WITH THE EDGAR ARCHITECTURE the esched 10 Gb/s to
the local node disk.

Better to copy the data directly frmo bEDD to the scratch disk of the
node. Although this needs to be done within your script. 


## The data structure on esched for MK+ 

- User directory:

    /bEDD/u

- Container directory:

    /bEDD/MPLUS-CONTAINER

- Raw data directory:

    /bEDD/MPLUS-DATA
	
	

## A simple setup to submit a job via esched

The job submission is via [HTCondor](https://htcondor.readthedocs.io/en/latest/). Please Do NOT run any job on the esched machine itself, always submit
a job.


- make a directory in your user directory:

```
mkdir my_EDGAR_BIGRUN
cd my_EDGAR_BIGRUN
```

- prepare the directory 

```
git clone https://github.com/hrkloeck/MKPLUSATEDGAR
```

```
cp MKPLUSATEDGAR/setting_up_a_run_with_file_transfer/*run* .
```

```
chmod 755 *run* 
```

```
rm -fr MKPLUSATEDGAR
```

```
mkdir condor_logs
```

```
mkdir -p ${USER}/.casa/data 
```


- Setting up the scripts

	run_example.sh (you need to edit this)

		This file is your actual programme or script you want to run.
     

    sub_run_example.sub (no editing nessesary)

		This file organises the submission of your example run.
        Note: you may want to add
              +AccountingGroup = "g_mplus.USERID" (e.g. USERID = hrk; after getenv and before queue 1)
		Note: the request_cpus = 4 needs to fit the number of processors
		of the build singularity image


Now in job submission we add additional parameter through the scripts
(this is a nice feature in HTcondor)

```
condor_submit sub_run_example_filetransfer.sub DATA_PATH=/bEDD/MPLUS-DATA/ DATA_FILE=J0521+1638_cal.ms
```



## Working on Edgar

The job submission to Edgar is organised via
[HTCondor](https://htcondor.readthedocs.io/en/latest/) and here is
a nice tutorial [HTCondor users
manual](https://htcondor.readthedocs.io/en/latest/users-manual/index.html).


- Submit a job (assuming you are logged on esched)

```
condor_submit sub_run_example.sub
```


Some usefull commands:

- submit a job
	
		condor_submit
		
- monitor the job
	
		condor_q
	
- kill a job
	
		condor_rm JOBID
	
- check on the submitted job meets the requirements
	
		condor_q -better-analyze <JOB ID>

- start an interactive job

		condor_submit -interactive

- get resource info

		condor_status


## Working on Edgar interactively 

Submit the job (note some of the parameters will be ignored by HTcondor)

	condor_submit -interactive sub_run_example.sub

You job will be submitted to the cluster so you should see e.g. something like

	Welcome to slot1_3@edgar-con25.mpifr-bonn.mpg.de!

and your prompt in the terminal 

	edgar-con25 21:

Once you are on a node get bash as terminal environment (if that is not your default) 

	cp /etc/bash.bashrc .
	bash
	source bash.bashrc
	
Now you could start a job or test a script

	source run_example.sh


## Add additional packages 

Here is an explanation to add 3rd hand software packages and run the
singularity image.


- get the depository of your 3rd hand software package

As an example we use the source finding tools from Jonah.

```
git clone https://github.com/hrkloeck/daskmsASTROKIT.git 
```

So you want to add to the package to the PYTHONPATH environment
variable.

singularity exec --bind ${PWD}:/WORK/ --env
PYTHONPATH=/WORK/Image-processing:/opt/venviron/py_venv/lib/python3.12.4/site-packages
MKPLUSATEDGAR.simg 
