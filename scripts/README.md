## Scripts

Run all the scripts in a bash shell


- source 00_RUN_SINGULARITY_SHELL
	
	This script will run a shell with all the setting 
	
- source 01_OBS_INFORMATION

	First copy the daskmsASTROKIT software in the current working directory
	
	```
	git clone https://github.com/hrkloeck/daskmsASTROKIT.git
	```
	
	If everything is at the place where it should be you can run the
    script like:
	
	source 01_OBS_INFORMATION MSFILENAME $PWD
	
