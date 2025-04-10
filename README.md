# inlab-apptainer

Apptainer files for the inlab software ecosystem. 

- [https://apptainer.org/](https://apptainer.org/)
- [https://apptainer.org/docs/user/latest/](https://apptainer.org/docs/user/latest/)

## Installing apptainer

Apptainer can be installed on any recent linux distribution, on bare-metal or inside a virtual machine.
[https://apptainer.org/docs/admin/1.0/installation.html](https://apptainer.org/docs/admin/1.0/installation.html)

A basic installation on linux is possible by simply using the package manager e.g. on fedora `dnf`.
```
sudo dnf install apptainer
```

## Using the singularity image to run the cofi-examples

An immutable singularity image file `inlab.sif` can be built from the `inlab.def` file by runing the following command. 

```
apptainer build inlab.sif inlab.def
```

This alllows to create under a linux an environment/container where InLab's software ecosystem and all it's dependencies are available. The image then can be use to run all the cofi notebooks without the need to install any of the packages required by any of the examples that may or may not be trivial to install. 

Once the image is built we can start an interactive shell. 

```
apptainer shell inlab.sif
```

We then simply navigate to our local cofi-examples directory and  run all notebooks by executing

```
python tools/run_notebooks/run_notebooks.py all
```

and all scripts by executing
```
python tools/validation/test_all_notebooks_scripts.py
```
