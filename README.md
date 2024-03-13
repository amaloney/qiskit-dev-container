# qiskit-dev-container

Qiskit development container for use in VSCode.

## Installation

You need to fork [Qiskit](https://github.com/Qiskit/qiskit) first. Once you have your
own fork you can then clone it to your machine.

```bash
git clone https://github/<your-repo>/qiskit
```

Clone this directory next to your fork.

```bash
git clone https://github.com/amaloney/qiskit-dev-container
```

Copy the `.devcontainer` and `Dockerfile` to your Qiskit fork.

```bash
cp -R qiskit-dev-container/.devcontainer qiskit
cp Dockerfile qiskit
```

Open up VSCode and point it to your Qiskit fork. VSCode should detect that there is a
devcontainer folder and will ask you if you want to install the container. You can run
tox after successfully installing the devcontainer. Open up a terminal in VSCode and
execute the following command.

```bash
tox
```

If you get to the `lint-incr` stage for tox and it complains about git permissions on
the qiskit folder, then make sure you have done the following two things.

1.  Add your name and email to the git config.
2.  Make sure the user and group is set to the user/group within the devcontainer.

Then rerun the `tox` command. This should run all the tests and lint the codebase.

**Make** sure you run `tox` after any changes you make to the code.

## Editable installations

Please note that the Dockerfile installs Qiskit using `pip install --editable .`. As
stated in their documentation, in editable mode the compiled extensions are built in
debug mode without optimizations. If you do not want this then you will need to run the
following.

```bash
python setup.py build_rust --release --inplace
```

Or replace the `pip install --editable .` command with the one above.
