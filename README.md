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

## Building containers

Use the provided build script which auto-detects conda vs native containers and sets up appropriate cache bind mounts:

```
bash build.sh inlab.py314    # Build Python 3.14 container (recommended)
bash build.sh inlab.py313    # Build Python 3.13 container
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
