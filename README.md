# Bash script to create Xbox PR

This is a simple setup to be able to create pull requests in Github and pull information from UHG Rally

- [Bash script to create Xbox PR](#bash-script-to-create-xbox-pr)
    - [Setup](#setup)
        - [Python 3](#python-3)
        - [GitHub CLI](#github-cli)
        - [Rally API Key](#rally-api-key)
    - [Run the script](#run-the-script)


## Disclosure

This has been simplified and hardcoded to work for the UHG/Xbox team. It can be modified to work for other teams by changing the format of the PR body in `.zshrc` and the team settings in `rally.cfg`
## Setup

It will be a bash function that will live in your `~/.zshrc` file. You will also have to save a python script and a configuration file somewhere in your directory and have the correct path setup on your `~/.zshrc` file.

### Python 3

It is reccomended to use virtualenv for python3. Here is how to set it up:

1. Install virtualenv

```bash
# Install virtualenv
pip3 install virtualenv
# Add the path of Python executable files to $PATH variables
echo 'export PATH="$HOME/Library/Python/3.8/bin:$PATH"' >> ~/.zshrc
# Make the settings effective
source ~/.zshrc
```

2. Create Python virtual environment

```bash
# Create a Python virtual environment named .p3
virtualenv -p python3 ~/.p3
# Make zsh to load the virtual environment automatically
echo 'source ~/.p3/bin/activate' >> ~/.zshrc
```

3.  Load virtualenv in current terminal

```bash
source ~/.zshrc
```

4. Test

```bash
python --version
# Output
# Python 3.x.x
```

## GitHub CLI

You need to setup [GitHub CLI](https://cli.github.com/manual/)

```bash
# Install GitHub CLI
brew install gh

# Authorize GH CLI
gh auth login
```

## Rally API Key

We will use the [Python toolkit for the Rally REST API](https://github.com/RallyTools/RallyRestToolkitForPython) to get information from the Rally ticket.

After you setup Python 3 on your virtualenv install `pyral`

```bash
pip install pyral
```

Get an API key from [Rally](https://rally1.rallydev.com/login/accounts/index.html#/keys) and [create a new key](https://rally1.rallydev.com/login/accounts/index.html#/keys/new).

image.png

Set the APIKEY value in the `rally.cfg` to the key you just generated.

## Run the script

Afer the steps above have been perfomed you are ready to go. All you need to do is reload `.zshrc` in your terminal and then run the command `pullrequest` from the directory of the repo you want to create a PR for. 
* Make sure that you already have the commit finalized. 
* If you haven't pushed the commit to origin it will ask you where to create the new branch.

```bash
# Reload .zshrc 
source ~/.zshrc
# create pull request
pullrequest
```

