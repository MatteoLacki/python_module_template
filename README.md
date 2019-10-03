# A very simple template for making Python modules and hosting them on Git.

## Usage

After downloading for the first time make `make_repo.sh` executable with
```{bash}
chmod +x make_repo.sh
```

Then, it makes sense to add it to the Path for good.
Use bash/zsh/fish specific way to do so.

Finally, navigate to the parent folder where you want to create the module.
Then, to create folder `test` and register it on github:
```{bash}
make_repo.sh test <your github name> <your email for pip>
```

Tating! Chew on this!