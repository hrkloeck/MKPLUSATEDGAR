## Scripts

Run all the scripts in a bash shell


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
source 01_OBS_INFORMATION MSFILENAME $PWD
```
