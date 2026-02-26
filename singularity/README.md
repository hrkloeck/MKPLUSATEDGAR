# Generate the software suit for MeerKAT+ comissioing 

## The singularity scripts

I have produces two script that can be used for different purposses:

-singularity_mkplus_plain_XXXXXX

	Use this script as a base if you want to test a new package or use
	different python versions. Please have a look inside the file. 

- singularity_mkplus_full_XXXXXX

       Use this script to generate the full software suit. Howvere there
       are some packages that can not be installed and you may want to play with the first option. 

## Generate the singularity container 

- use bash shell and point singularity to a temporary directory for
  the buildung process.

```
bash
export APPTAINER_TMPDIR=/media/scratch
```

- make a directory 

```
mkdir my_SING_BUILD
cd my_SING_BUILD
```

- get the depository either via git clone or download the source:

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

The packages pipdeptree and pipgrip has been installed to check the
installed packages and dependencies or to explore package dependencies.

- to checkout the installed packages use: 

	```
	singularity exec MKPLUSATEDGAR.simg pipdeptree
	```


