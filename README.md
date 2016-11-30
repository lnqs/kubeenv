# kubeenv
`kubeenv` is a small util simplifying working with multiple
kubernetes-configurations on the same machine.

Using `kubeenv`, you can have a number of named configurations and activate them
on a per terminal basis.

## Installation
Copy `kubeenv.sh` from this directory somewhere to your filesystem.
Since it modifies the environment of your shell, it needs to be sources to work.

Add `source PATH/kubeenv.sh` to one of your shell's startup files
(`.bashrc`/`.zshrc`, for example)

## Usage
### Create/activate env

Run

```
kubeenv NAME
```

where NAME is the environments name to activate it. If it doesn't exists, it is
created.
You can use the usual commands to setup/change the configuration afterwards, and
it'll affect only this environment.

### Deactivating env
Execute

```
kubeenv-deactivate
```

to deactivate the current environment and use the global k8s configuration again.

### Deleting an env
Run

```
kubeenv-rm NAME
```

where NAME is the name of an existing environment to delete it.

### Disable prompt-change
If you want to disable adding the env's name to your shell's prompt, set the
environment-variable `KUBEENV_DISABLE_PROMPT` to `1`.
