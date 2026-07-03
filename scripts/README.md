## Howto submit script via condor 

Have a look (here)[https://github.com/hrkloeck/MKDCFLOW/tree/main/esched]


## Example Scripts

These scripts are examples howto run singularity and the various software packages These scripts need to be executed in a bash shell


- 00_RUN_SINGULARITY_SHELL
	
	This script will run the singularity container (MKPLUSATEDGAR.simg) in shell mode will all
	settings for testing purposes. 
	
- 01_OBS_INFORMATION

	First copy the daskmsASTROKIT software in the current working directory
	
	```
	git clone https://github.com/hrkloeck/daskmsASTROKIT.git
	```
	
	This script will run GET_MS_INFO.py from daskmsASTROKIT to optain basic info
    of the MS file:

	```
	source 01_OBS_INFORMATION MSFILENAME $PWD
	```

- 02_OBS_DIAGNOSTIC_PLOTS using shadems

	Example of a bandpass (amplitude versus frequency) plot 
	
	```
	source 02_OBS_DIAGNOSTIC_PLOTS MSFILENAME $PWD
	```

- 03_RUN_PYTHON_CASA

	Please note you need to do the follwong in the current working
    directory.
	
	```
	mkdir -p ${USER}/.casa/data
	```

	Example of a python script bandpass (amplitude versus frequency) plot 
	
	```
	source 03_RUN_PYTHON_CASA MSFILENAME $PWD
	```
