## `droptainer` - drop apptainer on supercomputerz

_**Phased out in favor of installing `apptainer` using `mamba` and [`mitten`](https://github.com/unkaktus/mitten):**_

```shell
mitten supercomp
mamba install apptainer
```




















### Usage
1. Go to the [releases page](https://github.com/unkaktus/droptainer/releases) and download `droptainer.tar.gz`
2. SCP the archive to your favorite supercomp.
3. Extract it and run `droptainer` script:

```shell
$ tar xzf droptainer.tar.gz
$ cd droptainer
$ ./droptainer.sh $HOME/.droptainer
```

4. Add `apptainer` binaries to your `PATH` by running the suggested command.
You can also add it to your `~/.bashrc` to make it permanent.

5. Now you can remove original archive and the droptainer folder.

Enjoy your `apptainer` binary! 💫


### Building
To produce `droptainer.tar.gz`, run:

```shell
$ docker build -t droptainer .
$ docker run --rm -ti -v "$PWD:/out" droptainer
```
