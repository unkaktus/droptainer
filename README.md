## `droptainer` - drop apptainer on supercomputerz

# Usage
1. Go to the releases page and download `droptainer.tar.gz`
2. SCP the archive to your favorite supercomp.
3. Extract it and run `droptainer` script:

```shell
tar xzf droptainer.tar.gz
cd droptainer
./droptainer.sh $HOME/.droptainer
```

4. Add `apptainer` binaries to your `PATH` by running the suggested command.

You can also add it to your `~/.bashrc` to make it permanent.
5. Now you can remove original archive and the droptainer folder.

Enjoy your `apptainer` binary! 💫