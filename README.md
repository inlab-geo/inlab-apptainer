# inlab-apptainer

Apptainer files for the inlab software ecosystem.

- [https://apptainer.org/](https://apptainer.org/)
- [https://apptainer.org/docs/user/latest/](https://apptainer.org/docs/user/latest/)

## Installing apptainer

On fedora apptainer can be installed via dnf

```
sudo dnf install apptainer
```

## Available container definitions

| Definition | Status | Description |
|------------|--------|-------------|
| `inlab.py314.def` | **Recommended** | Uses Python 3.14 with pygimli built from source. Supports numpy 2.x. |
| `inlab.py313.def` | Maintained | Uses Python 3.13 with pygimli built from source. Supports numpy 2.x. |
| `inlab.conda.def` | Deprecated | Uses Miniconda with pygimli from conda-forge. Requires numpy 1.x due to conda pygimli constraints. |

## Building containers

Use the provided build script which auto-detects conda vs native containers and sets up appropriate cache bind mounts:

```
bash build.sh inlab.py314    # Build Python 3.14 container (recommended)
bash build.sh inlab.py313    # Build Python 3.13 container
bash build.sh inlab.conda    # Build conda-based container (deprecated)
```

Or build manually:
```
APPTAINER_TMPDIR=$(pwd) apptainer build inlab.conda.sif inlab.conda.def
```

## Using the container

Once the image is built, start an interactive shell:

```
apptainer shell inlab.py314.sif
```

You can then navigate to your local cofi-examples directory and run all notebooks:

```
python tools/run_notebooks/run_notebooks.py all
```

And all scripts:
```
python tools/validation/test_all_notebooks_scripts.py
```

## Notes

### Temporary directory issues

If there are issues about the image not being built related to `mksquashfs` not finishing, the recommendation is to change the temporary directory used by apptainer. The build script handles this automatically, or you can set it manually:
```
export APPTAINER_TMPDIR=$(pwd)
```

### NumPy compatibility

- **inlab.py313.def** / **inlab.py314.def**: PyGimli is built from source with numpy 2.x support, allowing use of the latest numpy features.
- **inlab.conda.def** (deprecated): PyGimli installed via conda is built with numpy 1.x, so this container uses numpy 1.x and a special branch of pyfm2d.

See [numpy 2.0 migration guide](https://numpy.org/doc/stable/numpy_2_0_migration_guide.html) for more details.
