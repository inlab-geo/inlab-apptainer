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

An immutable singularity image file `inlab.sif` can be built from the `inlab.fedora.def` file by runing the following command. atlernativelty one may complete the `inlab.unbuntu.def` file to create an ubunutu based image.
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

## Notes

If there are issues about the image not being built relate to `mksquashfs` not finishing the recommendation is to change the temporary directory used by aptiner to a directory other than `/tmp`. The following commands uses the current directory as the temporary directory used by apptainer and plces the image in the users home directory in a subfolder called apptainer, assuming it exists.
```
export APPTAINER_TMPDIR=$(pwd)
apptainer build ~/apptainer/inlab.sif inlab.fedora.def
```

PyGimli installed via conda appears to be built with numpy 1.x this means it is not comaptible with numpy 2.x. The apptainer image thus uses numpy 1.x and a special branch of pyfm2d that also uses numpy 1.x and is built from source using
```
pip install git+https://github.com/inlab-geo/pyfm2d@numpy-1.x
```

See [https://numpy.org/doc/stable/numpy_2_0_migration_guide.html](https://numpy.org/doc/stable/numpy_2_0_migration_guide.html) for more details

