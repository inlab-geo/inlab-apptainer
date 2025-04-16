# inlab-apptainer

Apptainer files for the inlab software ecosystem. 

- [https://apptainer.org/](https://apptainer.org/)
- [https://apptainer.org/docs/user/latest/](https://apptainer.org/docs/user/latest/)

## Installing apptainer

On fedora apptainer can be installed via dnf

```
sudo dnf install apptainer
```

## Using the singularity image to run the cofi-examples

An immutable singularity image file `inlab.sif` can be built from the `inlab.fedora.def` file by runing the following command. 

```
apptainer build inlab.sif inlab.fedora.def
```

This alllows to create under linux an environment/container where InLab's software ecosystem and all it's dependencies are available. The image then can be use to run all the cofi notebooks without the need to install any of the packages required by any of the examples that may or may not be trivial to install. 

Once the image is built we start an interactive shell. 

```
apptainer shell inlab.sif
```

We then navigate to our local cofi-examples directort and  run all notebooks by executing

```
python tools/run_notebooks/run_notebooks.py all
```

and all scripts by executing
```
python tools/validation/test_all_notebooks_scripts.py
```
