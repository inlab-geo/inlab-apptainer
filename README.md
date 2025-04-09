# inlab-apptainer

Apptainer files for the inlab software ecosystem. An immutable singularity image file can be built by runing the following command. 

```
apptainer build inlab.sif inlab.def
```

This alllows to create under linux an environemnt where InLab's software ecosystem and all it's dependencies are available. The image then can be use to run all the cofi notebooks without the need to install any of the packages required by the examples that may or may not be trivial to install. We first start an interactive shell. This assume that cofi-examples is available locally.
```
apptainer shell inlab.sif
```

We then navigate to cofi-examples and can run all notebooks by executiny
```
(inlab) python tools/validation/test_all_notebooks_scripts.py
```

